<div class="titrePage">
  <ul class="categoryActions">
    <li><a href="{$U_HOME}" title="{'return to homepage'|@translate}">{'Home'|@translate}</a></li>
  </ul>
  <h2>{'Profile'|@translate}</h2>
</div>
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
{$PROFILE_CONTENT}
</div> <!-- content -->
