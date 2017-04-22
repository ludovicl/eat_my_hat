App.place = App.cable.subscriptions.create "PlaceChannel",

  connected: ->
    $('#filters').on "change", (event) =>
      @perform 'update_marks', {
        filters_id: {
          zipcode: $("#zipcode_select").val()
          website: $("#website_select").val()
          place_type: $("#place_type_select").val()
        }
      }

  received: (json_array) ->
    createSidebarLi = (json) ->
      '<li><a>' + json.name + '</a></li>'

    bindLiToMarker = ($li, marker) ->
      $li.on 'click', ->
        handler.getMap().setZoom 14
        marker.setMap handler.getMap()
        #because clusterer removes map property from marker
        marker.panTo()
        google.maps.event.trigger marker.getServiceObject(), 'click'

    createSidebar = (json_array) ->
      $('#sidebar-map').html('');
      _.each json_array, (json) ->
        $li = $(createSidebarLi(json))
        $li.appendTo '#sidebar-map'
        bindLiToMarker $li, json.marker

    handler = Gmaps.build('Google')
    handler.buildMap { internal: id: 'map' }, ->
      markers = handler.addMarkers(json_array)
      _.each json_array, (json, index) ->
        json.marker = markers[index]
      createSidebar json_array
      handler.bounds.extendWith markers
      handler.fitMapToBounds()
