<header class="titrePage">
  <h2>{'Profile'|@translate}</h2>
</header>

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
