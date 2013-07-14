
var currentElementBox;
var curElementboxID;
var newElementBoxSpeed;
var charIsFalling;
var score;
var nrlives;
var current_time = 0;
var current_points = 0;
var current_amount = 0;
var level_finished = false;


function win_level() {
  if (($("#cookie").children().length === 1) && ($("#ice_cream").children().length === 1) && ($("#frosting").children().length === 1) && ($("#topping").children().length === 1)) {
    $(location).attr('href', '/win');

    // level_finished = true;
    // $("#board").children().remove();
    // $("#cupcake_in_progress").children().remove();
    // clearInterval(descend_ingredients_interval);
    // clearInterval(newly_created_element_interval);
    // current_points = 0;
    // // direct to winner page and reload the cupcake game.
    // alert("Congratulations! You just built an ice cream cupcake!");
  } // write an else if any of those children is greater than 1 to direct to losing page.
}

function lose_life() {
  if ($("#cookie").children().length > 1) {
    $('#life_holder').children().first().remove();
    $("#cookie").children()[1].remove()
  } else if ($("#ice_cream").children().length > 1) {
    $('#life_holder').children().first().remove();
    $("#ice_cream").children()[1].remove()
  } else if ($("#frosting").children().length > 1){
    $('#life_holder').children().first().remove();
    $("#frosting").children()[1].remove()
  } else if ($("#topping").children().length > 1){
    $('#life_holder').children().first().remove();
    $("#topping").children()[1].remove()
  } 
  // else if ($("#topping").children().length > 1) {
  //   $('#life_holder').children().first().remove();
  // } 
  // else if (($("#cookie").children().length > 1) && ($("#ice_cream").children().length <= 1) && ($("#frosting").children().length <= 1) && ($("#topping").children().length <= 1)) {
  //   !($('#life_holder').children().first().remove());
  // }

}

function lose_level() {
  if ($("#life_holder").children().length === 0) {
    $(location).attr('href', '/lose');
  }
}


// function game_over() {
//   if ($("#life_holder").children() === [])
//     redirect to lose path
// }

function increment_points_by(number) {
  current_points += parseInt(number);
  $('#points').text(current_points);
}

function start_game() {
  generate_random_cupcake
  currentElementBox = '';
  curElementBoxID = '';
  newElementBoxSpeed = 2000;
  nrlives = 3;
  score = 0;
  charIsFalling = false;

  //increase ms number for slower rate of fall, decrease for faster
  descend_ingredients_interval = setInterval(descend_ingredients, 200); //time
  newly_created_element_interval = setInterval(create_ingredient_element, 1000)

}

// function wrong_element() {

// }

function generate_random_cupcake() {
  var ingredient = $("<div>");
  ingredient.addClass('ingredient');
  ingredient.attr('color', 'pink')
  ingredient.appendTo($('#cupcake_image'))
}

function descend(ingredient) {
  var current_top_as_int = parseInt(ingredient.css('top').replace("px", "")); 
  var ingredient_container_height = ingredient.parent().height() - ingredient.height();
  var new_top_val = current_top_as_int + 10;

  if (current_top_as_int < ingredient_container_height) {
        ingredient.css('top',new_top_val+'px');
  } else if (current_top_as_int = ingredient_container_height) {
      ingredient.remove().fadeOut();
  }
}

var data_cookies = {
  fetch_data: function() {
    $.getJSON('/cookies',function(data){
      cookies_data_object = data;
    });
  },
}
var data_ice_creams = {
  fetch_data: function() {
    $.getJSON('/ice_creams',function(data){
      ice_creams_data_object = data;
    });
  },
}
var data_frostings = {
  fetch_data: function() {
    $.getJSON('/frostings',function(data){
      frostings_data_object = data;
    });
  },
}
var data_toppings = {
  fetch_data: function() {
    $.getJSON('/toppings',function(data){
      toppings_data_object = data;
    });
  },
}

function create_ingredient_element(){
  var ingredient = $("<div>");
  ingredient.addClass('ingredient draggable');
  ingredient.css('top','0')
  switch (Math.floor(Math.random()*4)+1) {
    case (1):
      var rand_pick = Math.floor(Math.random()*4)+0
      ingredient.text(cookies_data_object[rand_pick].name); 
      ingredient.css('background-color', 'orange').addClass('falling_cookie');
      break;
    case (2): 
      var rand_pick = Math.floor(Math.random()*4)+0
      ingredient.text(ice_creams_data_object[rand_pick].name);
      ingredient.css('background-color', 'yellow').addClass('falling_ic');
      break;
    case (3):
      var rand_pick = Math.floor(Math.random()*4)+0
      ingredient.text(frostings_data_object[rand_pick].name);
      ingredient.css('background-color', 'green').addClass('falling_frosting');
      break;
    case (4): 
      var rand_pick = Math.floor(Math.random()*4)+0
      ingredient.text(toppings_data_object[rand_pick].name);
      ingredient.css('background-color', 'pink').addClass('falling_topping');
      break;
  };
 
  ingredient.on('click', function(e){

    add_ingredient_to_box(e);
    var point_value = 0
    if (ingredient.hasClass("falling_cookie")) {
      point_value = 100;
      $(".cookie_text").empty();
    } else if (ingredient.hasClass("falling_ic")) {
      point_value = 100;
      $(".ic_text").empty();
    } else if (ingredient.hasClass("falling_frosting")) {
      point_value = 100;
      $(".frosting_text").empty();
    } else if (ingredient.hasClass("falling_topping")) {
      point_value = 100;
      $(".topping_text").empty();
    }
    increment_points_by(point_value);
  })
  var leftMargin = (Math.ceil(Math.random() * ($("#board").width()-50)));
  ingredient.css({ marginLeft: leftMargin + "px" });
  ingredient.appendTo($('#board'));
  // return ingredient;
}

// function right_order_cupcake() {
//   // var cupcake = ["falling_cookie clicked_ingredient", "falling_ic clicked_ingredient", "falling_frosting clicked_ingredient", "falling_topping clicked_ingredient"];  
//   if ($('#cupcake_in_progress').children().hasClass("falling_cookie clicked_ingredient")) {
//     // do nothing
//   }
//   if ($('#cupcake_in_progress').children().hasClass("falling_cookie clicked_ingredient"))
// }

function descend_ingredients(ingredient_element){
  _.each($('.ingredient'),function(element){descend($(element))});
}

function add_ingredient_to_box(e) {
  var ingredient_box = $(e.target);
  ingredient_box.css('margin-left','0');
  ingredient_box.removeClass('ingredient draggable').addClass('clicked_ingredient')
  if (ingredient_box.hasClass("falling_cookie")) {
    ingredient_box.appendTo($('#cookie'));
  } else if (ingredient_box.hasClass("falling_ic")) {
    ingredient_box.appendTo($('#ice_cream'));
  } else if (ingredient_box.hasClass("falling_frosting")) {
    ingredient_box.appendTo($('#frosting'));
  } else if (ingredient_box.hasClass("falling_topping")) {
    ingredient_box.appendTo($('#topping'));
  }
  win_level();
  lose_life();
  lose_level();
};

$(document).ready(function() {

  $('#start').on("click", start_game);
  $('#points').text(current_points);
  data_toppings.fetch_data();
  data_cookies.fetch_data();
  data_ice_creams.fetch_data();
  data_frostings.fetch_data();
});
