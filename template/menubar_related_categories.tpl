<a id="relatedCategoriesDropdownMenu" class="dropdown-toggle" data-toggle="dropdown" href="#">{'Related albums'|@translate}</a>
<ul class="dropdown-menu">
{foreach from=$block->data.MENU_CATEGORIES item=cat}
  <li>
       <{if isset($cat.url)}a href="{$cat.url}"{else}span style="padding: 3px 20px;"{/if} class="dropdown-item">{'&nbsp;'|@str_repeat:($cat.LEVEL-1)}{$cat.name}
  {if $cat.count_images > 0}
        <span class="badge badge-primary ml-2" title="{$cat.TITLE}">{$cat.count_images}</span>
  {/if}
  {if $cat.count_categories > 0}
        <span class="badge badge-secondary ml-2" title="{'sub-albums'|translate}">{$cat.count_categories}</span>
  {/if}
       </{if isset($cat.url)}a{else}span{/if}>
  </li>
{/foreach}
</ul>