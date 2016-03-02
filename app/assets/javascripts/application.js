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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets
// $(document).ready(function(){
// $('button').click(function(){
//   $('.bio').toggle();
// });
// });

//  $(document).ready(function(){
//     $('button').click(function() {
//   $('.goals').empty();
//  });
// });
//  $(document).ready(function () {
//     setTimeout(function(){
//         $('.panel-body').fadeIn(2500);
//     }, 500);
// });
$(document).ready(function(){
  $('#unfollow_btn').hover(function(){
    $(this).removeClass('btn-primary');
    $(this).addClass('btn-danger');
    $(this).html('Unfollow');
  }, function(){
    $(this).html('Following');
    $(this).removeClass('btn-danger');
    $(this).addClass('btn-primary');
  });
});
