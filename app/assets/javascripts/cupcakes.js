var currentElementBox;
var curElementboxID;
var newElementBoxSpeed;
var charIsFalling;
var score;
var nrlives;

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

  //increase ms number for slower rate of fall, decrease for faster
  descend_ingredients = setInterval(drop_topping2,50); //time
  drop = setInterval(descend_ingredients, 700)
  

}

function wrong_element() {

}

function descend(ingredient) {
  var descending_ingredient = ingredient.css('top').replace("px", "");
  parseInt(descending_ingredient) + 10;
}



function add_element() {
  var new_element = $('<div>');
  new_element.addClass('igredient');
  new_element.css('background-color', red);
  $('.square').append(new_element);
}

function create_ingredient_element(){
  var ingredient = $("<div>");
  ingredient.addClass('ingredient draggable');
  ingredient.text('cookie');
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

function descend_ingredients(){
  // charIsFalling = true;
  var ingredient_element = $($('.ingredient')[0]);
  var ingredient_container_height = $('.ingredient').parent().height() - ingredient_element.height();

  _.each($('.ingredient'), descend);

  function drop_element_by_amount(element) {
    if (current_amount < ingredient_container_height) {
        element.css('top',current_amount+'px');
    } else if(current_amount = ingredient_container_height) {
      $('.ingredient').fadeOut().remove();
    }
  }
  
  drop_element_by_amount(ingredient_element,current_amount);

  //increase this value for more distance per step
  current_amount += 10; //distance
}


$(document).ready(function() {
  
  $('#start').click(start_game);
  $('#points').text(calculate_points())
})



