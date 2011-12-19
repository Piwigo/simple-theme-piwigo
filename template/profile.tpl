{assign var='pagetitle' value='Profile'}
{include file='pagetitle.tpl'}

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
