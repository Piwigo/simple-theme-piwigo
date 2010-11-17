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
function SelectAll( formulaire )
{
var elts = formulaire.elements;
for(var i=0; i <elts.length; i++)
{
	if (elts[i].type=='checkbox')
		elts[i].checked = true;
}
}

function DeselectAll( formulaire )
{
var elts = formulaire.elements;
for(var i=0; i <elts.length; i++)
{
	if (elts[i].type=='checkbox')
		elts[i].checked = false;
}
}

function Inverser( formulaire )
{
var elts = formulaire.elements;
for(var i=0; i <elts.length; i++)
{
	if (elts[i].type=='checkbox')
		elts[i].checked = !elts[i].checked;
}
}

function phpWGOpenWindow(theURL,winName,features)
{
	img = new Image();
	img.src = theURL;
	if (img.complete)
	{
		var width=img.width+40, height=img.height+40;
	}
	else
	{
		var width=640, height=480;
		img.onload = function () { newWin.resizeTo( img.width+50, img.height+100); };
	}
	newWin = window.open(theURL,winName,features+',left=2,top=1,width=' + width + ',height=' + height);
}

function popuphelp(url)
{
	window.open( url, 'dc_popup',
		'alwaysRaised=yes,dependent=yes,toolbar=no,height=420,width=500,menubar=no,resizable=yes,scrollbars=yes,status=no'
	);
}

Function.prototype.pwgBind = function() {
		var __method = this, object = arguments[0], args = Array.prototype.slice.call(arguments,1);
		return function() {
				return __method.apply(object, args.concat(arguments) );
		}
}
function PwgWS(urlRoot)
{
	this.urlRoot = urlRoot;
	this.options = {
		method: "GET",
		async:  true,
		onFailure: null,
		onSuccess: null
	};
};

PwgWS.prototype = {

	callService : function(method, parameters, options)
	{
		if (options)
		{
			for (var property in options)
				this.options[property] = options[property];
		}
		try { this.transport = new XMLHttpRequest();}
		catch(e) {
			try { this.transport = new ActiveXObject('Msxml2.XMLHTTP'); }
			catch(e) {
				try { this.transport = new ActiveXObject('Microsoft.XMLHTTP'); }
				catch (e){
					dispatchError(0, "Cannot create request object");
				}
			}
		}
		this.transport.onreadystatechange = this.onStateChange.pwgBind(this);

		var url = this.urlRoot+"ws.php?format=json";

		var body = "method="+method;
		if (parameters)
		{
			for (var property in parameters)
			{
				if ( typeof parameters[property] == 'object' && parameters[property])
				{
					for (var i=0; i<parameters[property].length; i++)
						body += "&"+property+"[]="+encodeURIComponent(parameters[property][i]);
				}
				else
					body += "&"+property+"="+encodeURIComponent(parameters[property]);
			}
		}

		if (this.options.method == "POST" )
		{
			this.transport.open(this.options.method, url, this.options.async);
			this.transport.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			this.transport.send(body);
		}
		else
		{
			url += "&"+body;
			this.transport.open(this.options.method, url, this.options.async);
			this.transport.send(null);
		}
	},

	onStateChange: function() {
		var readyState = this.transport.readyState;
		if (readyState==4)
			this.respondToReadyState(readyState);
	},

	dispatchError: function( httpCode, text )
	{
		!this.options.onFailure || this.options.onFailure( httpCode, text);
	},

	respondToReadyState: function(readyState)
	{
		var transport = this.transport;
		if (readyState==4 && transport.status == 200)
		{
			var resp;
			try {
				eval('resp = ' + transport.responseText);
			}
			catch (e) {
				this.dispatchError( 200, e.message + '\n' + transport.responseText.substr(0,512) );
			}
			if (resp!=null)
			{
				if (resp.stat==null)
					this.dispatchError( 200, "Invalid response" );
				else if (resp.stat=='ok')
				{
					if (this.options.onSuccess) this.options.onSuccess( resp.result );
				}
				else
					this.dispatchError( 200, resp.err + " " + resp.message);
			}
		}
		if (readyState==4 && transport.status != 200)
			this.dispatchError( transport.status, transport.statusText );
	},


	transport: null,
	urlRoot: null,
	options: {}
}

function pwgAddEventListener(elem, evt, fn)
{
	if (window.attachEvent)
		elem.attachEvent('on'+evt, fn);
	else
		elem.addEventListener(evt, fn, false);
}var gRatingOptions, gRatingButtons, gUserRating;

