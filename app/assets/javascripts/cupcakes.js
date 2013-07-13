
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



  for(var i=0;i<5;i++ ){
    create_ingredient_element();
  }
  //increase ms number for slower rate of fall, decrease for faster

  descend_ingredients_interval = setInterval(descend_ingredients,1000); //time
  drop = setInterval($('.ingredient'), 700)
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
      $('.ingredient').fadeOut();
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



// function add_element() {
//   var new_element = $('<div>');
//   new_element.addClass('igredient');
//   new_element.css('background-color', red);
//   $('.square').append(new_element);
// }

function create_ingredient_element(){
  var ingredient = $("<div>");
  ingredient.addClass('ingredient draggable');
  ingredient.css('top','0');
  ingredient.text('cookie');
  var leftMargin = (Math.ceil(Math.random()* ($("#board").width()-ingredient.width())));
  ingredient.css({ marginLeft: leftMargin + "px" });
  ingredient.appendTo($('#board'));
  console.log($('.ingredient').length)
  return ingredient;

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
  
  $('#start').click(start_game);
  $('#points').text(calculate_points())
})
