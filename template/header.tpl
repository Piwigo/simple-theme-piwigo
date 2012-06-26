<!doctype html>
<html lang="{$lang_info.code}">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>{$PAGE_TITLE} - {$GALLERY_TITLE}</title>
  <meta name="generator" content="Piwigo (aka PWG), see piwigo.org">
{if isset($meta_ref) }
  {if isset($INFO_AUTHOR)}
  <meta name="author" content="{$INFO_AUTHOR|@strip_tags:false|@replace:'"':' '}">
  {/if}
  {if isset($related_tags)}
  <meta name="keywords" content="{foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}{$tag.name}{/foreach}">
  {/if}
  {if isset($COMMENT_IMG)}
  <meta name="description" content="{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
  {else}
  <meta name="description" content="{$PAGE_TITLE}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
  {/if}
{/if}

  <meta name="viewport" content="width=device-width">
  <link rel="shortcut icon" type="image/x-icon" href="{$ROOT_URL}{$themeconf.icon_dir}/favicon.ico">
  <link rel="start" title="{'Home'|@translate}" href="{$U_HOME}">
  <link rel="search" title="{'Search'|@translate}" href="{$ROOT_URL}search.php">

  {if isset($first.U_IMG)}<link rel="first" title="{'First'|@translate}" href="{$first.U_IMG}">{/if}
  {if isset($previous.U_IMG)}<link rel="prev" title="{'Previous'|@translate}" href="{$previous.U_IMG}">{/if}
  {if isset($next.U_IMG)}<link rel="next" title="{'Next'|@translate}" href="{$next.U_IMG}">{/if}
  {if isset($last.U_IMG)}<link rel="last" title="{'Last'|@translate}" href="{$last.U_IMG}">{/if}
  {if isset($U_UP)}<link rel="up" title="{'Thumbnails'|@translate}" href="{$U_UP}">{/if}

  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic,700' rel='stylesheet' type='text/css'>

  {combine_css path="themes/simpleng/css/style.min.css" order="1"}
  {get_combined_css}

  {foreach from=$themes item=theme}
  {if $theme.load_css}
    {assign var="csstheme" value="themes/`$theme.id`/theme.css"}
    { if file_exists($csstheme) }
      {combine_css path="themes/`$theme.id`/theme.css" order=10}
    {/if}
  {/if}
  {if !empty($theme.local_head)}{include file=$theme.local_head load_css=$theme.load_css}{/if}
  {/foreach}

  {if isset($U_PREFETCH)}<link rel="prefetch" href="{$U_PREFETCH}">{/if}
  {if isset($U_CANONICAL)}<link rel="canonical" href="{$U_CANONICAL}">{/if}
  {if not empty($page_refresh)}
  <meta http-equiv="refresh" content="{$page_refresh.TIME};url={$page_refresh.U_REFRESH}">
  {/if}
  {if isset($U_FEED)}
  <link rel="alternate" type="application/rss+xml" title="{'Image only RSS feed'|@translate}" href="{$U_FEED_IMAGE_ONLY}">
  <link rel="alternate" type="application/rss+xml" title="{'Complete RSS feed (images, comments)'|@translate}" href="{$U_FEED}">
  {/if}

  <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  {get_combined_scripts load='header'}
  {combine_script id='jquery' path='themes/simpleng/js/jquery-1.7.1.min.js'}
  {combine_script id='jquery.infinitescroll' path='themes/simpleng/js/jquery.infinitescroll.min.js'}
  {combine_script id='bootstrap' require='jquery' path='themes/simpleng/js/bootstrap.min.js'}
  {combine_script id='simpleng.scripts' require='jquery' path='themes/simpleng/js/scripts.js'}

  {if not empty($head_elements)}
    {foreach from=$head_elements item=elt}{$elt}
    {/foreach}
  {/if}
  <script>
    document.documentElement.className = 'js';
  </script>
</head>
<body id="{$BODY_ID}">
{if isset($MENUBAR)}{$MENUBAR}{/if}

<div id="the_page" class="container">
  {if not empty($header_msgs)}
  <div class="header_msgs">
    {foreach from=$header_msgs item=elt}
    <p>{$elt}</p>
    {/foreach}
  </div>
  {/if}

  <header id="theHeader">
    <h1><a href="{$U_HOME}">{$PAGE_BANNER}</a></h1>
    {if isset($theSwiftHeader)}{$theSwiftHeader}{/if}
    {if not empty($header_notes)}
    <div class="header_notes">
      {foreach from=$header_notes item=elt}
      <p>{$elt}</p>
      {/foreach}
    </div>
    {/if}
  </header>

  <article id="content">

    {if isset($errors) and count($errors)}
    <div class="alert alert-error">
      <ul>
        {foreach from=$errors item=error}
        <li>{$error}</li>
        {/foreach}
      </ul>
    </div>
    {/if}

    {if isset($infos) and count($infos)}
    <div class="alert alert-info">
      <ul>
        {foreach from=$infos item=info}
        <li>{$info}</li>
        {/foreach}
      </ul>
    </div>
    {/if}