function makeNiceRatingForm(options)
{
	gRatingOptions = options || {};
	var form = document.getElementById('rateForm');
	if (!form) return; //? template changed

	gRatingButtons = form.getElementsByTagName('input');
	gUserRating = "";
	for (var i=0; i<gRatingButtons.length; i++)
	{
		if ( gRatingButtons[i].type=="button" )
		{
			gUserRating = gRatingButtons[i].value;
			break;
		}
	}

	for (var i=0; i<gRatingButtons.length; i++)
	{
		var rateButton = gRatingButtons[i];
		rateButton.initialRateValue = rateButton.value; // save it as a property
		try { rateButton.type = "button"; } catch (e){}// avoid normal submit (use ajax); not working in IE6

		if (navigator.userAgent.indexOf('AppleWebKit/')==-1 && navigator.userAgent.indexOf('MSIE 8')==-1) rateButton.value = ""; //hide the text IE<8/Opera - breaks safari
		with (rateButton.style)
		{
			textIndent = "-50px"; //hide the text FF
			marginLeft = marginRight = 0;
		}

		if (i!=gRatingButtons.length-1 && rateButton.nextSibling.nodeType == 3 /*TEXT_NODE*/)
			rateButton.parentNode.removeChild(rateButton.nextSibling);
		if (i>0 && rateButton.previousSibling.nodeType == 3 /*TEXT_NODE*/)
			rateButton.parentNode.removeChild(rateButton.previousSibling);

		pwgAddEventListener(rateButton, "click", updateRating);
		pwgAddEventListener(rateButton, "mouseout", resetRatingStarDisplay);
		pwgAddEventListener(rateButton, "mouseover", updateRatingStarDisplayEvt);
	}
	resetRatingStarDisplay();
}

function resetRatingStarDisplay()
{
	updateRatingStarDisplay( gUserRating );
}

function updateRatingStarDisplay(userRating)
{
	for (var i=0; i<gRatingButtons.length; i++)
		gRatingButtons[i].className = (userRating!=="" && userRating>=gRatingButtons[i].initialRateValue ) ? "rateButtonStarFull" : "rateButtonStarEmpty";
}

function updateRatingStarDisplayEvt(e)
{
	updateRatingStarDisplay(
		e.target ? e.target.initialRateValue : e.srcElement.initialRateValue);
}

function updateRating(e)
{
	var rateButton = e.target || e.srcElement;
	if (rateButton.initialRateValue == gUserRating)
		return false; //nothing to do

	for (var i=0; i<gRatingButtons.length; i++) gRatingButtons[i].disabled=true;
	var y = new PwgWS(gRatingOptions.rootUrl);
	y.callService(
		"pwg.images.rate", {image_id: gRatingOptions.image_id, rate: rateButton.initialRateValue } ,
		{
			onFailure: function(num, text) {
				alert(num + " " + text);
				document.location = rateButton.form.action + "&rate="+rateButton.initialRateValue;
			},
			onSuccess: function(result) {
				gUserRating = rateButton.initialRateValue;
				for (var i=0; i<gRatingButtons.length; i++) gRatingButtons[i].disabled=false;
				if (gRatingOptions.updateRateElement) gRatingOptions.updateRateElement.innerHTML = gRatingOptions.updateRateText;
				if (gRatingOptions.ratingSummaryElement)
				{
					var t = gRatingOptions.ratingSummaryText;
					var args =[result.average, result.count], idx = 0, rexp = new RegExp( /%\.?\d*[sdf]/ );
					//_xxx = t.match( rexp );
					while (idx<args.length) t=t.replace(rexp, args[idx++]);
					gRatingOptions.ratingSummaryElement.innerHTML = t;
				}
			}
		}
	);
	return false;
}/**
 * Cookie plugin
 * Copyright (c) 2006 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 */
jQuery.cookie=function(name,value,options){if(typeof value!='undefined'){options=options||{};if(value===null){value='';options=$.extend({},options);options.expires=-1;}
var expires='';if(options.expires&&(typeof options.expires=='number'||options.expires.toUTCString)){var date;if(typeof options.expires=='number'){date=new Date();date.setTime(date.getTime()+(options.expires*24*60*60*1000));}else{date=options.expires;}
expires='; expires='+date.toUTCString();}
var path=options.path?'; path='+(options.path):'';var domain=options.domain?'; domain='+(options.domain):'';var secure=options.secure?'; secure':'';document.cookie=[name,'=',encodeURIComponent(value),expires,path,domain,secure].join('');}else{var cookieValue=null;if(document.cookie&&document.cookie!=''){var cookies=document.cookie.split(';');for(var i=0;i<cookies.length;i++){var cookie=jQuery.trim(cookies[i]);if(cookie.substring(0,name.length+1)==(name+'=')){cookieValue=decodeURIComponent(cookie.substring(name.length+1));break;}}}
return cookieValue;}};
