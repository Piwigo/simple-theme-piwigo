<header class="titrePage">
  <ul class="headerActions">
    {if isset($U_SLIDESHOW_START)}
    <li><a href="{$U_SLIDESHOW_START}" title="{'slideshow'|@translate}" rel="nofollow"><i class="icon-play icon-white"></i></a></li>
    {/if}
    {if isset($current.U_DOWNLOAD)}
    <li><a href="{$current.U_DOWNLOAD}" title="{'download this file'|@translate}"><i class="icon-download icon-white"></i></a></li>
    {/if}
    {if isset($PLUGIN_PICTURE_ACTIONS)}{$PLUGIN_PICTURE_ACTIONS}{/if}
    {if isset($favorite)}
    <li><a href="{$favorite.U_FAVORITE}">{if $favorite.IS_FAVORITE}<i class="icon-star icon-white"></i>{else}<i class="icon-star-empty icon-white"></i>{/if}</a></li>
    {/if}
    {if !empty($U_SET_AS_REPRESENTATIVE)}
    <li><a href="{$U_SET_AS_REPRESENTATIVE}" title="{'set as album representative'|@translate}"><i class="icon-picture icon-white"></i></a></li>
    {/if}
    {if isset($U_ADMIN)}
    <li><a href="{$U_ADMIN}"><i class="icon-edit icon-white"></i></a></li>
    {/if}
    <li class="imageNumber">{$PHOTO}</li>
  </ul>

  <h2>{$SECTION_TITLE} {$LEVEL_SEPARATOR} <a href="{$current.URL}">{$current.TITLE}</a></h2>
</header>

{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}

<div class="subcontent">
  <nav class="picture_nav">
    {if isset($previous)}
    <a href="{$previous.U_IMG}" class="imgPrev" title="{'Previous'|@translate} : {$previous.TITLE}" rel="prev">&lsaquo;</a>
    {/if}
    {if isset($previous) and isset($next)}
    <span class="spacing"></span>
    {/if}
    {if isset($next)}
    <a href="{$next.U_IMG}" class="imgNext" title="{'Next'|@translate} : {$next.TITLE}" rel="next">&rsaquo;</a>
    {/if}
  </nav>
  <figure id="theImage">
    {$ELEMENT_CONTENT}

    {if isset($COMMENT_IMG)}
    <figcaption>{$COMMENT_IMG}</figcaption>
    {/if}
  </figure>
</div>

<div id="rating">
  {if isset($rating)}
  <span id="updateRate">{if isset($rating.USER_RATE)}{'Update your rating'|@translate}{else}{'Rate this photo'|@translate}{/if}</span>
  <form action="{$rating.F_ACTION}" method="post" id="rateForm">
    {foreach from=$rating.marks item=mark name=rate_loop}
    {if isset($rating.USER_RATE) && $mark==$rating.USER_RATE}
    <input type="button" name="rate" value="{$mark}" class="rateButtonSelected" title="{$mark}">
    {else}
    <input type="submit" name="rate" value="{$mark}" class="rateButton" title="{$mark}">
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

<ul class="nav nav-pills tabs">
  {if (isset($COMMENT_COUNT) and ($COMMENT_COUNT>0)) or isset($comment_add) }
  <li><a href="#theComments" title="{'Add a comment'|@translate}" data-toggle="tab"><i class="icon-comment icon-white"></i> {$pwg->l10n_dec('%d comment', '%d comments',$COMMENT_COUNT)}</a></li>
  {/if}
  <li><a href="#imageInfos" data-toggle="tab"><i class="icon-file icon-white"></i> Informations</a></li>
  {if isset($metadata)}
  <li><a href="#imageMeta" data-toggle="tab"><i class="icon-camera icon-white"></i> EXIF</a></li>
  {/if}
</ul>

<div class="tab-content">
  {if (isset($COMMENT_COUNT) and ($COMMENT_COUNT>0)) or isset($comment_add)}
  <div id="theComments" class="row tab-pane fade">
    {if !empty($COMMENT_NAV_BAR)}
    <div class="navigationBar">{$COMMENT_NAV_BAR}</div>
    {/if}
    {if isset($comment_add)}
    <div id="commentAdd" class="span6">
      <h3>{'Add a comment'|@translate}</h3>
      <form  method="post" action="{$comment_add.F_ACTION}" class="filter">
	{if $comment_add.SHOW_AUTHOR}
        <label for="author">{'Author'|@translate}{if $comment_add.AUTHOR_MANDATORY} ({'mandatory'|@translate}){/if} :</label>
        <input type="text" name="author" id="author" value="{$comment_add.AUTHOR}">
	{/if}

        {if $comment_add.SHOW_EMAIL}
        <label for="email">{'Email'|@translate}{if $comment_add.EMAIL_MANDATORY} ({'mandatory'|@translate}){/if} :</label>
        <input type="text" name="email" id="email" value="{$comment_add.EMAIL}">
        {/if}

        <label for="website_url">{'Website'|@translate} :</label>
        <input type="text" name="website_url" id="website_url" value="{$comment_add.WEBSITE_URL}">

	<label for="contentid">{'Comment'|@translate} ({'mandatory'|@translate}) :</label>
	<textarea name="content" id="contentid">{$comment_add.CONTENT}</textarea>
	<input type="hidden" name="key" value="{$comment_add.KEY}">
	<input type="submit" value="{'Submit'|@translate}" class="btn">
      </form>
    </div>
    {/if}
    {if !empty($navbar) }{include file='navigation_bar.tpl'|@get_extent:'navbar'}{/if}
    {if isset($comments)}
    <div id="commentList" class="span6">
      {include file='comment_list.tpl'}
    </div>
    {/if}
  </div>
  {/if} {*comments*}

  <div id="imageInfos" class="tab-pane fade">
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
  <div id="imageMeta" class="tab-pane fade">
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
