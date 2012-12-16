// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs

//= require_tree .
//= require store/spree_workshop
//= require store/spree_addings_for_rodaben
//= require store/spree_news
//= require bootstrap


$(function() {
  // when the #country field changes
  $("select#marcas").live("change", function() {
    // make a POST call and replace the content
    var marca = $('select#marcas :selected').text().toLowerCase();
    if(marca == "") marca="0";
    $.get('/t/marcas/' + marca, function(data){
      $("#default").html(data);
    });
    return false;
  });
});



$(function() {
  // when the #country field changes
  $("select#search_vehicle").live("change", function() {
    // make a POST call and replace the content
    var vehicle = $('select#search_vehicle :selected').val().toLowerCase();
    if(vehicle == "") vehicle="0";
    $.get('/choose_vehicle/' + vehicle, function(data){
      $("#searchTyres").html(data);
    });
    return false;
  });
});

$(document).ajaxStart(function(){
  $("#progress").show();
});

$(document).ajaxStop(function(){
  $("#progress").hide();
});
