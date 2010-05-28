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

/**
 * Piwigo scripts
 */
function phpWGOpenWindow(theURL,winName,features)
{img=new Image();img.src=theURL;if(img.complete)
{var width=img.width+40;var height=img.height+40;}
else
{var width=640;var height=480;img.onload=resizeWindowToFit;}
newWin=window.open(theURL,winName,features+',left=2,top=1,width='+width+',height='+height);}
function resizeWindowToFit()
{newWin.resizeTo(img.width+50,img.height+100);}
function popuphelp(url)
{window.open(url,'dc_popup','alwaysRaised=yes,dependent=yes,toolbar=no,height=420,width=500,menubar=no,resizable=yes,scrollbars=yes,status=no');}
Function.prototype.pwgBind=function(){var __method=this,object=arguments[0],args=new Array();for(var i=1;i<arguments.length;i++)
args[i-1]=arguments[i];return function(){return __method.apply(object,args);}}
function PwgWS(urlRoot)
{this.urlRoot=urlRoot;this.options={method:"GET",async:true,onFailure:null,onSuccess:null};};PwgWS.prototype={callService:function(method,parameters,options)
{if(options)
{for(var property in options)
this.options[property]=options[property];}
try{this.transport=new XMLHttpRequest();}
catch(e){try{this.transport=new ActiveXObject('Msxml2.XMLHTTP');}
catch(e){try{this.transport=new ActiveXObject('Microsoft.XMLHTTP');}
catch(e){dispatchError(0,"Cannot create request object");}}}
this.transport.onreadystatechange=this.onStateChange.pwgBind(this);var url=this.urlRoot+"ws.php?format=json";var body="method="+method;if(parameters)
{for(var property in parameters)
{if(typeof parameters[property]=='object'&&parameters[property])
{for(var i=0;i<parameters[property].length;i++)
body+="&"+property+"[]="+encodeURIComponent(parameters[property][i]);}
else
body+="&"+property+"="+encodeURIComponent(parameters[property]);}}
if(this.options.method=="POST")
{this.transport.open(this.options.method,url,this.options.async);this.transport.setRequestHeader("Content-Type","application/x-www-form-urlencoded");this.transport.send(body);}
else
{url+="&"+body;this.transport.open(this.options.method,url,this.options.async);this.transport.send(null);}},onStateChange:function(){var readyState=this.transport.readyState;if(readyState==4)
this.respondToReadyState(this.transport.readyState);},dispatchError:function(httpCode,text)
{!this.options.onFailure||this.options.onFailure(httpCode,text);},respondToReadyState:function(readyState)
{var transport=this.transport;if(readyState==4&&transport.status==200)
{var resp;try{eval('resp = '+transport.responseText);}
catch(e){this.dispatchError(200,e.message+'\n'+transport.responseText.substr(0,512));}
if(resp!=null)
{if(resp.stat==null)
this.dispatchError(200,"Invalid response");else if(resp.stat=='ok')
{if(this.options.onSuccess)this.options.onSuccess(resp.result);}
else
this.dispatchError(200,resp.err+" "+resp.message);}}
if(readyState==4&&transport.status!=200)
this.dispatchError(transport.status,transport.statusText);},transport:null,urlRoot:null,options:{}}