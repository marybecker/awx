var express = require('express');
var mysql = require('mysql');//loading the driver module
var fs = require('fs')
var app = express()


var path = require('path')
app.use('/StationsMap', express.static(path.join(__dirname,'/app')));

try {
    var config = JSON.parse(fs.readFileSync('C:/Users/beckerm/Documents/configs/awqx_config.json', 'utf8'))
    console.log(config)
  } catch (err) {
    console.error(err)
  }

//all sites in the DB table.......
app.get('/StationsMap/sites',function(req,res){
	var conn = mysql.createConnection(config);
	conn.connect();
	var SQL = 'SELECT  staSeq,locationName, locationDescription, locationType, ylat, xlong, sourceMapScale, horizCollectMethod, horizRefDatum, stateCd, munName, subBasin, adbSegID, createUser, UNIX_TIMESTAMP(createDate) as createDate FROM awqx_test.stations;';
	console.log(SQL);
	conn.query(SQL,function(err,response,fields){
		if(err){ throw err; }
		console.log(response);
		var features = [];
	  for (var i = 0; i<response.length; i++){
		  var site = response[i].staSeq.toString();
	    var point = {
	      "type": "Feature",
		  "properties": {"staseq": response[i].staSeq,"name":response[i].locationName,
		  "descrip":response[i].locationDescription,"type":response[i].locationType,
		  "siteID":site.concat('-',response[i].locationName),"munName":response[i].munName,"subBasin":response[i].subBasin,
		  "createDate":response[i].createDate},
	      "geometry": {"type": "Point","coordinates":[response[i].xlong,response[i].ylat]}
	    }
	    features.push(point);
	  }
	  res.send({"type": "FeatureCollection","name": "sites","features":features})
	});
	conn.end();
});

app.get('/Stations',function(req,res){
	var conn = mysql.createConnection(config);
	conn.connect();
    var SQL = 'SELECT * FROM awqx_test.stations;';
	console.log(SQL);
	conn.query(SQL,function(err,response,fields){
		if(err){ throw err; }
		console.log(response);
		var features = [];
	  for (var i = 0; i<response.length; i++){
        var point = [response[i].staSeq.toString(),response[i].locationName,response[i].locationDescription,response[i].ylat,response[i].xlong]
	    features.push(point);
      }
      
      console.log(features);

    var delim = '\t';
    var s = "STA_SEQ" + delim + 
            "WaterbodyName"+delim + 
            "Description" + delim +
            "ylat" + delim +
            "xlong\n";   //header line
    for(var i=0; i<features.length; i++){  //convert each row of data to string
        var sid = features[i][0].toString();
        var name = features[i][1].toString();
        var descrip = features[i][2].toString();
        var lat = features[i][3].toString();
        var long = features[i][4].toString();
        s += sid+delim+name+delim+descrip+delim+lat+delim+long+'\n';
    }
    console.log(s);
    res.header('content-type', 'text/tab-separated-values; charset=utf-8');
    res.send(s)
        });
    conn.end();
});

app.get('/Projects',function(req,res){
	var conn = mysql.createConnection(config);
	conn.connect();
    var SQL = 'SELECT * FROM awqx_test.projects;';
	console.log(SQL);
	conn.query(SQL,function(err,response,fields){
		if(err){ throw err; }
		console.log(response);
		var features = [];
	  for (var i = 0; i<response.length; i++){
        var point = [response[i].ProjectIdentifier]
	    features.push(point);
      }
      
      console.log(features);

    var delim = '\t';
    var s = "ProjectIdentifier\n";   //header line
    for(var i=0; i<features.length; i++){  //convert each row of data to string
        var projectId = features[i][0].toString();
        s += projectId+'\n';
    }
    console.log(s);
    res.header('content-type', 'text/tab-separated-values; charset=utf-8');
    res.send(s)
        });
    conn.end();
});

//set routing pattern

//listen on 8080
//localhost:8080/sites
app.listen(8080, () => console.log('Listening on port 8080!'))
