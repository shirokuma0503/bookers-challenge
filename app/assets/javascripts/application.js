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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require jquery.jpostal

var title = "javascriptが使えました";
alert(title);

$(document).ready(function () {
  $('.jquery').on('click', function(){
    $(this).css('color','red');
  });
});

$(function () {
  $(document).on('turbolinks:load', () => {
    $('#user_postal_code').jpostal({
      postcode: [
        '#user_postal_code'
      ],
      address: {
        "#user_prefecture_code": "%3",
        "#user_city": "%4%5",
        "#user_street": "%6%7"
      }
    });
  });
});