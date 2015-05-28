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

app.use(bodyParser.text());

app.post('/', function(req, res) {
	//console.log(req);
	var json = JSON.parse(req.body);
	console.log(JSON.stringify(json));
});

app.listen(3000,function() {
	console.log("mowat-server started on port 3000");
})
