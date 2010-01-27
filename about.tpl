<div class="titrePage">
  <ul class="categoryActions">
    <li><a href="{$U_HOME}" title="{'return to homepage'|@translate}">{'home'|@translate}</a></li>
  </ul>
  <h2>{'About'|@translate}</h2>
</div>
<div id="content">
  <ul>
  {$ABOUT_MESSAGE}
  {if isset($THEME_ABOUT) }
  <li>{$THEME_ABOUT}</li>
  {/if}
  </ul>
</div>
