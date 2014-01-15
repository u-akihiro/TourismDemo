/*
$(document).ready(function(){
  $.ajax({
    url: "/parking/show",
  }).done(function(data){
    
    var mapOption = {
      zoom: 13
    }
    
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    
    $.each(data.places, function(){
      $.each(this, function(){
        console.log(this["http://smartercity.jp/ug#title"][0]["value"]);
        console.log(this["http://smartercity.jp/ug#usageFee"][0]["value"]);
        console.log("--------------------------------");
      });
    });
  }).fail(function(data){
    console.log(data);
  });
});
*/