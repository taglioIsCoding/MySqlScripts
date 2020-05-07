console.log("start");
console.log(Names);
console.log(lat);
console.log(lon);

var mymap = L.map('mapid').setView([0, 0], 1);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoidGFnbGlvaXNjb2RpbmciLCJhIjoiY2p6anUzZHoxMGR0cTNscWE2ZHFwN3EzbyJ9._JJVq3peR2ykjC9RvV0yNw'
  }).addTo(mymap);

 for(let i=0; i <Names.length; i++){
    var marker = L.marker([lat[i], lon[i]]).addTo(mymap);
    marker.bindPopup("<b>"+Names[i]+"</b><br>"+cit[i]).openPopup();
 }