<div class="navigationBar">
  {if isset($navbar.URL_PREV)}
  <a href="{$navbar.URL_PREV}" class="prev" rel="prev">« {'Previous'|@translate}</a>
  {/if}

  {assign var='prev_page' value=0}
  {foreach from=$navbar.pages key=page item=url}
    {if $page > $prev_page+1}...{/if}
    {if $page == $navbar.CURRENT_PAGE}
    <span class="pageNumberSelected">{$page}</span>
    {else}
    <a href="{$url}">{$page}</a>
    {/if}
    {assign var='prev_page' value=$page}
  {/foreach}

  {if isset($navbar.URL_NEXT)}
  <a href="{$navbar.URL_NEXT}" class="next" rel="next">{'Next'|@translate} »</a>
  {/if}
</div>
