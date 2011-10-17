{assign var='pagetitle' value='About'}
{include file='pagetitle.tpl'}

<div id="content">
  {if isset($MENUBAR)}{$MENUBAR}{/if}
  {$ABOUT_MESSAGE}
  {if isset($THEME_ABOUT) }
  <ul>
    <li>{$THEME_ABOUT}</li>
  </ul>
  {/if}
  {if not empty($about_msgs)}
  {foreach from=$about_msgs item=elt}
  {$elt}
  {/foreach}
  {/if}
  <div style="clear: both;"></div>
</div>
