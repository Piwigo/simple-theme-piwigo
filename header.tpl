<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="{$lang_info.code}" dir="{$lang_info.direction}">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset={$CONTENT_ENCODING}">
  <meta name="generator" content="Piwigo (aka PWG), see piwigo.org">
  <title>{$PAGE_TITLE} :: {$GALLERY_TITLE}</title>
  <link rel="shortcut icon" type="image/x-icon" href="{$ROOT_URL}template-common/favicon.ico">
  <link rel="start" title="{'home'|@translate}" href="{$U_HOME}" >
  <link rel="search" title="{'Search'|@translate}" href="{$ROOT_URL}search.php" >
  {if isset($first.U_IMG)   }<link rel="first" title="{'first_page'|@translate}" href="{$first.U_IMG}" >{/if}
  {if isset($previous.U_IMG)}<link rel="prev" title="{'previous_page'|@translate}" href="{$previous.U_IMG}" >{/if}
  {if isset($next.U_IMG)    }<link rel="next" title="{'next_page'|@translate}" href="{$next.U_IMG}" >{/if}
  {if isset($last.U_IMG)    }<link rel="last" title="{'last_page'|@translate}" href="{$last.U_IMG}" >{/if}
  {if isset($U_UP)          }<link rel="up" title="{'thumbnails'|@translate}" href="{$U_UP}" >{/if}
  {$themeconf.local_head}
  {if isset($U_PREFETCH)}<link rel="prefetch" href="{$U_PREFETCH}">{/if}
  {if not empty($page_refresh)}<meta http-equiv="refresh" content="{$page_refresh.TIME};url={$page_refresh.U_REFRESH}">{/if}
  {if isset($U_FEED)}
  <link rel="alternate" type="application/rss+xml" title="{'Image only RSS feed'|@translate}" href="{$U_FEED_IMAGE_ONLY}">
  <link rel="alternate" type="application/rss+xml" title="{'Complete RSS feed'|@translate}" href="{$U_FEED}">
  {/if}
  <link rel="stylesheet" type="text/css" href="{$ROOT_URL}template/{$themeconf.template}/content.css">
  <link rel="stylesheet" type="text/css" href="{$ROOT_URL}template/{$themeconf.template}/theme/{$themeconf.theme}/theme.css">
  {if not empty($head_elements)}
    {foreach from=$head_elements item=elt}{$elt}
    {/foreach}
  {/if}
</head>
<body id="{$BODY_ID}">
<div id="the_page">
  {if not empty($header_msgs)}
  <div class="header_msgs">
    {foreach from=$header_msgs item=elt}
    <p>{$elt}</p>
    {/foreach}
  </div>
  {/if}
  <div id="theHeader">{$PAGE_BANNER}</div>
  {if isset($theSwiftHeader)}{$theSwiftHeader}{/if}
  {if not empty($header_notes)}
  <div class="header_notes">
    {foreach from=$header_notes item=elt}
    <p>{$elt}</p>
    {/foreach}
  </div>
  {/if}
