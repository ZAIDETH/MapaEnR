var mapa = L.map("mapa").setView([-12.0556056,-77.0865366],18)

var basemap = {
    OpenStreetMap: L.tileLayer(
     'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      {attribution: "&copy;<a href='https://openstreetmap.org/copyright'>OpenStreetMap</a> contibutors"}
      ),
    Satelital: L.tileLayer(
     'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
     {attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'}
     )
   };

OpenStreetMap=L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
        maxZoom:19,
        attribution:'&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(mapa);

var basemap2 = {
 
    "google": L.tileLayer('http://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}', 
    {attribution: 'google'
    })
    };

L.control.layers(basemap2).addTo(mapa);
// basemap2.OpenStreetMap.addTo(mapa);

var popup = L.responsivePopup()
        .setContent(
            '<h2>Ingeniería Geográfica 🌎<3 </h2>'
        );
L.marker([-12.0556056,-77.0865366]).addTo(mapa).bindPopup(popup).openPopup();