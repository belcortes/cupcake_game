// var cupcake_app = cupcake_app || {

// }

function start_game() {
  $(".square").fadeTo("slow", 1);
  $(".stats").fadeIn();
  
  $("#gamestart").hide();
  
  currentDroplet = '';
  curDropletID = '';
  newDropletSpeed = 2000;
  nrlives = 5;
  score = 0;
  charIsFalling = false;
  
  updateStats();
  }
}

function element_hits_ground() {

}

function add_element_to_wrapper(){

}

function wrong_element(){

}

function add_element() {
    var new_element = $('<div>');
    new_element.addClass('box');
    new_element.css('background-color', red);
    $('.square').append(new_element);
  }

function drop_topping(box_element) {

    if(box_element) {
     
    }
}









// var currentBoxElement;
// var curBoxElementID;
// var newBoxElementSpeed;
// var nrlives;
// var score;
// var charIsFalling;

// $(document).ready(function() {
//   startNewGame();
// });

// function startNewGame() {
//   $("#waterfall").fadeTo("slow", 1);
//   $(".stats").fadeIn();
  
//   $("#gamestart").hide();
  
//   currentBoxElement = '';
//   curBoxElementID = '';
//   newBoxElementSpeed = 2000;
//   nrlives = 3;
//   score = 0;
//   charIsFalling = false;
// }

  // Register keypress events on the whole document
  // From: http://www.marcofolio.net/webdesign/advanced_keypress_navigation_with_jquery.html
  // $(document).keydown(function(e) {
  //   if(e.keyCode == currentBoxElement) {
  //     corrBoxElementChar();
  //   } else {
  //     if(gamedifficulty == 'hard' && charIsFalling) {
  //       wrongBoxElementChar();
  //     }
  //   }
  // });




// function charFall(id, fallingtime) {
//   charIsFalling = true;
//   var box_element = $("#" + id);
//   box_element.animate({
//       marginTop : (box_element.parent().height() - box_element.height()) + 'px'
//     }, {
//       duration: fallingtime,
//       easing: "easeInCubic",
//       complete: function() {
//         splashChar(id); 
//       }
//   });
// }

function create_box_element() {
  changeCurrentBoxElement();
  
  var new_box_element = document.createElement("div");
  $(new_box_element).attr("class", "fallingchar");
  var tempId = "waterdrop" + Math.floor(Math.random()*3003);
  $(newbox_element).attr("id", tempId);
  curBoxElementID = tempId;
  
  var leftMargin = (Math.ceil(Math.random() * ($("#waterfall").width() - 31)));
  $(new_box_element).css({ marginLeft: leftMargin + "px" });
  
  var box_element_char = document.createElement("p");
  $(box_element_char).html(String.fromCharCode(currentDroplet));
  $(box_element_char).appendTo(new_box_element);
  $(new_box_element).appendTo("#waterfall");
  
  charFall(tempId, newBoxElementSpeed);
}