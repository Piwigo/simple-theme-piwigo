<h3>{'Menu'|@translate}</h3>
<ul>
{foreach from=$block->data item=link}
  {if is_array($link)}
  <li><a href="{$link.URL}" title="{$link.TITLE}" {if isset($link.REL)}{$link.REL}{/if}>{$link.NAME}</a></li>
  {/if}
{/foreach}
</ul>
