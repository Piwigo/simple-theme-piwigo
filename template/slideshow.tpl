<div id="slideshow">
  <header class="titrePage">
    <ul class="headerActions">
    {if $DISPLAY_NAV_BUTTONS}
    {if isset($U_SLIDESHOW_STOP)}
      <li><a href="{$U_SLIDESHOW_STOP}" title="{'stop the slideshow'|@translate}"><i class="icon-white icon-stop"></i></a></li>
    {/if}
    {if isset($slideshow.U_START_PLAY)}
      <li><a href="{$slideshow.U_START_PLAY}" title="{'Play of slideshow'|@translate}"><i class="icon-play icon-white"></i></a></li>
    {/if}
    {if isset($slideshow)}
      {if isset($slideshow.U_STOP_PLAY)}
        <li><a href="{$slideshow.U_STOP_PLAY}" title="{'Pause of slideshow'|@translate}"><i class="icon-pause icon-white"></i></a></li>
      {/if}
      {if isset($slideshow.U_DEC_PERIOD)}
        <li><a href="{$slideshow.U_DEC_PERIOD}" title="{'Accelerate diaporama speed'|@translate}"><i class="icon-plus icon-white"></i></a></li>
      {/if}
      {if isset($slideshow.U_INC_PERIOD)}
        <li><a href="{$slideshow.U_INC_PERIOD}" title="{'Reduce diaporama speed'|@translate}"><i class="icon-minus icon-white"></i></a></li>
      {/if}
    {/if}
    {/if}
    <li class="imageNumber headerActions">{$PHOTO}</li>
    </ul>

    {if isset($SHOW_PICTURE_NAME_ON_TITLE) }
    <h2><a href="{$current.URL}">{$current.TITLE}</a></h2>
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
