<div id="slideshow">
  <header class="titrePage">
    <span class="imageNumber headerActions">{$PHOTO}</span>

    {if $DISPLAY_NAV_BUTTONS}
    <div class="headerActions">
    {if isset($U_SLIDESHOW_STOP)}
      <a href="{$U_SLIDESHOW_STOP}" title="{'stop the slideshow'|@translate}">{'Stop'|@translate}</a>
    {/if}
    {if isset($slideshow.U_START_PLAY)}
      <a href="{$slideshow.U_START_PLAY}" title="{'Play of slideshow'|@translate}">Play</a>
    {/if}
    {if isset($slideshow)}
      {if isset($slideshow.U_STOP_PLAY)}
        <a href="{$slideshow.U_STOP_PLAY}" title="{'Pause of slideshow'|@translate}">Pause</a>
      {/if}
      {if isset($slideshow.U_DEC_PERIOD)}
        <a href="{$slideshow.U_DEC_PERIOD}" title="{'Accelerate diaporama speed'|@translate}">&nbsp;+&nbsp;</a>
      {/if}
      {if isset($slideshow.U_INC_PERIOD)}
        <a href="{$slideshow.U_INC_PERIOD}" title="{'Reduce diaporama speed'|@translate}">&nbsp;-&nbsp;</a>
      {/if}
    {/if}
    </div>
    {/if}

    {if $SHOW_PICTURE_NAME_ON_TITLE }
    <h2>{$current.TITLE}</h2>
    {/if}
  </header>
  <div id="theImage">
    {$ELEMENT_CONTENT}
    {if isset($COMMENT_IMG)}
    <p class="showlegend">{$COMMENT_IMG}</p>
    {/if}
  </div>
</div>

{include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}
