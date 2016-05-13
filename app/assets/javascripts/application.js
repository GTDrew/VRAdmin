// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery-fileupload
//= require_tree .


$( document ).ready(function() {
  $('.bg-color').minicolors();
  $('.font-color').minicolors();
  $('.splash-color').minicolors();

  function readyToSubmit() {
    var allCheckBox = $("input[type=checkbox]").size();
    var countChecked = $('input[type=checkbox]').filter(":checked").size();

    if (countChecked == allCheckBox)  {
      $('#submit').removeClass('disabled');
    } else {
      $('#submit').addClass('disabled');
    }
  }

  readyToSubmit();

  $("input[type=checkbox]").on('click', function(){
    readyToSubmit();
  });

});
