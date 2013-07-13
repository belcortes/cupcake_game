
var currentElementBox;
var curElementboxID;
var newElementBoxSpeed;
var charIsFalling;
var score;
var nrlives;
var current_time = 0;

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

  //increase ms number for slower rate of fall, decrease for faster
  descend_ingredients_interval = setInterval(descend_ingredients, 1000); //time
  newly_created_element_interval = setInterval(create_ingredient_element, 2000)
}

function wrong_element() {

}

function descend(ingredient) {
  // console.log(ingredient)
  var current_top_as_int = parseInt(ingredient.css('top').replace("px", "")); 
  var ingredient_container_height = ingredient.parent().height() - ingredient.height();
  var new_top_val = current_top_as_int + 10;

  if (current_top_as_int < ingredient_container_height) {
        ingredient.css('top',new_top_val+'px');
    } else if (current_top_as_int > ingredient_container_height) {
      ingredient.fadeOut();
    }
  // var descending_ingredient = ingredient.css('top').replace("px", "");
  // parseInt(descending_ingredient) + 10;
}


function corrDropletChar() {
  points++;
  
  $("#" + curDropletID)
    .stop()
    .fadeOut();
  
  if (newDropletSpeed > 1500) {
    newDropletSpeed = newDropletSpeed - 75;
  } else if (newDropletSpeed > 1000) {
    newDropletSpeed = newDropletSpeed - 50;
  } else {
    newDropletSpeed = newDropletSpeed - 25;
  }
}

function create_ingredient_element(){
  var ingredient = $("<div>");
  console.log(ingredient);
  ingredient.addClass('ingredient draggable');
  ingredient.css('top','0')
  console.log($('.ingredient').length);
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
      ingredient.text('topping');
      ingredient.css('background-color', 'pink');
      break;
  };
  var leftMargin = (Math.ceil(Math.random() * ($("#board").width()-50)));
  ingredient.css({ marginLeft: leftMargin + "px" });
  ingredient.appendTo($('#board'));
  // return ingredient;
}

function descend_ingredients(ingredient_element){
  // charIsFalling = true;
  // var ingredient_element = $($('.ingredient')[0]);
  // var ingredient_container_height = $('.ingredient').parent().height() - $('.ingredient').height();

  _.each($('.ingredient'),function(element){descend($(element))});

  // function drop_element_by_amount(element) {
  //   if (current_amount < ingredient_container_height) {
  //       element.css('top',current_amount+'px');
  //   } else if(current_amount = ingredient_container_height) {
  //     $('.ingredient').fadeOut();
  //   }
  // }
  
  // _.each($('.ingredients'),function(element){drop_element_by_amount($(element))})
  

  // increase this value for more distance per step
  // current_amount += 10; //distance
}

$(document).ready(function() {

  $('#start').on("click", start_game);
  $('#points').text(calculate_points());
});
