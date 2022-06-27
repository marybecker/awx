var button = document.getElementById("actBtn")

button.addEventListener("click",function(){
    var prjID = prompt("Enter a valid project id");
    var actHREF = bldHref(prjID);
});

function bldHref (prjID){
    var base = "http://sdc-epafiling:8080/ChemActivities";
    var act = base + prjID;
    console.log(act);
    button.href = act
}