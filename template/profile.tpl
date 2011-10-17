{assign var='pagetitle' value='Profile'}
{include file='pagetitle.tpl'}

<div id="content">
  {if isset($MENUBAR)}{$MENUBAR}{/if}
  {if isset($errors)}
  <div class="errors">
    <ul>
      {foreach from=$errors item=error}
      <li>{$error}</li>
      {/foreach}
    </ul>
  </div>
  {/if}
  {$PROFILE_CONTENT}
  <div style="clear: both;"></div>
</div> <!-- content -->
