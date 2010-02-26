<div id="slideshow" class="titrePage">
  <div class="imageNumber">{$PHOTO}</div>
  {include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}
  {if $SHOW_PICTURE_NAME_ON_TITLE }
  <h2>{$current.TITLE}</h2>
  {/if}
</div>
<div id="theImage">
  {$ELEMENT_CONTENT}
  {if isset($COMMENT_IMG)}
  <p class="showlegend">{$COMMENT_IMG}</p>
  {/if}
</div>
