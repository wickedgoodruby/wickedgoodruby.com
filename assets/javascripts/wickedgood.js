//var screenWidth = function() {
//  if ($(window).width() < 800) {
//    $('body').removeClass('big').addClass('small');
//  }
//  else {
//    $('body').removeClass('small').addClass('big');
//  };
//};
//
//$(window).resize(screenWidth);
//
//$(function() {
//  screenWidth();
//  $('.small .menu p').click(function() {
//    $('.small #flexnav').toggle();
//  });
//  $('.small #flexnav a').click(function() {
//    $('.small #flexnav').hide();
//  });
//});
//
//$('.register').waypoint(function(direction) {
//  if (direction === 'down') {
//    $('.menu').css({'background-color':'#ED4543'});
//  }
//  else {
//    $('.menu').css({'background-color':'#2D2528'});
//  }
//});
//
//$('.register').waypoint(function(direction) {
//  if (($(window).width()) > 800)
//    if (direction === 'down') {
//      $('nav').css({'background-color':'#ED4543'});
//    }
//    else {
//      $('nav').css({'background-color':'#2D2528'});
//    }
//});
//
//$('footer').waypoint(function() {
//  $('.terrier').delay(300).transition({y: '-20em'});
//}, { offset: 'bottom-in-view' });
//
//$('a[href^="#"]').bind('click.smoothscroll',function (e) {
//    e.preventDefault();
//    var target = this.hash;
//        $target = $(target);
//    $('html, body').stop().animate({
//        'scrollTop': $target.offset().top
//    }, 500, 'swing', function () {
//        window.location.hash = target;
//    });
//});