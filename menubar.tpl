{if !empty($blocks) }
<div id="menubar">
  {foreach from=$blocks key=id item=block}
  {if ( not empty($block->template) or not empty($block->raw_content) )}
  <div id="{$id}">
    {if not empty($block->template)}
    {include file=$block->template|@get_extent:$id }
    {else}
    {$block->raw_content}
    {/if}
  </div>
  {/if}
  {/foreach}
</div>
{/if}
