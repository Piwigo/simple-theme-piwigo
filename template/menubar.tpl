{if !empty($blocks) }
<nav id="menubar" class="row">
  <a id="menu-link" href="#theHeader" title="{'Go to top'|@translate}">↑ Top</a>

  {foreach from=$blocks key=id item=block}
  <div id="{$id}" class="four columns">
    {if not empty($block->template)}
    {include file=$block->template|@get_extent:$id }
    {else}
    {$block->raw_content}
    {/if}
  </div>
  {/foreach}
</nav>
{/if}
