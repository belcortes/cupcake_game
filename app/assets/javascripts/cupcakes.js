var cupcake_app = {

  drop_topping: function(box_element) {

    var current_x = box_element.css("x-position");
    var current_y = box_element.css("y-position");

    box_element.css("x-position",current_x-5);
    box_element.css("y-position",current_y-5);  

  }
};