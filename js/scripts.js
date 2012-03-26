// use this in case of conflicts with other js frameworks
// jQuery.noConflict();

jQuery(document).ready(function($){
    jQuery('.dropdown-toggle').dropdown();
    jQuery('.illustration a').tooltip({placement: 'bottom'});
    jQuery('img.thumbnail').tooltip({placement: 'bottom'});
});
