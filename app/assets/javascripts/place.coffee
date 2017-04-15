$ ->
# enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '200px'

handler = Gmaps.build('Google')

handler.buildMap {
  provider:
    disableDefaultUI: false
    center: new (google.maps.LatLng)(48.853, 2.35)
  internal: id: 'map'
}, ->
  markers = handler.addMarkers([])
  handler.bounds.extendWith markers
  handler.fitMapToBounds()
  $.get '/load_markers'
  return
