var express = require('express');
var mysql = require('mysql');//loading the driver module
var fs = require('fs')
var app = express()

// PRODUCTION
var path = require('path')
app.use('/StationsMap', express.static(path.join(__dirname,'/app')));

try {
    var config = JSON.parse(fs.readFileSync('C:/Users/beckerm/Documents/configs/awqx_config.json', 'utf8'))
    console.log(config)
  } catch (err) {
    console.error(err)
  }

//Stations to json for mapping application
app.get('/StationsMap/sites',function(req,res){
	var conn = mysql.createConnection(config);
	conn.connect();
	var SQL = 'SELECT  staSeq,locationName, locationDescription, locationType, ylat, xlong, sourceMapScale, horizCollectMethod, horizRefDatum, stateCd, munName, subBasin, createUser, UNIX_TIMESTAMP(createDate) as createDate FROM awqx.stations;';
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

//Stations to tsv for download
app.get('/Stations',function(req,res){
	var conn = mysql.createConnection(config);
	conn.connect();
    var SQL = 'SELECT * FROM awqx.stations;';
	console.log(SQL);
	conn.query(SQL,function(err,response,fields){
		if(err){ throw err; }
		console.log(response);
		var features = [];
	  for (var i = 0; i<response.length; i++){
        var point = [response[i].staSeq.toString(),response[i].locationName,response[i].locationDescription,
        response[i].ylat,response[i].xlong,response[i].munName,response[i].subBasin,String(response[i].adbSegID),String(response[i].stationsCommentTxt),
        response[i].lastUpdateDate.toISOString().substring(0,10)]
	    features.push(point);
      }
      
      console.log(features);

    var delim = '\t';
    var s = "STA_SEQ" + delim + 
            "WaterbodyName"+delim + 
            "Description" + delim +
            "ylat" + delim +
            "xlong"+ delim +
            "munName"+ delim +
            "subBasin"+ delim +
            "adbSegID"+ delim +
            "stationsCommentTxt"+ delim +
            "lastUpdateDate\n";   //header line
    for(var i=0; i<features.length; i++){  //convert each row of data to string
        var sid = features[i][0].toString();
        var name = features[i][1].toString();
        var descrip = features[i][2].toString();
        var lat = features[i][3].toString();
        var long = features[i][4].toString();
        var munName = features[i][5].toString();
        var subBasin = features[i][6].toString();
        var adbSegID = features[i][7].toString();
        var stationsCommentTxt = features[i][8].toString();
        var lastUpdateDate = features[i][9].toString();
        s += sid+delim+name+delim+descrip+delim+lat+delim+long+delim+munName+delim+subBasin+delim+adbSegID+delim+'"'+stationsCommentTxt+'"'+delim+lastUpdateDate+'\n';
    }
    console.log(s);
    res.header('content-type', 'text/tab-separated-values; charset=utf-8');
    res.send(s)
        });
    conn.end();
});

//Projects to tsv for download
app.get('/Projects',function(req,res){
	var conn = mysql.createConnection(config);
	conn.connect();
    var SQL = 'SELECT * FROM awqx.projects;';
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

//Chem activities to tsv for download.  Clean up using metadata queries in MySQL in the future and for future services.
// app.get('/ChemActivities:prj',function(req,res){
//   var prj = req.params['prj']
// 	var conn = mysql.createConnection(config);
// 	conn.connect();
//     var SQL = 'SELECT * FROM awqx.activitychem WHERE ProjectIdentifier ="' + prj + '";';
// 	console.log(SQL);
// 	conn.query(SQL,function(err,response,fields){
// 		if(err){ throw err; }
// 		console.log(response);
// 		var features = [];
// 	  for (var i = 0; i<response.length; i++){
//         var point = [response[i].ProjectIdentifier, response[i].staSeq.toString(), 
//         response[i].ActivityIdentifier, response[i].ActivityTypeCode, 
//         response[i].ActivityMediaName, response[i].ActivityMediaSubdivisionName, 
//         response[i].ActivityStartDate.toISOString().substring(0,10), response[i].ActivityTime, 
//         response[i].ActivityTimeZoneCodetimezone, 
//         response[i].SampleCollectionMethodIdentifier, 
//         response[i].SampleCollectionEquipmentName, 
//         response[i].SampleCollectionEquipmentCommentText, 
//         response[i].ActivityConductingOrganizationText, 
//         response[i].ActivityCommentText, response[i].ActContactLead, 
//         response[i].ActFieldCrew, response[i].SamplePreparationMethodIdentifier, 
//         response[i].ActivityRelativeDepthName, 
//         response[i].ActivityTopDepthMeasureValue.toString(), 
//         response[i].ActivityTopDepthMeasureUnitCode, 
//         response[i].ActivityBottomDepthMeasureValue.toString(), 
//         response[i].ActivityBottomDepthMeasureUnitCode, 
//         response[i].InstreamLocation.toString(), response[i].LabAccession.toString(), 
//         response[i].LaboratoryName, response[i].ActivityYlat.toString(), 
//         response[i].ActivityXlong.toString(), response[i].ActivityhorizCollectMethod, 
//         response[i].ActivityhorizRefDatum, response[i].createDate.toISOString().substring(0,10), response[i].createUser, 
//         response[i].lastUpdateDate.toISOString().substring(0,10), response[i].lastUpdateUser]
// 	    features.push(point);
//       }
      
//       console.log(features);

//     var delim = '\t';
//     var s = "ProjectIdentifier"+ delim+ "staSeq"+ delim+ "ActivityIdentifier"+ delim+ 
//     "ActivityTypeCode"+ delim+ "ActivityMediaName"+ delim+ "ActivityMediaSubdivisionName"+ 
//     delim+ "ActivityStartDate"+ delim+ "ActivityTime"+ delim+ "ActivityTimeZoneCodetimezone"+ 
//     delim+ "SampleCollectionMethodIdentifier"+ delim+ "SampleCollectionEquipmentName"+ 
//     delim+ "SampleCollectionEquipmentCommentText"+ delim+ "ActivityConductingOrganizationText"
//     + delim+ "ActivityCommentText"+ delim+ "ActContactLead"+ delim+ "ActFieldCrew"+ 
//     delim+ "SamplePreparationMethodIdentifier"+ delim+ "ActivityRelativeDepthName"+ 
//     delim+ "ActivityTopDepthMeasureValue"+ delim+ "ActivityTopDepthMeasureUnitCode"+ 
//     delim+ "ActivityBottomDepthMeasureValue"+ delim+ "ActivityBottomDepthMeasureUnitCode"+ 
//     delim+ "InstreamLocation"+ delim+ "LabAccession"+ delim+ "LaboratoryName"+ 
//     delim+ "ActivityYlat"+ delim+ "ActivityXlong"+ delim+ "ActivityhorizCollectMethod"+ 
//     delim+ "ActivityhorizRefDatum"+ delim+ "createDate"+ delim+ "createUser"+ 
//     delim+ "lastUpdateDate"+ delim+ "lastUpdateUser\n";   //header line
//     for(var i=0; i<features.length; i++){  //convert each row of data to string
//       var ProjectIdentifier= features[i][0].toString() 
//       var staSeq= features[i][1].toString() 
//       var ActivityIdentifier= features[i][2].toString() 
//       var ActivityTypeCode= features[i][3].toString() 
//       var ActivityMediaName= features[i][4].toString() 
//       var ActivityMediaSubdivisionName= features[i][5].toString() 
//       var ActivityStartDate= features[i][6].toString() 
//       var ActivityTime= features[i][7].toString() 
//       var ActivityTimeZoneCodetimezone= features[i][8].toString() 
//       var SampleCollectionMethodIdentifier= features[i][9].toString() 
//       var SampleCollectionEquipmentName= features[i][10].toString() 
//       var SampleCollectionEquipmentCommentText= features[i][11].toString() 
//       var ActivityConductingOrganizationText= features[i][12].toString() 
//       var ActivityCommentText= features[i][13].toString() 
//       var ActContactLead= features[i][14].toString() 
//       var ActFieldCrew= features[i][15].toString() 
//       var SamplePreparationMethodIdentifier= features[i][16].toString() 
//       var ActivityRelativeDepthName= features[i][17].toString() 
//       var ActivityTopDepthMeasureValue= features[i][18].toString() 
//       var ActivityTopDepthMeasureUnitCode= features[i][19].toString() 
//       var ActivityBottomDepthMeasureValue= features[i][20].toString() 
//       var ActivityBottomDepthMeasureUnitCode= features[i][21].toString() 
//       var InstreamLocation= features[i][22].toString() 
//       var LabAccession= features[i][23].toString() 
//       var LaboratoryName= features[i][24].toString() 
//       var ActivityYlat= features[i][25].toString() 
//       var ActivityXlong= features[i][26].toString() 
//       var ActivityhorizCollectMethod= features[i][27].toString() 
//       var ActivityhorizRefDatum= features[i][28].toString() 
//       var createDate= features[i][29].toString() 
//       var createUser= features[i][30].toString() 
//       var lastUpdateDate= features[i][31].toString() 
//       var lastUpdateUser= features[i][32].toString()
//         s += ProjectIdentifier  + delim +  staSeq  + delim +  ActivityIdentifier  + delim +  
//         ActivityTypeCode  + delim +  ActivityMediaName  + delim +  ActivityMediaSubdivisionName  + 
//         delim +  ActivityStartDate  + delim +  ActivityTime  + delim +  ActivityTimeZoneCodetimezone  + 
//         delim +  SampleCollectionMethodIdentifier  + delim +  SampleCollectionEquipmentName  + 
//         delim +  SampleCollectionEquipmentCommentText  + delim +  ActivityConductingOrganizationText  + 
//         delim +  ActivityCommentText  + delim +  ActContactLead  + delim +  ActFieldCrew  + 
//         delim +  SamplePreparationMethodIdentifier  + delim +  ActivityRelativeDepthName  + 
//         delim +  ActivityTopDepthMeasureValue  + delim +  ActivityTopDepthMeasureUnitCode  + 
//         delim +  ActivityBottomDepthMeasureValue  + delim +  ActivityBottomDepthMeasureUnitCode  + 
//         delim +  InstreamLocation  + delim +  LabAccession  + delim +  LaboratoryName  + delim +  
//         ActivityYlat  + delim +  ActivityXlong  + delim +  ActivityhorizCollectMethod  + delim +  
//         ActivityhorizRefDatum  + delim +  createDate  + delim +  createUser  + delim +  lastUpdateDate  + 
//         delim +  lastUpdateUser +'\n';
//     }
//     console.log(s);
//     res.header('content-type', 'text/tab-separated-values; charset=utf-8');
//     res.send(s)
//         });
//     conn.end();
// });

// //Bio activities to tsv for download. 
// app.get('/BioActivities:prj',function(req,res){
//   var prj = req.params['prj']
//     var conn = mysql.createConnection(config);
//     conn.connect();
//     var SQL = 'SELECT * FROM awqx.activitybio WHERE ProjectIdentifier ="' + prj + '";';
//     console.log(SQL);
//     conn.query(SQL,function(err,response,fields){
//         if(err){ throw err; }
//         console.log(response);
//         var features = [];
//       for (var i = 0; i<response.length; i++){
//         //loop over the columns...
//         var point = [
//             response[i].ProjectIdentifier.toString(),
//             response[i].staSeq.toString(),
//             response[i].ActivityIdentifier.toString(),
//             response[i].ActivityTypeCode.toString(),
//             response[i].ActivityMediaName.toString(),
//             response[i].ActivityStartDate.toISOString().substring(0,10),
//             response[i].ActivityTime.toString(),
//             response[i].ActivityTimeZoneCodetimezone.toString(),
//             response[i].SampleCollectionMethodIdentifier.toString(),
//             response[i].SampleCollectionEquipmentName.toString(),
//             response[i].SampleCollectionEquipmentCommentText.toString(),
//             response[i].ActivityConductingOrganizationText.toString(),
//             response[i].ActivityCommentText.toString(),
//             response[i].ActContactLead.toString(),
//             response[i].ActFieldCrew.toString(),
//             response[i].AssemblageSampledName.toString(),
//             response[i].HabitatSelectionMethod.toString(),
//             response[i].CollectionDurationMeasureValue.toString(),
//             response[i].CollectionDurationMeasureUnitCode.toString(),
//             response[i].ReachLengthMeasureValue.toString(),
//             response[i].ReachLengthMeasureUnitCode.toString(),
//             response[i].ReachWidthMeasureValue.toString(),
//             response[i].ReachWidthMeasureUnitCode.toString(),
//             response[i].PassCount.toString(),
//             response[i].Amps.toString(),
//             response[i].Pulses.toString(),
//             response[i].CollectionEfficiencyEst.toString(),
//             response[i].TotalEnergizedMeasure.toString(),
//             response[i].TotalEnergizedMeasureUnit.toString(),
//             response[i].Volts.toString(),
//             response[i].DutyCycle.toString(),
//             response[i].createDate.toISOString().substring(0,10),
//             response[i].createUser.toString(),
//             response[i].lastUpdateDate.toISOString().substring(0,10),
//             response[i].lastUpdateUser.toString()
//       ]
//         features.push(point);
//       }
      
//       console.log(features);

//     var delim = '\t';
//     var s = 
//     "ProjectIdentifier"+ delim +
//     "staSeq"+ delim +
//     "ActivityIdentifier"+ delim +
//     "ActivityTypeCode"+ delim +
//     "ActivityMediaName"+ delim +
//     "ActivityStartDate"+ delim +
//     "ActivityTime"+ delim +
//     "ActivityTimeZoneCodetimezone"+ delim +
//     "SampleCollectionMethodIdentifier"+ delim +
//     "SampleCollectionEquipmentName"+ delim +
//     "SampleCollectionEquipmentCommentText"+ delim +
//     "ActivityConductingOrganizationText"+ delim +
//     "ActivityCommentText"+ delim +
//     "ActContactLead"+ delim +"ActFieldCrew"+ delim +
//     "AssemblageSampledName"+ delim +
//     "HabitatSelectionMethod"+ delim +
//     "CollectionDurationMeasureValue"+ delim +
//     "CollectionDurationMeasureUnitCode"+ delim +
//     "ReachLengthMeasureValue"+ delim +
//     "ReachLengthMeasureUnitCode"+ delim +
//     "ReachWidthMeasureValue"+ delim +
//     "ReachWidthMeasureUnitCode"+ delim +
//     "PassCount"+ delim +"Amps"+ delim +
//     "Pulses"+ delim +
//     "CollectionEfficiencyEst"+ delim +
//     "TotalEnergizedMeasure"+ delim +
//     "TotalEnergizedMeasureUnit"+ delim +
//     "Volts"+ delim +
//     "DutyCycle"+ delim +
//     "createDate"+ delim +
//     "createUser"+ delim +
//     "lastUpdateDate"+ delim +
//     "lastUpdateUser\n";   //header line

//     for(var i=0; i<features.length; i++){  //convert each row of data to string
//       var ProjectIdentifier= features[i][0].toString()
//       var staSeq= features[i][1].toString()
//       var ActivityIdentifier= features[i][2].toString()
//       var ActivityTypeCode= features[i][3].toString()
//       var ActivityMediaName= features[i][4].toString()
//       var ActivityStartDate= features[i][5].toString()
//       var ActivityTime= features[i][6].toString()
//       var ActivityTimeZoneCodetimezone= features[i][7].toString()
//       var SampleCollectionMethodIdentifier= features[i][8].toString()
//       var SampleCollectionEquipmentName= features[i][9].toString()
//       var SampleCollectionEquipmentCommentText= features[i][10].toString()
//       var ActivityConductingOrganizationText= features[i][11].toString()
//       var ActivityCommentText= features[i][12].toString()
//       var ActContactLead= features[i][13].toString()
//       var ActFieldCrew= features[i][14].toString()
//       var AssemblageSampledName= features[i][15].toString()
//       var HabitatSelectionMethod= features[i][16].toString()
//       var CollectionDurationMeasureValue= features[i][17].toString()
//       var CollectionDurationMeasureUnitCode= features[i][18].toString()
//       var ReachLengthMeasureValue= features[i][19].toString()
//       var ReachLengthMeasureUnitCode= features[i][20].toString()
//       var ReachWidthMeasureValue= features[i][21].toString()
//       var ReachWidthMeasureUnitCode= features[i][22].toString()
//       var PassCount= features[i][23].toString()
//       var Amps= features[i][24].toString()
//       var Pulses= features[i][25].toString()
//       var CollectionEfficiencyEst= features[i][26].toString()
//       var TotalEnergizedMeasure= features[i][27].toString()
//       var TotalEnergizedMeasureUnit= features[i][28].toString()
//       var Volts= features[i][29].toString()
//       var DutyCycle= features[i][30].toString()
//       var createDate= features[i][31].toString()
//       var createUser= features[i][32].toString()
//       var lastUpdateDate= features[i][33].toString()
//       var lastUpdateUser= features[i][34].toString()

//       s += 
//       ProjectIdentifier+ delim +
//       staSeq+ delim +
//       ActivityIdentifier+ delim +
//       ActivityTypeCode+ delim +
//       ActivityMediaName+ delim +
//       ActivityStartDate+ delim +
//       ActivityTime+ delim +
//       ActivityTimeZoneCodetimezone+ delim +
//       SampleCollectionMethodIdentifier+ delim +
//       SampleCollectionEquipmentName+ delim +
//       SampleCollectionEquipmentCommentText+ delim +
//       ActivityConductingOrganizationText+ delim +
//       ActivityCommentText+ delim +
//       ActContactLead+ delim +
//       ActFieldCrew+ delim +
//       AssemblageSampledName+ delim +
//       HabitatSelectionMethod+ delim +
//       CollectionDurationMeasureValue+ delim +
//       CollectionDurationMeasureUnitCode+ delim +
//       ReachLengthMeasureValue+ delim +
//       ReachLengthMeasureUnitCode+ delim +
//       ReachWidthMeasureValue+ delim +
//       ReachWidthMeasureUnitCode+ delim +
//       PassCount+ delim +
//       Amps+ delim +
//       Pulses+ delim +
//       CollectionEfficiencyEst+ delim +
//       TotalEnergizedMeasure+ delim +
//       TotalEnergizedMeasureUnit+ delim +
//       Volts+ delim +
//       DutyCycle+ delim +
//       createDate+ delim +
//       createUser+ delim +
//       lastUpdateDate+ delim +
//       lastUpdateUser+ delim
//       +'\n';
//     }
//     console.log(s);
//     res.header('content-type', 'text/tab-separated-values; charset=utf-8');
//     res.send(s)
//         });
//     conn.end();
// });

// TESTING
var path = require('path')
app.use('/StationsMapTESTING', express.static(path.join(__dirname,'/app_TEST')));

try {
    var configTEST = JSON.parse(fs.readFileSync('C:/Users/beckerm/Documents/configs/awqx_config_test.json', 'utf8'))
    console.log(configTEST)
} catch (err) {
    console.error(err)
}

// TESTING Stations to json for mapping application
app.get('/StationsMap/sites_TEST',function(req,res){
	var conn = mysql.createConnection(configTEST);
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

//Stations to tsv for download
app.get('/Stations_TEST',function(req,res){
	var conn = mysql.createConnection(configTEST);
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

//Projects to tsv for download
app.get('/Projects_TEST',function(req,res){
	var conn = mysql.createConnection(configTEST);
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

// //Chem activities to tsv for download.  Clean up using metadata queries in MySQL in the future and for future services.
// app.get('/ChemActivitiesTEST/:prj',function(req,res){
//   var prj = req.params['prj']
// 	var conn = mysql.createConnection(configTEST);
// 	conn.connect();
//     var SQL = 'SELECT * FROM awqx_test.activitychem WHERE ProjectIdentifier ="' + prj + '";';
// 	console.log(SQL);
// 	conn.query(SQL,function(err,response,fields){
// 		if(err){ throw err; }
// 		console.log(response);
// 		var features = [];
// 	  for (var i = 0; i<response.length; i++){
//         var point = [response[i].ProjectIdentifier, response[i].staSeq.toString(), 
//         response[i].ActivityIdentifier, response[i].ActivityTypeCode, 
//         response[i].ActivityMediaName, response[i].ActivityMediaSubdivisionName, 
//         response[i].ActivityStartDate.toISOString().substring(0,10), response[i].ActivityTime, 
//         response[i].ActivityTimeZoneCodetimezone, 
//         response[i].SampleCollectionMethodIdentifier, 
//         response[i].SampleCollectionEquipmentName, 
//         response[i].SampleCollectionEquipmentCommentText, 
//         response[i].ActivityConductingOrganizationText, 
//         response[i].ActivityCommentText, response[i].ActContactLead, 
//         response[i].ActFieldCrew, response[i].SamplePreparationMethodIdentifier, 
//         response[i].ActivityRelativeDepthName, 
//         response[i].ActivityTopDepthMeasureValue.toString(), 
//         response[i].ActivityTopDepthMeasureUnitCode, 
//         response[i].ActivityBottomDepthMeasureValue.toString(), 
//         response[i].ActivityBottomDepthMeasureUnitCode, 
//         response[i].InstreamLocation.toString(), response[i].LabAccession.toString(), 
//         response[i].LaboratoryName, response[i].ActivityYlat.toString(), 
//         response[i].ActivityXlong.toString(), response[i].ActivityhorizCollectMethod, 
//         response[i].ActivityhorizRefDatum, response[i].createDate.toISOString().substring(0,10), response[i].createUser, 
//         response[i].lastUpdateDate.toISOString().substring(0,10), response[i].lastUpdateUser]
// 	    features.push(point);
//       }
      
//       console.log(features);

//     var delim = '\t';
//     var s = "ProjectIdentifier"+ delim+ "staSeq"+ delim+ "ActivityIdentifier"+ delim+ 
//     "ActivityTypeCode"+ delim+ "ActivityMediaName"+ delim+ "ActivityMediaSubdivisionName"+ 
//     delim+ "ActivityStartDate"+ delim+ "ActivityTime"+ delim+ "ActivityTimeZoneCodetimezone"+ 
//     delim+ "SampleCollectionMethodIdentifier"+ delim+ "SampleCollectionEquipmentName"+ 
//     delim+ "SampleCollectionEquipmentCommentText"+ delim+ "ActivityConductingOrganizationText"
//     + delim+ "ActivityCommentText"+ delim+ "ActContactLead"+ delim+ "ActFieldCrew"+ 
//     delim+ "SamplePreparationMethodIdentifier"+ delim+ "ActivityRelativeDepthName"+ 
//     delim+ "ActivityTopDepthMeasureValue"+ delim+ "ActivityTopDepthMeasureUnitCode"+ 
//     delim+ "ActivityBottomDepthMeasureValue"+ delim+ "ActivityBottomDepthMeasureUnitCode"+ 
//     delim+ "InstreamLocation"+ delim+ "LabAccession"+ delim+ "LaboratoryName"+ 
//     delim+ "ActivityYlat"+ delim+ "ActivityXlong"+ delim+ "ActivityhorizCollectMethod"+ 
//     delim+ "ActivityhorizRefDatum"+ delim+ "createDate"+ delim+ "createUser"+ 
//     delim+ "lastUpdateDate"+ delim+ "lastUpdateUser\n";   //header line
//     for(var i=0; i<features.length; i++){  //convert each row of data to string
//       var ProjectIdentifier= features[i][0].toString() 
//       var staSeq= features[i][1].toString() 
//       var ActivityIdentifier= features[i][2].toString() 
//       var ActivityTypeCode= features[i][3].toString() 
//       var ActivityMediaName= features[i][4].toString() 
//       var ActivityMediaSubdivisionName= features[i][5].toString() 
//       var ActivityStartDate= features[i][6].toString() 
//       var ActivityTime= features[i][7].toString() 
//       var ActivityTimeZoneCodetimezone= features[i][8].toString() 
//       var SampleCollectionMethodIdentifier= features[i][9].toString() 
//       var SampleCollectionEquipmentName= features[i][10].toString() 
//       var SampleCollectionEquipmentCommentText= features[i][11].toString() 
//       var ActivityConductingOrganizationText= features[i][12].toString() 
//       var ActivityCommentText= features[i][13].toString() 
//       var ActContactLead= features[i][14].toString() 
//       var ActFieldCrew= features[i][15].toString() 
//       var SamplePreparationMethodIdentifier= features[i][16].toString() 
//       var ActivityRelativeDepthName= features[i][17].toString() 
//       var ActivityTopDepthMeasureValue= features[i][18].toString() 
//       var ActivityTopDepthMeasureUnitCode= features[i][19].toString() 
//       var ActivityBottomDepthMeasureValue= features[i][20].toString() 
//       var ActivityBottomDepthMeasureUnitCode= features[i][21].toString() 
//       var InstreamLocation= features[i][22].toString() 
//       var LabAccession= features[i][23].toString() 
//       var LaboratoryName= features[i][24].toString() 
//       var ActivityYlat= features[i][25].toString() 
//       var ActivityXlong= features[i][26].toString() 
//       var ActivityhorizCollectMethod= features[i][27].toString() 
//       var ActivityhorizRefDatum= features[i][28].toString() 
//       var createDate= features[i][29].toString() 
//       var createUser= features[i][30].toString() 
//       var lastUpdateDate= features[i][31].toString() 
//       var lastUpdateUser= features[i][32].toString()
//         s += ProjectIdentifier  + delim +  staSeq  + delim +  ActivityIdentifier  + delim +  
//         ActivityTypeCode  + delim +  ActivityMediaName  + delim +  ActivityMediaSubdivisionName  + 
//         delim +  ActivityStartDate  + delim +  ActivityTime  + delim +  ActivityTimeZoneCodetimezone  + 
//         delim +  SampleCollectionMethodIdentifier  + delim +  SampleCollectionEquipmentName  + 
//         delim +  SampleCollectionEquipmentCommentText  + delim +  ActivityConductingOrganizationText  + 
//         delim +  ActivityCommentText  + delim +  ActContactLead  + delim +  ActFieldCrew  + 
//         delim +  SamplePreparationMethodIdentifier  + delim +  ActivityRelativeDepthName  + 
//         delim +  ActivityTopDepthMeasureValue  + delim +  ActivityTopDepthMeasureUnitCode  + 
//         delim +  ActivityBottomDepthMeasureValue  + delim +  ActivityBottomDepthMeasureUnitCode  + 
//         delim +  InstreamLocation  + delim +  LabAccession  + delim +  LaboratoryName  + delim +  
//         ActivityYlat  + delim +  ActivityXlong  + delim +  ActivityhorizCollectMethod  + delim +  
//         ActivityhorizRefDatum  + delim +  createDate  + delim +  createUser  + delim +  lastUpdateDate  + 
//         delim +  lastUpdateUser +'\n';
//     }
//     console.log(s);
//     res.header('content-type', 'text/tab-separated-values; charset=utf-8');
//     res.send(s)
//         });
//     conn.end();
// });

// //Bio activities to tsv for download. 
// app.get('/BioActivities_TEST/:prj',function(req,res){
//   var prj = req.params['prj']
//     var conn = mysql.createConnection(configTEST);
//     conn.connect();
//     var SQL = 'SELECT * FROM awqx_test.activitybio WHERE ProjectIdentifier ="' + prj + '";';
//     console.log(SQL);
//     conn.query(SQL,function(err,response,fields){
//         if(err){ throw err; }
//         console.log(response);
//         var features = [];
//       for (var i = 0; i<response.length; i++){
//         var point = [
//           response[i].LabAccession.toString(),
//           response[i].ProjectIdentifier.toString(),
//           response[i].staSeq.toString(),
//           response[i].ActivityIdentifier.toString(),
//           response[i].ActivityTypeCode.toString(),
//           response[i].ActivityMediaName.toString(),
//           response[i].ActivityStartDate.toISOString().substring(0,10),
//           response[i].ActivityTime.toString(),
//           response[i].ActivityTimeZoneCodetimezone.toString(),
//           response[i].SampleCollectionMethodIdentifier.toString(),
//           response[i].SampleCollectionEquipmentName.toString(),
//           response[i].SampleCollectionEquipmentCommentText.toString(),
//           response[i].ActivityConductingOrganizationText.toString(),
//           response[i].ActivityCommentText.toString(),
//           response[i].ActContactLead.toString(),
//           response[i].ActFieldCrew.toString(),
//           response[i].AssemblageSampledName.toString(),
//           response[i].HabitatSelectionMethod.toString(),
//           response[i].CollectionDurationMeasureValue.toString(),
//           response[i].CollectionDurationMeasureUnitCode.toString(),
//           response[i].ReachLengthMeasureValue.toString(),
//           response[i].ReachLengthMeasureUnitCode.toString(),
//           response[i].ReachWidthMeasureValue.toString(),
//           response[i].ReachWidthMeasureUnitCode.toString(),
//           response[i].PassCount.toString(),
//           response[i].Pass.toString(),
//           response[i].ZoneCount.toString(),
//           response[i].Zone.toString(),
//           response[i].Amps.toString(),
//           response[i].Pulses.toString(),
//           response[i].CollectionEfficiencyEst.toString(),
//           response[i].TotalEnergizedMeasure.toString(),
//           response[i].TotalEnergizedMeasureUnit.toString(),
//           response[i].Volts.toString(),
//           response[i].DutyCycle.toString(),
//           response[i].createDate.toISOString().substring(0,10),
//           response[i].createUser.toString(),
//           response[i].lastUpdateDate.toISOString().substring(0,10),
//           response[i].lastUpdateUser.toString()
//     ]
//       features.push(point);
//     }
    
//     console.log(features);

//   var delim = '\t';
//   var s = 
//   "LabAccession"+ delim +
//   "ProjectIdentifier"+ delim +
//   "staSeq"+ delim +
//   "ActivityIdentifier"+ delim +
//   "ActivityTypeCode"+ delim +
//   "ActivityMediaName"+ delim +
//   "ActivityStartDate"+ delim +
//   "ActivityTime"+ delim +
//   "ActivityTimeZoneCodetimezone"+ delim +
//   "SampleCollectionMethodIdentifier"+ delim +
//   "SampleCollectionEquipmentName"+ delim +
//   "SampleCollectionEquipmentCommentText"+ delim +
//   "ActivityConductingOrganizationText"+ delim +
//   "ActivityCommentText"+ delim +
//   "ActContactLead"+ delim +"ActFieldCrew"+ delim +
//   "AssemblageSampledName"+ delim +
//   "HabitatSelectionMethod"+ delim +
//   "CollectionDurationMeasureValue"+ delim +
//   "CollectionDurationMeasureUnitCode"+ delim +
//   "ReachLengthMeasureValue"+ delim +
//   "ReachLengthMeasureUnitCode"+ delim +
//   "ReachWidthMeasureValue"+ delim +
//   "ReachWidthMeasureUnitCode"+ delim +
//   "PassCount"+ delim +
//   "Pass"+ delim +
//   "ZoneCount"+ delim +
//   "Zone"+ delim +
//   "Amps"+ delim +
//   "Pulses"+ delim +
//   "CollectionEfficiencyEst"+ delim +
//   "TotalEnergizedMeasure"+ delim +
//   "TotalEnergizedMeasureUnit"+ delim +
//   "Volts"+ delim +
//   "DutyCycle"+ delim +
//   "createDate"+ delim +
//   "createUser"+ delim +
//   "lastUpdateDate"+ delim +
//   "lastUpdateUser\n";   //header line

//   for(var i=0; i<features.length; i++){  //convert each row of data to string
//     var LabAccession= features[i][0].toString()
//     var ProjectIdentifier= features[i][1].toString()
//     var staSeq= features[i][2].toString()
//     var ActivityIdentifier= features[i][3].toString()
//     var ActivityTypeCode= features[i][4].toString()
//     var ActivityMediaName= features[i][5].toString()
//     var ActivityStartDate= features[i][6].toString()
//     var ActivityTime= features[i][7].toString()
//     var ActivityTimeZoneCodetimezone= features[i][8].toString()
//     var SampleCollectionMethodIdentifier= features[i][9].toString()
//     var SampleCollectionEquipmentName= features[i][10].toString()
//     var SampleCollectionEquipmentCommentText= features[i][11].toString()
//     var ActivityConductingOrganizationText= features[i][12].toString()
//     var ActivityCommentText= features[i][13].toString()
//     var ActContactLead= features[i][14].toString()
//     var ActFieldCrew= features[i][15].toString()
//     var AssemblageSampledName= features[i][16].toString()
//     var HabitatSelectionMethod= features[i][17].toString()
//     var CollectionDurationMeasureValue= features[i][18].toString()
//     var CollectionDurationMeasureUnitCode= features[i][19].toString()
//     var ReachLengthMeasureValue= features[i][20].toString()
//     var ReachLengthMeasureUnitCode= features[i][21].toString()
//     var ReachWidthMeasureValue= features[i][22].toString()
//     var ReachWidthMeasureUnitCode= features[i][23].toString()
//     var PassCount= features[i][24].toString()
//     var Pass= features[i][25].toString()
//     var ZoneCount= features[i][26].toString()
//     var Zone= features[i][27].toString()
//     var Amps= features[i][28].toString()
//     var Pulses= features[i][29].toString()
//     var CollectionEfficiencyEst= features[i][30].toString()
//     var TotalEnergizedMeasure= features[i][31].toString()
//     var TotalEnergizedMeasureUnit= features[i][32].toString()
//     var Volts= features[i][33].toString()
//     var DutyCycle= features[i][34].toString()
//     var createDate= features[i][35].toString()
//     var createUser= features[i][36].toString()
//     var lastUpdateDate= features[i][37].toString()
//     var lastUpdateUser= features[i][38].toString()

//     s += 
//     LabAccession+ delim +
//     ProjectIdentifier+ delim +
//     staSeq+ delim +
//     ActivityIdentifier+ delim +
//     ActivityTypeCode+ delim +
//     ActivityMediaName+ delim +
//     ActivityStartDate+ delim +
//     ActivityTime+ delim +
//     ActivityTimeZoneCodetimezone+ delim +
//     SampleCollectionMethodIdentifier+ delim +
//     SampleCollectionEquipmentName+ delim +
//     SampleCollectionEquipmentCommentText+ delim +
//     ActivityConductingOrganizationText+ delim +
//     ActivityCommentText+ delim +
//     ActContactLead+ delim +
//     ActFieldCrew+ delim +
//     AssemblageSampledName+ delim +
//     HabitatSelectionMethod+ delim +
//     CollectionDurationMeasureValue+ delim +
//     CollectionDurationMeasureUnitCode+ delim +
//     ReachLengthMeasureValue+ delim +
//     ReachLengthMeasureUnitCode+ delim +
//     ReachWidthMeasureValue+ delim +
//     ReachWidthMeasureUnitCode+ delim +
//     PassCount+ delim +
//     Pass+ delim +
//     ZoneCount+ delim +
//     Zone+ delim +
//     Amps+ delim +
//     Pulses+ delim +
//     CollectionEfficiencyEst+ delim +
//     TotalEnergizedMeasure+ delim +
//     TotalEnergizedMeasureUnit+ delim +
//     Volts+ delim +
//     DutyCycle+ delim +
//     createDate+ delim +
//     createUser+ delim +
//     lastUpdateDate+ delim +
//     lastUpdateUser+ delim
//     +'\n';
//     }
//     console.log(s);
//     res.header('content-type', 'text/tab-separated-values; charset=utf-8');
//     res.send(s)
//         });
//     conn.end();
// });


//set routing pattern
//listen on 8080
//localhost:8080/sites
app.listen(8080, () => console.log('Listening on port 8080!'))

// create loop function for each query
// for(c in response[i]){
//   console.log(c.toString());
// }
