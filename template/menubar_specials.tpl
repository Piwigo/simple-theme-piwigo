<a class="dropdown-toggle" data-toggle="dropdown" href="#">{'Specials'|@translate}</a>
<ul class="dropdown-menu">
  {foreach from=$block->data item=link}
  <li><a href="{$link.URL}" title="{$link.TITLE}" {if isset($link.REL)}{$link.REL}{/if}>{$link.NAME}</a></li>
  {/foreach}
</ul>
