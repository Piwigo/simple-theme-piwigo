// use this in case of conflicts with other js frameworks
// jQuery.noConflict();

jQuery(document).ready(function($){
  jQuery('.dropdown-toggle').dropdown();
  jQuery('.illustration a').tooltip({placement: 'bottom'});
  jQuery('img.thumbnail').tooltip({placement: 'bottom'});

  // put the title in the navbar
  jQuery('.navbar .brand').html(jQuery('#theHeader h1').html());
  jQuery('#theHeader').hide();

  $('#thumbnails ul').infinitescroll({
    navSelector  : "div.navigationBar",
    // selector for the paged navigation (it will be hidden)
    nextSelector : "div.navigationBar a.next",
    // selector for the NEXT link (to page 2)
    itemSelector : "#thumbnails li",
    // selector for all items you'll retrieve
    loadingText  : "Loading ...",
    donetext     : ""
  });
});
