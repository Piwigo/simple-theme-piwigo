<div class="titrePage">
  <div class="imageNumber">{$PHOTO}</div>
    {$SECTION_TITLE}
    {$LEVEL_SEPARATOR} <h2>{$current.TITLE}</h2>
</div> <!-- imageHeaderBar -->
{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}
<div id="content">
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
        <li><a href="{$U_SET_AS_REPRESENTATIVE}" title="{'set as category representative'|@translate}">{'representative'|@translate}</a></li>
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
        {if $display_info.author}
        <dt>{'Author'|@translate}</dt>
        <dd>{$INFO_AUTHOR}</dd>
        {/if}
         {if $display_info.created_on}
        <dt>{'Created on'|@translate}</dt>
        <dd>{$INFO_CREATION_DATE}</dd>
        {/if}
		 {if $display_info.posted_on}
        <dt>{'Posted on'|@translate}</dt>
        <dd>{$INFO_POSTED_DATE}</dd>
		{/if}
        {if isset($related_tags)}
        <dt>{'Tags'|@translate}</dt>
        <dd>{foreach from=$related_tags item=tag name=tag_loop}
          {if !$smarty.foreach.tag_loop.first}, {/if}
          <a href="{$tag.URL}">{$tag.name}</a>{/foreach}</dd>
        {/if}
         {if $display_info.tags}
        <dt>{'Categories'|@translate}</dt>
        <dd>
          {foreach from=$related_categories item=cat name=tag_loop}
          {if !$smarty.foreach.tag_loop.first}, {/if} {'&nbsp;'|@str_ireplace:'&#32;':$cat}{/foreach}
        </dd>
        {/if}
		 {if $display_info.visits}
        <dt>{'Visits'|@translate}</dt>
        <dd>{$INFO_VISITS}</dd>
		 {/if}
        {if $display_info.average_rate and isset($rate_summary) }
        <dt>{'Average rate'|@translate}</dt>
        <dd id="ratingSummary">
          {if $rate_summary.count}
          {assign var='rate_text' value='%.2f (rated %d times)'|@translate }
          {$pwg->sprintf($rate_text, $rate_summary.average, $rate_summary.count) }
          {else}
          {'no rate'|@translate}
          {/if}
        </dd>
        {/if}
        {if isset($rating)}
        <dt><span id="updateRate">{if isset($rating.USER_RATE)}{'Update your rating'|@translate}{else}{'Rate this picture'|@translate}{/if}</span></dt>
        <dd>
          <form action="{$rating.F_ACTION}" method="post" id="rateForm">
            <div>&nbsp;
              {foreach from=$rating.marks item=mark name=rate_loop}
              {if !$smarty.foreach.rate_loop.first} | {/if}
              {if isset($rating.USER_RATE) && $mark==$rating.USER_RATE}
              <input type="button" name="rate" value="{$mark}" class="rateButtonSelected" title="{$mark}" />
              {else}
              <input type="submit" name="rate" value="{$mark}" class="rateButton" title="{$mark}" />
              {/if}
              {/foreach}
              <script type="text/javascript">
                makeNiceRatingForm( {ldelim}rootUrl: '{$ROOT_URL|@escape:"javascript"}',
                image_id: {$current.id},
                updateRateText: "{'Update your rating'|@translate|@escape:'javascript'}",
                updateRateElement: document.getElementById("updateRate"),
                ratingSummaryText: "{'%.2f (rated %d times)'|@translate|@escape:'javascript'}",
                ratingSummaryElement: document.getElementById("ratingSummary") {rdelim} );
              </script>
            </div>
          </form>
        </dd>
        {/if}
      </dl>
    </div> <!-- imageInfos -->
  </div>
  <div id="theImage">
    {$ELEMENT_CONTENT}
    {if isset($COMMENT_IMG)}
    <p>{$COMMENT_IMG}</p>
    {/if}
  </div> <!-- theImage -->
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
  <div style="clear: both;"></div>
</div>
{if !empty($PLUGIN_PICTURE_AFTER)}{$PLUGIN_PICTURE_AFTER}{/if}
