<div class="titrePage">
  <ul class="categoryActions">
    <li><a href="{$U_HOME}" title="{'Home'|@translate}">{'Home'|@translate}</a></li>
  </ul>
  <h2>{'About'|@translate}</h2>
</div>
<div id="content">
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
</div>
