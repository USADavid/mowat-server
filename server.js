var express	= require("express");
var bodyParser	= require("body-parser");
var app		= express();

app.use(bodyParser.text());

app.post('/', function(req, res) {
	console.log(req);
	res.end("yes");
});

app.listen(3000,function() {
	console.log("mowat-server started on port 3000");
})
