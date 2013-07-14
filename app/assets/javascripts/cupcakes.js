
var currentElementBox;
var curElementboxID;
var newElementBoxSpeed;
var charIsFalling;
var score;
var nrlives;
var current_time = 0;
var current_points = 0;
//experimental globals
var current_amount = 0;
var level_finished = false;
var global_data_object = {};

function win_level() {

}

function increment_points_by(number) {
  current_points += parseInt(number);
  $('#points').text(current_points);
}

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

  //increase ms number for slower rate of fall, decrease for faster
  descend_ingredients_interval = setInterval(descend_ingredients, 200); //time
  newly_created_element_interval = setInterval(create_ingredient_element, 1000)

}

function wrong_element() {

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
  // var descending_ingredient = ingredient.css('top').replace("px", "");
  // parseInt(descending_ingredient) + 10;
}

var data_toppings = {
  fetch_data: function() {
    $.getJSON('/toppings',function(data){
      global_data_object = data;
    });
  },
  //format API data into Morris.js-readable format
  // format_data: function(data_array_of_objects) {
  //   //call underscore method on data array
  //   _.each(data_array_of_objects,
  //   function(object){
  //     //perform the following operations
  //     //on each element of array
  //     // console.log(object.CURRENTGRADE)
  //     var name = object.NAME;
  //     var color = object.COLOR;

  //     data_toppings.formatted_data.push({
  //       "name" : name,
  //       "color" : color
  //     });
  //   });
  // },
}

function create_ingredient_element(){
  var ingredient = $("<div>");
  ingredient.addClass('ingredient draggable');
  ingredient.css('top','0')
  switch (Math.floor(Math.random()*4)+1) {
    case (1):
      ingredient.text('cookie'); 
      ingredient.css('background-color', 'orange');
      break;
    case (2): 
      ingredient.text('ice cream');
      ingredient.css('background-color', 'yellow');
      break;
    case (3):
      ingredient.text('frosting');
      ingredient.css('background-color', 'green');
      break;
    case (4): 
      var rand_pick = Math.floor(Math.random()*3)+0
      ingredient.text(global_data_object[rand_pick].name);
      ingredient.css('background-color', 'pink');
      break;
  };
  ingredient.on('click', function(e){
    add_ingredient_to_box(e);
    var point_value = 0
    if (ingredient.text() === "cookie") {
      point_value = 50;
      $(".cookie_text").empty();
    } else if (ingredient.text() === "ice cream") {
      point_value = 100;
      $(".ic_text").empty();
    } else if (ingredient.text() === "frosting") {
      point_value = 150;
      $(".frosting_text").empty();
    } else if (ingredient.text() === "topping") {
      point_value = 200;
      $(".topping_text").empty();
    }
    increment_points_by(point_value);
  })
  var leftMargin = (Math.ceil(Math.random() * ($("#board").width()-50)));
  ingredient.css({ marginLeft: leftMargin + "px" });
  ingredient.appendTo($('#board'));
  // return ingredient;
}

function descend_ingredients(ingredient_element){
  _.each($('.ingredient'),function(element){descend($(element))});
}

function add_ingredient_to_box(e) {
  var ingredient_box = $(e.target);
  ingredient_box.css('margin-left','0');
  ingredient_box.appendTo($('#cupcake_in_progress'));
  ingredient_box.removeClass('ingredient draggable');

};

$(document).ready(function() {

  //make ajax call that gets the global_data_object from your database

  // that means, it goes to like yourserver/json and then uses the response
  // to set a global variable (i.e. global_data_object = response)

  $('#start').on("click", start_game);
  $('#points').text(current_points);
  data_toppings.fetch_data()
});
