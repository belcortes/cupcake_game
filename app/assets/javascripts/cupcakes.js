var currentElementBox;
var curElementboxID;
var newElementBoxSpeed;
var score;
var nrlives;
var charIsFalling;
var currentElementBox;
var curElementboxID;
var newElementBoxSpeed;
var score;
var nrlives;
var charIsFalling;

function calculate_points() {
  var points = 0;
  var add_points;

  if ($(".wrapper").prepend('.ingredient.cookie_base')) {
    $(".cookie_text").empty();
    add_points = 50;
    points = 50;
  }
  if ($(".wrapper").prepend('.ingredient.cookie_base') && $(".wrapper").prepend('.ingredient.ice_cream')) {
    $(".ic_text").empty();
    add_points = 100;
    points = parseInt(points) + parseInt(add_points)
  }
  if ($(".wrapper").prepend('.ingredient.cookie_base') && $(".wrapper").prepend('.ingredient.ice_cream') && $(".wrapper").prepend(.ingredient.frosting)) {
    $(".frosting_text").empty();
    add_points = 150;
    points = parseInt(points) + parseInt(add_points)
  }
  if ($(".wrapper").prepend('.ingredient.cookie_base') && $(".wrapper").prepend('.ingredient.ice_cream') && $(".wrapper").prepend(.ingredient.frosting) && $(".wrapper").prepend(.ingredient.topping)) {
    $(".topping_text").empty();
    add_points = 200;
    points = parseInt(points) + parseInt(add_points)
  }
  return points;
};


function start_game() {
  $(".square").fadeTo("slow", 1);
  // $(".stats").fadeIn();

  $("#gamestart").hide();

  currentElementBox = '';
  curElementBoxID = '';
  newElementBoxSpeed = 2000;
  nrlives = 5;
  score = 0;
  charIsFalling = false;
}

function wrong_element() {

}



function add_element() {
  var new_element = $('<div>');
  new_element.addClass('igredient');
  new_element.css('background-color', red);
  $('.square').append(new_element);
}

// $(".ingredient").draggable({
//   collide: 'flag'
// });
// $('.wrapper').draggable({
//   axis: 'x',
//   containment: '#board'
// });
// $('.wrapper').droppable({
//   drop: function(event, ui) {
//     $(this)
//       .css({
//       'background-color': 'green'
//     })
//       .text($(ui.draggable).text())
//     ui.draggable.fadeOut();
//   }
// });

function start_game() {

}

function drop_topping() {
  charIsFalling = true;
  $('.ingredient').animate({
    marginTop: ($('.ingredient').parent().height() - $('.ingredient').height()) + 'px',
  }, {
    duration: 2000,
    easing: "easeInCubic",
  });
}

function element_hits_ground() {
  charIsFalling = false;
  currentElementBox = '';
  nrlives--;
  $('.ingredient').fadeOut()
};



$(document).ready(function() {
  drop_topping();
  element_hits_ground();
  $('#start').click(cupcake_game.start_game);
})