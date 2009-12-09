jQuery.noConflict();

jQuery(document).ready(function($){
  $("#theComments h3").click(function () {
    $("#theComments div").toggle("slow");
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

/**
 * Cookie plugin
 * Copyright (c) 2006 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 */
jQuery.cookie=function(name,value,options){if(typeof value!='undefined'){options=options||{};if(value===null){value='';options=$.extend({},options);options.expires=-1;}
var expires='';if(options.expires&&(typeof options.expires=='number'||options.expires.toUTCString)){var date;if(typeof options.expires=='number'){date=new Date();date.setTime(date.getTime()+(options.expires*24*60*60*1000));}else{date=options.expires;}
expires='; expires='+date.toUTCString();}
var path=options.path?'; path='+(options.path):'';var domain=options.domain?'; domain='+(options.domain):'';var secure=options.secure?'; secure':'';document.cookie=[name,'=',encodeURIComponent(value),expires,path,domain,secure].join('');}else{var cookieValue=null;if(document.cookie&&document.cookie!=''){var cookies=document.cookie.split(';');for(var i=0;i<cookies.length;i++){var cookie=jQuery.trim(cookies[i]);if(cookie.substring(0,name.length+1)==(name+'=')){cookieValue=decodeURIComponent(cookie.substring(name.length+1));break;}}}
return cookieValue;}};
