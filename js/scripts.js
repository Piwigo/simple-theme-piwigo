// use this in case of conflicts with other js frameworks
// jQuery.noConflict();

jQuery(document).ready(function($){
  $("#theComments h3").click(function () {
    $("#theComments > div").toggle("slow");
  });
});
