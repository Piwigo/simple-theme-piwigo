<div class="titrePage">
  <div class="imageNumber">{$PHOTO}</div>
    {$SECTION_TITLE}
    {$LEVEL_SEPARATOR} <h2>{$current.TITLE}</h2>
</div> <!-- imageHeaderBar -->
{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}
{* {if isset($MENUBAR)}{$MENUBAR}{/if} *}

{if isset($errors)}
<div class="errors">
  <ul>
    {foreach from=$errors item=error}
    <li>{$error}</li>
    {/foreach}
  </ul>
</div>
{/if}

{if isset($infos)}
<div class="infos">
  <ul>
    {foreach from=$infos item=info}
    <li>{$info}</li>
    {/foreach}
  </ul>
</div>
{/if}

<div id="theImage">
  {$ELEMENT_CONTENT}
  {if isset($COMMENT_IMG)}
  <p>{$COMMENT_IMG}</p>
  {/if}
</div> <!-- theImage -->

<div id="imageInfoBar">
  <div id="imageToolBar">
    {include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}
  </div>
{if $DISPLAY_NAV_THUMB}
  {if isset($previous) }
  <div id="navThumbPrev">
    <a class="navThumb" href="{$previous.U_IMG}" title="{'Previous'|@translate} : {$previous.TITLE}" rel="prev">
      <img src="{$previous.THUMB_SRC}" alt="{$previous.TITLE}"></a>
  </div>
  {/if}
  {if isset($next) }
  <div id="navThumbNext">
    <a class="navThumb" href="{$next.U_IMG}" title="{'Next'|@translate} : {$next.TITLE}" rel="next">
      <img src="{$next.THUMB_SRC}" alt="{$next.TITLE}"></a>
  </div>
  {/if}
{/if}
  <div id="randomButtons">
    <ul>
      {if isset($U_SLIDESHOW_START) }
      <li><a href="{$U_SLIDESHOW_START}" title="{'slideshow'|@translate}" rel="nofollow">{'slideshow'|@translate}</a></li>
      {/if}
      {if isset($U_METADATA) }
      <li><a href="{$U_METADATA}" title="{'Show file metadata'|@translate}" rel="nofollow">{'Show file metadata'|@translate}</a></li>
      {/if}
      {if isset($current.U_DOWNLOAD) }
      <li><a href="{$current.U_DOWNLOAD}" title="{'download this file'|@translate}">{'download'|@translate}</a></li>
      {/if}
      {if isset($PLUGIN_PICTURE_ACTIONS)}{$PLUGIN_PICTURE_ACTIONS}{/if}
      {if isset($favorite) }
      <li><a href="{$favorite.U_FAVORITE}" title="{$favorite.FAVORITE_HINT}">{$favorite.FAVORITE_HINT}</a></li>
      {/if}
      {if !empty($U_SET_AS_REPRESENTATIVE) }
      <li><a href="{$U_SET_AS_REPRESENTATIVE}" title="{'set as album representative'|@translate}">{'representative'|@translate}</a></li>
      {/if}
      {if isset($U_ADMIN) }
      <li><a href="{$U_ADMIN}" title="{'Modify information'|@translate}">{'Modify information'|@translate}</a></li>
      {/if}
    </ul>
  </div>
  {if isset($metadata)}
  <div id="imageMeta">
    {foreach from=$metadata item=meta}
    <h3>{$meta.TITLE}</h3>
    <dl>
      {foreach from=$meta.lines item=value key=label}
      <dt>{$label}</dt>
      <dd>{$value}</dd>
      {/foreach}
    </dl>
    {/foreach}
  </div> <!-- imageMeta -->
  {/if}
  <div id="imageInfos">
    <dl>
      {if $display_info.author and isset($INFO_AUTHOR)}
      <dt>{'Author'|@translate}</dt>
      <dd>{$INFO_AUTHOR}</dd>
      {/if}
      {if $display_info.created_on and isset($INFO_CREATION_DATE)}
      <dt>{'Created on'|@translate}</dt>
      <dd>{$INFO_CREATION_DATE}</dd>
      {/if}
      {if $display_info.posted_on}
      <dt>{'Posted on'|@translate}</dt>
      <dd>{$INFO_POSTED_DATE}</dd>
      {/if}
      {if $display_info.tags and isset($related_tags)}
      <dt>{'Tags'|@translate}</dt>
      <dd id="Tags">
	{foreach from=$related_tags item=tag name=tag_loop}
	{if !$smarty.foreach.tag_loop.first}, {/if}
	<a href="{$tag.URL}">{$tag.name}</a>
	{/foreach}
      </dd>
      {/if}
      {if $display_info.categories and isset($related_categories)}
      <dt>{'Albums'|@translate}</dt>
      <dd>
	{foreach from=$related_categories item=cat name=tag_loop}
	{if !$smarty.foreach.tag_loop.first}, {/if}
	{'&nbsp;'|@str_ireplace:'&#32;':$cat}{/foreach}
      </dd>
      {/if}
      {if $display_info.visits}
      <dt>{'Visits'|@translate}</dt>
      <dd>{$INFO_VISITS}</dd>
      {/if}

	{if $display_info.rating_score and isset($rate_summary)}
	<dt id="Average">{'Rating score'|@translate}</dt>
	<dd id="ratingSummary">
	{if $rate_summary.count}
		<span id="ratingScore">{$rate_summary.score}</span> <span id="ratingCount">({assign var='rate_text' value='%d rates'|@translate}{$pwg->sprintf($rate_text, $rate_summary.count)})</span>
	{else}
		<span id="ratingScore">{'no rate'|@translate}</span> <span id="ratingCount"></span>
	{/if}
	</dd>
	{/if}

      {if isset($rating)}
      <dt><span id="updateRate">{if isset($rating.USER_RATE)}{'Update your rating'|@translate}{else}{'Rate this photo'|@translate}{/if}</span></dt>
      <dd>
	<form action="{$rating.F_ACTION}" method="post" id="rateForm">
	  <div>&nbsp;
	    {foreach from=$rating.marks item=mark name=rate_loop}
	    {if isset($rating.USER_RATE) && $mark==$rating.USER_RATE}
	    <input type="button" name="rate" value="{$mark}" class="rateButtonSelected" title="{$mark}" />
	    {else}
	    <input type="submit" name="rate" value="{$mark}" class="rateButton" title="{$mark}" />
	    {/if}
	    {/foreach}
      {strip}{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
      {combine_script id='rating' load='async' require='core.scripts' path='themes/default/js/rating.js'}
      {footer_script}
      var _pwgRatingAutoQueue = _pwgRatingAutoQueue||[];
      _pwgRatingAutoQueue.push( {ldelim}rootUrl: '{$ROOT_URL}', image_id: {$current.id},
      onSuccess : function(rating) {ldelim}
      var e = document.getElementById("updateRate");
      if (e) e.innerHTML = "{'Update your rating'|@translate|@escape:'javascript'}";
      e = document.getElementById("ratingScore");
      if (e) e.innerHTML = rating.score;
      e = document.getElementById("ratingCount");
      if (e) e.innerHTML = "({'%d rates'|@translate|@escape:'javascript'})".replace( "%d", rating.count);
      {rdelim}{rdelim} );
      {/footer_script}
      {/strip}
	  </div>
	</form>
      </dd>
      {/if}
    </dl>
  </div> <!-- imageInfos -->
</div>
<div style="clear: both;"></div>

{if (isset($COMMENT_COUNT) and ($COMMENT_COUNT>0)) or isset($comment_add) }
<div id="theComments">
  <h3 title="{'Add a comment'|@translate}">{$pwg->l10n_dec('%d comment', '%d comments',$COMMENT_COUNT)}</h3>
    {if !empty($COMMENT_NAV_BAR)}
    <div class="navigationBar">{$COMMENT_NAV_BAR}</div>
    {/if}
    {if isset($comment_add)}
    <div id="commentAdd">
      <h4>{'Add a comment'|@translate}</h4>
      <form  method="post" action="{$comment_add.F_ACTION}" class="filter">
	{if $comment_add.SHOW_AUTHOR}
	<p><label>{'Author'|@translate}&nbsp;:</label></p>
	<p><input type="text" name="author" /></p>
	{/if}
	<p><label>{'Comment'|@translate}&nbsp;:</label></p>
	<p><textarea name="content" id="contentid" rows="5" cols="50">{$comment_add.CONTENT}</textarea></p>
	<p><input type="hidden" name="key" value="{$comment_add.KEY}" />
	  <input class="submit" type="submit" value="{'Submit'|@translate}"></p>
      </form>
    </div>
    {/if}
    {if !empty($navbar) }{include file='navigation_bar.tpl'|@get_extent:'navbar'}{/if}
    {if isset($comments)}
    <div id="commentList">
      {include file='comment_list.tpl'}
    </div>
    {/if}
</div>
{/if} {*comments*}

{if !empty($PLUGIN_PICTURE_AFTER)}{$PLUGIN_PICTURE_AFTER}{/if}
