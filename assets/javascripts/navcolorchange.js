$(document).scroll(function(){
  var x = $('.register').offset().top;
  if($(this).scrollTop() > x) {
    $('header div').css({'background-color':'#ed4543'});
  }
  else {
    $('header div').css({'background-color':'#363636'})
  }
});