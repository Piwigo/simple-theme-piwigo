{php}remove_event_handler('loc_end_index', 'hide_main_block');{/php}
{foreach from=$blocks item=block key=key}
{if isset($block.TITLE)}
<div class="titrePage">
  {if !empty($block.U_EDIT)}
    <ul class="categoryActions">
      <li><a href="{$block.U_EDIT}" title="{'edit'|@translate}">{'edit'|@translate}</a></li>
    </ul>
  {/if}
  {if isset($block.TITLE_URL)}
    <h2><a href="{$block.TITLE_URL}">{$block.TITLE}</a></h2>
  {else}
    <h2>{$block.TITLE}</h2>
  {/if}
</div>
{/if}
<div class="subcontent" class="stuffs_block">
  <div id="stuffs_block_{$block.ID}">
    {include file=$block.TEMPLATE}
  </div>
</div>
{/foreach}
