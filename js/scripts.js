// use this in case of conflicts with other js frameworks
// jQuery.noConflict();

jQuery(document).ready(function($){
    jQuery('.dropdown-toggle').dropdown();
    jQuery('.description').tooltip();
    jQuery('img.thumbnail').tooltip({placement: 'bottom'});
});
