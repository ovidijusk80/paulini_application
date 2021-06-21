var citySel = -1;
var latitudes = [];
var longitudes = [];
var title = [];
var content = [];

function initialize(param) {

            if(citySel != -1){
                posArray = citySel.split(",");
                var mapOptions = {
                    center: { lat: parseFloat(posArray[0]), lng: parseFloat(posArray[1])},
                    scrollwheel: true,
                    zoomControl: true,
                    scaleControl: false,
                    panControl: false,
                    zoom: parseInt(posArray[2])
                };
            }else{
                var mapOptions = {
                    center: { lat: 55.3592298, lng: 23.9968567},
                    zoom: 7.5,
                    zoomControl: true,
                    scaleControl: false,
                    panControl: false,
                    scrollwheel: true
                };
            }

            if(citySel != -1){
                jQuery("#selector").val(citySel);
            }

            function addInfoWindow(marker, message) {
                var info = message;

                var infoWindow = new google.maps.InfoWindow({
                    content: message
                });

                google.maps.event.addListener(marker, 'click', function () {
                    infoWindow.open(map, marker);
                });
            }

            function decode(txt){
                var sp = document.createElement('span');
                sp.innerHTML = txt;
                return sp.innerHTML;
            }


            var zoom = 0;
            var latPos = 0;
            var lngPos = 0;

            jQuery("#selector").change(function(){
                posArray = jQuery( "#selector option:selected").val().split(",");
                var pos = new google.maps.LatLng(posArray[0], posArray[1]);
                map.setCenter(pos);
                map.setZoom(parseInt(posArray[2]));
            });


            var map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);

            var i = 0;
            for(;i<latitudes.length;){
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng (parseFloat(latitudes[i]), parseFloat(longitudes[i])),
                    title:  decode(title[i]),
                    map: map
                });
                addInfoWindow(marker, "<div class='info-window'>"+content[i]+"</div>");
                i++;;
            }

}
function addLocator(alt, long, name, details) {
    title.push(name);
    content.push(details);
    latitudes.push(alt);
    longitudes.push(long);
    console.log(latitudes);
    console.log(longitudes);
    console.log(title);
    console.log(content);
    return true;
}

function changeLocation() {
    posArray = jQuery("#selector option:selected").val().split(",");
    var pos = new google.maps.LatLng(posArray[0], posArray[1]);
    map.setCenter(pos);
    map.setZoom(parseInt(posArray[2]));
}

function changeLocation(location) {
    citySel = location;
    initialize(true);
}

function startMapping()
{
    initialize(true);
}