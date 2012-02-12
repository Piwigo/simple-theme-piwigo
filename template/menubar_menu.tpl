<a class="dropdown-toggle" data-toggle="dropdown" href="#">{'Menu'|@translate}</a>
<ul class="dropdown-menu">
{foreach from=$block->data item=link}
  {if is_array($link)}
  <li><a href="{$link.URL}" title="{$link.TITLE}" {if isset($link.REL)}{$link.REL}{/if}>{$link.NAME}</a></li>
  {/if}
{/foreach}
</ul>
