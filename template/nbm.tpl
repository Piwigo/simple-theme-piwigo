<div class="titrePage">
  <ul class="categoryActions">
    <li><a href="{$U_HOME}" title="{'Go through the gallery as a visitor'|@translate}">{'Home'|@translate}</a></li>
  </ul>
  <h2>{'Notification'|@translate}</h2>
</div>
<div id="content">
  {if not empty($errors)}
  <div class="errors">
    <ul>
      {foreach from=$errors item=error}
      <li>{$error}</li>
      {/foreach}
    </ul>
  </div>
  {/if}
  {if not empty($infos)}
  <div class="infos">
    <ul>
      {foreach from=$infos item=info}
      <li>{$info}</li>
      {/foreach}
    </ul>
  </div>
  {/if}
</div>
