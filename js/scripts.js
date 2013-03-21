// use this in case of conflicts with other js frameworks
// jQuery.noConflict();

jQuery(document).ready(function($){
  jQuery('.dropdown-toggle').dropdown();
  jQuery('.thumbnail a').tooltip({placement: 'bottom'});
  jQuery('.thumbnail img').tooltip({placement: 'bottom'});

  // put the title in the navbar
  jQuery('.navbar .brand').html(jQuery('#theHeader h1').html());
  jQuery('#theHeader').hide();

  $('ul.thumbnails').infinitescroll({
    // debug        : true,
    navSelector  : "div.navigationBar",
    // selector for the paged navigation (it will be hidden)
    nextSelector : "div.navigationBar a.next",
    // selector for the NEXT link (to page 2)
    itemSelector : ".thumbnails li",
    // selector for all items you'll retrieve
    loadingText  : "Loading ...",
    donetext     : ""
  });
});
