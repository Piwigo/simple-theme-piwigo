// if cl_conflit is not used, use jQuery.noConflict to work with other libs
if (typeof (Conflit) == "undefined")
   jQuery.noConflict();

jQuery(document).ready(function($){
  $("#theComments h3").click(function () {
    $("#theComments > div").toggle("slow");
  });

  $("#menuswitcher").click(function(){
    if ($("#menubar").is(":hidden")) {
      $("#menubar").show("slow");
      $.cookie('side-menu', 'showing', {path: "/"});
      return false;
    } else {
      $("#menubar").hide("slow");
      $.cookie('side-menu', 'hiding', {path: "/"});
      return false;
    }
  });

  // creates a variable with the contents of the cookie side-menu
  var sidemenu = $.cookie('side-menu');
  // if cookie says the menu is hiding, keep it hidden!
  if (sidemenu == 'hiding') {
    $("#menubar").hide();
  }
  if (sidemenu == 'showing') {
    $("#menubar").show();
  };
});
