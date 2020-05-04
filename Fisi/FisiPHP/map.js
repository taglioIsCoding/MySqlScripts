console.log("Start")

console.log(latitude)
console.log(longetude)

var mymap = L.map('mapid').setView([latitude, longetude], 10);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoidGFnbGlvaXNjb2RpbmciLCJhIjoiY2p6anUzZHoxMGR0cTNscWE2ZHFwN3EzbyJ9._JJVq3peR2ykjC9RvV0yNw'
  }).addTo(mymap);
  var marker = L.marker([latitude, longetude]).addTo(mymap);