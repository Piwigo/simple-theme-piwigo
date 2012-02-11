<header class="titrePage">
  <ul class="headerActions">
    {if isset($U_SLIDESHOW_START)}
    <li><a href="{$U_SLIDESHOW_START}" rel="nofollow">{'slideshow'|@translate}</a></li>
    {/if}
    {if isset($current.U_DOWNLOAD)}
    <li><a href="{$current.U_DOWNLOAD}" title="{'download this file'|@translate}">{'download'|@translate}</a></li>
    {/if}
    {if isset($PLUGIN_PICTURE_ACTIONS)}{$PLUGIN_PICTURE_ACTIONS}{/if}
    {if isset($favorite)}
    <li><a href="{$favorite.U_FAVORITE}">{if $favorite.IS_FAVORITE}{'delete this photo from your favorites'|@translate}
        {else}{'add this photo to your favorites'|@translate}{/if}</a></li>
    {/if}
    {if !empty($U_SET_AS_REPRESENTATIVE)}
    <li><a href="{$U_SET_AS_REPRESENTATIVE}" title="{'set as album representative'|@translate}">{'representative'|@translate}</a></li>
    {/if}
    {if isset($U_ADMIN)}
    <li><a href="{$U_ADMIN}">{'Modify information'|@translate}</a></li>
    {/if}
    <li class="imageNumber">{$PHOTO}</li>
  </ul>

  <p>{$SECTION_TITLE} {$LEVEL_SEPARATOR}</p>
  <h2>{$current.TITLE}</h2>
</header>

{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}

<figure id="theImage">
  {if isset($previous)}
  <a href="{$previous.U_IMG}" class="imgPrev" title="{'Previous'|@translate} : {$previous.TITLE}" rel="prev">&lsaquo;</a>
  {/if}

  {$ELEMENT_CONTENT}

  {if isset($next)}
  <a href="{$next.U_IMG}" class="imgNext" title="{'Next'|@translate} : {$next.TITLE}" rel="next">&rsaquo;</a>
  {/if}

  {if isset($COMMENT_IMG)}
  <figcaption>{$COMMENT_IMG}</figcaption>
  {/if}
</figure>

<div id="rating">
  {if isset($rating)}
  <span id="updateRate">{if isset($rating.USER_RATE)}{'Update your rating'|@translate}{else}{'Rate this photo'|@translate}{/if}</span>
  <form action="{$rating.F_ACTION}" method="post" id="rateForm">
    {foreach from=$rating.marks item=mark name=rate_loop}
    {if isset($rating.USER_RATE) && $mark==$rating.USER_RATE}
    <input type="button" name="rate" value="{$mark}" class="rateButtonSelected" title="{$mark}" />
    {else}
    <input type="submit" name="rate" value="{$mark}" class="rateButton" title="{$mark}" />
    {/if}
    {/foreach}
    {combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
    {combine_script id='rating' load='async' require='core.scripts' path='themes/default/js/rating.js'}

    {strip}
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
  </form>
  {/if}
</div>

<div id="tab-container" class="tab-container">
  <ul class="etabs">
    {if (isset($COMMENT_COUNT) and ($COMMENT_COUNT>0)) or isset($comment_add) }
    <li class="tab"><a href="#theComments" title="{'Add a comment'|@translate}">{$pwg->l10n_dec('%d comment', '%d comments',$COMMENT_COUNT)}</a></li>
    {/if}
    <li class="tab"><a href="#imageInfos">Informations</a></li>
    {if isset($metadata)}
    <li class="tab"><a href="#imageMeta">EXIF</a></li>
    {/if}
  </ul>

  {if (isset($COMMENT_COUNT) and ($COMMENT_COUNT>0)) or isset($comment_add) }
  <div id="theComments" class="clearfix">
    {if !empty($COMMENT_NAV_BAR)}
    <div class="navigationBar">{$COMMENT_NAV_BAR}</div>
    {/if}
    {if isset($comment_add)}
    <div id="commentAdd" class="seven columns">
      <h3>{'Add a comment'|@translate}</h3>
      <form  method="post" action="{$comment_add.F_ACTION}" class="filter">
	{if $comment_add.SHOW_AUTHOR}
	<label>{'Author'|@translate}&nbsp;:</label>
	<input type="text" name="author" />
	{/if}
	<label>{'Comment'|@translate}&nbsp;:</label>
	<textarea name="content" id="contentid">{$comment_add.CONTENT}</textarea>
	<input type="hidden" name="key" value="{$comment_add.KEY}" />
	<input type="submit" value="{'Submit'|@translate}">
      </form>
    </div>
    {/if}
    {if !empty($navbar) }{include file='navigation_bar.tpl'|@get_extent:'navbar'}{/if}
    {if isset($comments)}
    <div id="commentList" class="seven columns offset-by-one">
      {include file='comment_list.tpl'}
    </div>
    {/if}
  </div>
  {/if} {*comments*}

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
        <span id="ratingScore">{$rate_summary.score}</span>
	<span id="ratingCount">({assign var='rate_text' value='%d rates'|@translate}{$pwg->sprintf($rate_text, $rate_summary.count)})</span>
      {else}
	<span id="ratingScore">{'no rate'|@translate}</span>
	<span id="ratingCount"></span>
      {/if}
      </dd>
      {/if}
    </dl>
  </div> <!-- imageInfos -->

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
</div>

{if !empty($PLUGIN_PICTURE_AFTER)}{$PLUGIN_PICTURE_AFTER}{/if}

{include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}

{footer_script}
{literal}
  jQuery(document).ready(function($){
    $('#tab-container').easytabs({collapsible: true});
  });
{/literal}
{/footer_script}
