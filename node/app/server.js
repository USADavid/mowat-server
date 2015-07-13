var express	= require("express");
var bodyParser	= require("body-parser");
var mysql	= require("mysql");
var connection	= mysql.createConnection({
	host	: 'mysql',
	user	: 'root',
	password: '',
	database: 'mowat'
});
connection.connect(function(error) {
	if(!error) {
		console.log("Database connection established.");
	} else {
		console.log("Database connection failed.");
	}
});

var app		= express();

var modulesPath = require("path").join(__dirname, "modules");

require("fs").readdirSync(modulesPath).forEach(function(file) {
	require("./modules/" + file);
});

app.use(bodyParser.text({limit: '50mb'}));

app.post('/', function(req, res) {
	//console.log(req);
	var json = JSON.parse(req.body);
	for(var component in json) {
		if(json.hasOwnProperty(component)) {
			for(var timestamp in json[component]) {
				if(json[component].hasOwnProperty(timestamp)) {
					console.log(timestamp + ": " + JSON.stringify(json[component][timestamp]));
					var query = 'INSERT INTO `' + component + '` (';
					var keys = "`userID`, `timestamp`, ", values = "'1234','" + timestamp + "',";
					for(var data in json[component][timestamp]) {
						if(json[component][timestamp].hasOwnProperty(data)) {
							keys += '`' + data + '`, ';
							values += "'" + json[component][timestamp][data] + "',";
						}
					}
					keys = keys.slice(0, -2);
					values = values.slice(0, -1);
					query += keys + ') VALUES(' + values + ');';
					console.log("Keys: " + keys);
					console.log("Values: " + values);
					console.log(query);
					connection.query(query);
				}
			}
		}
	}
	//console.log(JSON.stringify(json));
});

app.listen(3000,function() {
	console.log("mowat-server started on port 3000");
})
