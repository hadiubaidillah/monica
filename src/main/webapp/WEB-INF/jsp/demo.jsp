<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">  
<title>LC Lightbox - Image Gallery Demo</title>



<!-- PAGE'S BASE CSS -->
<style type="text/css">
/*! normalize.css v2.1.2 | MIT License | git.io/normalize */article,aside,details,figcaption,figure,footer,header,hgroup,main,nav,section,summary{display:block}audio,canvas,video{display:inline-block}audio:not([controls]){display:none;height:0}[hidden]{display:none}html{font-family:sans-serif;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}body{margin:0}a:focus{outline:thin dotted}a:active,a:hover{outline:0}h1{font-size:2em;margin:.67em 0}abbr[title]{border-bottom:1px dotted}b,strong{font-weight:700}dfn{font-style:italic}hr{-moz-box-sizing:content-box;box-sizing:content-box;height:0}mark{background:#ff0;color:#000}code,kbd,pre,samp{font-family:monospace,serif;font-size:1em}pre{white-space:pre-wrap}q{quotes:"\201C" "\201D" "\2018" "\2019"}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sup{top:-.5em}sub{bottom:-.25em}img{border:0}svg:not(:root){overflow:hidden}figure{margin:0}fieldset{border:1px solid silver;margin:0 2px;padding:.35em .625em .75em}legend{border:0;padding:0}button,input,select,textarea{font-family:inherit;font-size:100%;margin:0}button,input{line-height:normal}button,select{text-transform:none}button,html input[type=button],input[type=reset],input[type=submit]{-webkit-appearance:button;cursor:pointer}button[disabled],html input[disabled]{cursor:default}input[type=checkbox],input[type=radio]{box-sizing:border-box;padding:0}input[type=search]{-webkit-appearance:textfield;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;box-sizing:content-box}input[type=search]::-webkit-search-cancel-button,input[type=search]::-webkit-search-decoration{-webkit-appearance:none}button::-moz-focus-inner,input::-moz-focus-inner{border:0;padding:0}textarea{overflow:auto;vertical-align:top}table{border-collapse:collapse;border-spacing:0}



body{font:14px/20px Arial,sans-serif;background-color:#4E5869;margin:0;padding:0;color:#000}dl,ol,ul{padding:0;margin:0}h1,h2,h3,h4,h5,h6,p{margin-top:0;padding-right:15px;padding-left:15px}a img{border:none}a:link{color:#414958;text-decoration:underline}a:visited{color:#4E5869;text-decoration:underline}a:active,a:focus,a:hover{text-decoration:none}.container{width:80%;max-width:1260px;min-width:335px;background-color:#FFF;margin:0 auto}.header{background-color:#fdfdfd;}.sidebar1{float:right;width:20%;background-color:#93A5C4;padding-bottom:10px}.content{padding:10px 0;width:100%;float:right;background-color:#efefef}.content ol,.content ul{padding:0 15px 15px 40px}ul.nav{list-style:none;border-top:1px solid #666;margin-bottom:15px}ul.nav li{border-bottom:1px solid #666}ul.nav a,ul.nav a:visited{padding:5px 5px 5px 15px;display:block;text-decoration:none;background-color:#8090AB;color:#000}ul.nav a:active,ul.nav a:focus,ul.nav a:hover{background-color:#6F7D94;color:#FFF}.fltrt{float:right;margin-left:8px}.fltlft{float:left;margin-right:8px}.clearfloat{clear:both;height:0;font-size:1px;line-height:0}.content,.sidebar1{min-height:500px}.content>div{margin:20px 15px}@media screen and (max-width:900px){.content>div{width:100%!important}}

#logo {
	background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAYlJREFUeNrcV4FtgzAQBJQB3AlCN0gmiNkgnaBhg25QMUHSCUInKJkgZgNGyAhskP6r58qJsCEUE5qXLMvI8t//359NGDhMytWepk3gz7LQ4VzSdAw8WxTc2WYd9ymlymQop5Td87/IQEVDR137AhAahPNlFZWvtpVgRgtmulcA5CO5BmFyQHou8wJjmm3YB0B9TwAp1fKJ5mcap7EB7Mh5/qNKJTv/GAuAQsSHq+/zMaQ4R6RfzGRqpwJrZvWbbwDaGeuEwLc1hmm6HNshS8BMTxG5aDkjxv5sSAAFIo07nsPR7/p0RuSI6vWGcwQ4UQwFQPaQ6FVDp0z/RTRJAMxovj75rbDsqP0pnmyVjYikIawjR1z/TgA5HaYguRXEqO29qCXa1Y6iiVuRZaNr3dQxrrUTfGg+j8wfBtwBJ+hBm8pxBj7hfNsAWpdncZm60grA5EOG/n5H+mIAEx2y8wtAl/XWLhCIiCW5pPECciZ9ROcvPyacuj3Y/Pg6MDqAzLOP3EZAtm8BBgDqc3bEpb6xyQAAAABJRU5ErkJggg==') no-repeat center center transparent;
	background-size: contain;
	width: 25px;
	height: 25px;
	display: inline-block;	
	position: relative;
	bottom: -4px;
	left: -4px;
}

.elem, .elem * {
	box-sizing: border-box;
	margin: 0 !important;	
}
.elem {
	display: inline-block;
	font-size: 0;
	width: 33%;
	border: 20px solid transparent;
	border-bottom: none;
	background: #fff;
	padding: 10px;
	height: auto;
	background-clip: padding-box;
}
.elem > span {
	display: block;
	cursor: pointer;
	height: 0;
	padding-bottom:	70%;
	background-size: cover;	
	background-position: center center;
}
</style>






<!-- LIGHTBOX FADING SHOW/HIDE EFFECT (as explained in documentation) -->
<style type="text/css">
.lcl_fade_oc.lcl_pre_show #lcl_overlay,
.lcl_fade_oc.lcl_pre_show #lcl_window,
.lcl_fade_oc.lcl_is_closing #lcl_overlay,
.lcl_fade_oc.lcl_is_closing #lcl_window {
	opacity: 0 !important;
}
.lcl_fade_oc.lcl_is_closing #lcl_overlay {
	-webkit-transition-delay: .15s !important; 
	transition-delay: .15s !important;
}
</style>






