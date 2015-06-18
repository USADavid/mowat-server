var express	= require("express");
var bodyParser	= require("body-parser");
var mysql	= require("mysql");
var connection	= mysql.createConnection({
	host	: 'localhost',
	user	: 'root',
	password: 'teco',
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

app.use(bodyParser.text());

app.post('/', function(req, res) {
	//console.log(req);
	var json = JSON.parse(req.body);
	for(var component in json) {
		for(var timestamp in component) {
			var query = 'INSERT INTO `' + component + '` (';
			var keys, values = '';
			for(var data in timestamp) {
				keys += '`' + data + '`, ';
				values += "'" + timestamp[data] + "',";
			}
			keys = keys.slice(0, -2);
			values = values.slice(0, -1);
			query += keys + ') VALUES(' + values + ');';
			console.log(query);
			connection.query(query);
		}
	}
	//console.log(JSON.stringify(json));
});

app.listen(3000,function() {
	console.log("mowat-server started on port 3000");
})
