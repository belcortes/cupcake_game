// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui.min
//= require cupcakes
//= require_tree .

function changeCurrentIngredient() {
  // 5 represents top of the random range, 1 bottom.
  currentElementBox = Math.floor((Math.random()*4)+1)
}

function createIngredient() {
  changeCurrentIngredient();

  var newIngredient = document.createElement(".ingredient");
  $(newIngredient).attr("class", "fallingchar");
  var tempId = "cupcake" + Math.floor(Math.random()*3003);
  $(newIngredient).attr("id", tempId)
  curIngredientID = tempId;

  var leftMargin = (Math.ceil(Math.random() * ($("#board").width() - 502)));
  $(newdroplet).css({ marginLeft: leftMargin + "px" });

  var ingredient = document.createElement("p")
  $(ingredient).html('p')

}