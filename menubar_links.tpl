<h3>{'Links'|@translate}</h3>
<ul>
  {foreach from=$block->data item=link}
  <li><a href="{$link.URL}">{$link.LABEL}</a></li>
  {/foreach}
</ul>