<!-- //////////////////////////////////////////////// -->
<!-- REQUIRED ELEMENTS -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/lc-lightbox-lite@1.2.9/js/lc_lightbox.lite.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lc-lightbox-lite@1.2.9/css/lc_lightbox.min.css">


<!-- SKINS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lc-lightbox-lite@1.2.9/skins/minimal.css" />


<!-- ASSETS -->
<script src="lib/AlloyFinger/alloy_finger.min.js" type="text/javascript"></script>

<!-- //////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////// -->

</head>

<body>

<div class="container">
	<div class="header">
		  
		  <div style="text-align: center; color: #3f3f3f; padding: 40px 20px 25px; opacity: 0.9;"> 
			  <h1><span id="logo"></span> LC Lightbox</h1>
			  <h3>Yet.. another jQuery lightbox .. or not?<br/><br/>
				  <small>by <a href="https://lcweb.it/" target="_blank">LCweb</a></small>
			  </h3>
		  </div>
	</div>
	
	
	<div class="content">
	
		<a class="elem" href="https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?dpr=1&auto=format&fit=crop&w=2000&q=80&cs=tinysrgb" title="image 1" data-lcl-txt="lorem ipsum dolor sit amet" data-lcl-author="someone" data-lcl-thumb="https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?dpr=1&auto=format&fit=crop&w=150&q=80&cs=tinysrgb">
			<span style="background-image: url(https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?dpr=1&auto=format&fit=crop&w=400&q=80&cs=tinysrgb);"></span>
		</a>
		<a class="elem" href="https://images.unsplash.com/photo-1502082553048-f009c37129b9?dpr=1&auto=format&fit=crop&w=2000&q=80&cs=tinysrgb" title="image 2" data-lcl-txt="lorem ipsum dolor sit amet" data-lcl-author="someone" data-lcl-thumb="https://images.unsplash.com/photo-1502082553048-f009c37129b9?dpr=1&auto=format&fit=crop&w=150&q=80&cs=tinysrgb">
			<span style="background-image: url(https://images.unsplash.com/photo-1502082553048-f009c37129b9?dpr=1&auto=format&fit=crop&w=400&q=80&cs=tinysrgb);"></span>
		</a>
		<a class="elem" href="https://images.unsplash.com/photo-1442850473887-0fb77cd0b337?dpr=1&auto=format&fit=crop&w=2000&q=80&cs=tinysrgb" title="image 3" data-lcl-txt="lorem ipsum dolor sit amet" data-lcl-author="someone" data-lcl-thumb="https://images.unsplash.com/photo-1442850473887-0fb77cd0b337?dpr=1&auto=format&fit=crop&w=150&q=80&cs=tinysrgb">
			<span style="background-image: url(https://images.unsplash.com/photo-1442850473887-0fb77cd0b337?dpr=1&auto=format&fit=crop&w=400&q=80&cs=tinysrgb);"></span>
		</a>
		
		
		<a class="elem" href="https://images.unsplash.com/photo-1431794062232-2a99a5431c6c?dpr=1&auto=format&fit=crop&w=2000&q=80&cs=tinysrgb" title="image 4" data-lcl-txt="lorem ipsum dolor sit amet" data-lcl-author="someone" data-lcl-thumb="https://images.unsplash.com/photo-1431794062232-2a99a5431c6c?dpr=1&auto=format&fit=crop&w=150&q=80&cs=tinysrgb">
			<span style="background-image: url(https://images.unsplash.com/photo-1431794062232-2a99a5431c6c?dpr=1&auto=format&fit=crop&w=400&q=80&cs=tinysrgb);"></span>
		</a>
		<a class="elem" href="https://images.unsplash.com/photo-1432405972618-c60b0225b8f9?dpr=1&auto=format&fit=crop&w=2000&q=80&cs=tinysrgb" title="image 5" data-lcl-txt="lorem ipsum dolor sit amet" data-lcl-author="someone" data-lcl-thumb="https://images.unsplash.com/photo-1432405972618-c60b0225b8f9?dpr=1&auto=format&fit=crop&w=150&q=80&cs=tinysrgb">
			<span style="background-image: url(https://images.unsplash.com/photo-1432405972618-c60b0225b8f9?dpr=1&auto=format&fit=crop&w=400&q=80&cs=tinysrgb);"></span>
		</a>
		<a class="elem" href="https://images.unsplash.com/photo-1482192505345-5655af888cc4?dpr=1&auto=format&fit=crop&w=2000&q=80&cs=tinysrgb" title="image 6" data-lcl-txt="lorem ipsum dolor sit amet" data-lcl-author="someone" data-lcl-thumb="https://images.unsplash.com/photo-1482192505345-5655af888cc4?dpr=1&auto=format&fit=crop&w=150&q=80&cs=tinysrgb">
			<span style="background-image: url(https://images.unsplash.com/photo-1482192505345-5655af888cc4?dpr=1&auto=format&fit=crop&w=400&q=80&cs=tinysrgb);"></span>
		</a>
		
		<br/><br/>
	</div>
	
</div>



<!-- //////////////////////////////////////////////// -->
<!-- LIGHTBOX INITIALIZATION -->
<script type="text/javascript">
$(document).ready(function(e) {
   
	// live handler
	lc_lightbox('.elem', {
		wrap_class: 'lcl_fade_oc',
		gallery : true,	
		thumb_attr: 'data-lcl-thumb', 
		
		skin: 'minimal',
		radius: 0,
		padding	: 0,
		border_w: 0,
	});	

});
</script>
<!-- //////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////// -->

</body>
</html>
