// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs

//= require admin/spree_core
//= require admin/spree_promo

//= require_tree .
//= require admin/spree_workshop
//= require admin/spree_addings_for_rodaben
//= require admin/spree_news

$(function () {
    $('input#check_all').live("change", function() {
      var checkboxes = $(this).closest('table').find('td').find(':checkbox');
      if($(this).is(':checked')) {
        checkboxes.attr('checked', 'checked');
      } else {
        checkboxes.removeAttr('checked');
      }
  });
});