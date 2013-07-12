var currentIngredient;
var curIngredientID;
var newIngredientSpeed;
var score;
var nrlives;
var charIsFalling;

//experimental globals
var current_amount = 0;

function calculate_points() {
  // var points = 0;
  // var add_points;

  // if ($(".wrapper").prepend('.ingredient.cookie_base')) {
  //   $(".cookie_text").empty();
  //   add_points = 50;
  //   points = 50;
  // }
  // if ($(".wrapper").prepend('.ingredient.cookie_base') && $(".wrapper").prepend('.ingredient.ice_cream')) {
  //   $(".ic_text").empty();
  //   add_points = 100;
  //   points = parseInt(points) + parseInt(add_points)
  // }
  // if ($(".wrapper").prepend('.ingredient.cookie_base') && $(".wrapper").prepend('.ingredient.ice_cream') && $(".wrapper").prepend(.ingredient.frosting)) {
  //   $(".frosting_text").empty();
  //   add_points = 150;
  //   points = parseInt(points) + parseInt(add_points)
  // }
  // if ($(".wrapper").prepend('.ingredient.cookie_base') && $(".wrapper").prepend('.ingredient.ice_cream') && $(".wrapper").prepend(.ingredient.frosting) && $(".wrapper").prepend(.ingredient.topping)) {
  //   $(".topping_text").empty();
  //   add_points = 200;
  //   points = parseInt(points) + parseInt(add_points)
  // }

  points = 5
  return points;
};


function start_game() {
  // $(".square").fadeTo("slow", 1);
  // $(".stats").fadeIn();
  // $("#start_game").hide();

  currentElementBox = '';
  curElementBoxID = '';
  newElementBoxSpeed = 2000;
  nrlives = 5;
  score = 0;
  charIsFalling = false;

  create_ingredient_element();

  //experimental drop topping implementation

  //increase ms number for slower rate of fall, decrease for faster
  setInterval(drop_topping2,50); //time
  // drop_topping2();
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

function create_ingredient_element(){
  var ingredient = $("<div>");
  ingredient.addClass('ingredient draggable');
  ingredient.text('this is an ingredient');
  ingredient.appendTo($('.square'));

  //add a randomized value for the css 'left' property;
}

// function drop_topping() {
//   charIsFalling = true;
//   $('.ingredient').animate({
//     marginTop: ($('.ingredient').parent().height() - $('.ingredient').height()) + 'px',
//   }, {
//     duration: 2000,
//     easing: "easeInCubic",
//   });
// }

// experimental function

function drop_topping2(){
  // charIsFalling = true;
  var ingredient_element = $($('.ingredient')[0]);
  var ingredient_container_height = $('.ingredient').parent().height() - ingredient_element.height();

  function drop_element_by_amount(element) {
    if (current_amount < ingredient_container_height) {
        element.css('top',current_amount+'px');
    }
  }
  
  drop_element_by_amount(ingredient_element,current_amount);

  //increase this value for more distance per step
  current_amount += 10; //distance
}


// end experimental function

function element_hits_ground() {
  charIsFalling = false;
  currentElementBox = '';
  nrlives--;
  $('.ingredient').fadeOut()
};

$(document).ready(function() {
  
  $('#start').click(start_game);
  $('#points').text(calculate_points())
})
