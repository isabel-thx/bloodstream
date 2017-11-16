// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require turbolinks
//= require social-share-button
//= require underscore
//= require gmaps/google
//= require_tree .
//= require flatpickr


// $(document).on('turbolinks:load',function(){
//       console.log("starting")
//       handler = Gmaps.build('Google');
//       console.log("google built");
//       console.log("<%= @event.longitude %>");
//       console.log("<%= @event.latitude %>");
//       handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
//         uluru = {"lat": <%= @event.latitude %>, "lng": <%= @event.longitude %>};
//         markers = handler.addMarkers([
//           {
//             "picture": {
//               "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
//               "width":  32,
//               "height": 32
//             },
//             "infowindow": "Maps"
//           }
//         ]);
//         var map = new google.maps.Map(document.getElementById('map'), {
//                 zoom: 16,
//                 center: uluru
//               });
//         var marker = new google.maps.Marker({
//                 position: uluru,
//                 map: map
//               });
//         handler.bounds.extendWith(markers);
//         handler.fitMapToBounds();
//       });
//     });