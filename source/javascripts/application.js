//= require_tree .

$(document).ready(function(){
  setTimeout(function(){
    $('#left_header').fadeIn(700, function(){
      $('#right_header').animate({paddingTop: '16px'}, 1000, 'easeOutQuint');
    });
  }, 250);
});