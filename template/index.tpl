{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}
<div class="titrePage">
  <span id="menuswitcher" title="Afficher/cacher le menu">Menu</span> »
  {if isset($U_EDIT) or isset($U_SLIDESHOW) or !empty($PLUGIN_INDEX_ACTIONS)}
  <ul class="categoryActions">
    {if isset($U_EDIT)}
    <li><a href="{$U_EDIT}" title="{'edit category informations'|@translate}">{'edit'|@translate}</a></li>
    {/if}
    {if isset($U_SLIDESHOW)}
    <li><a href="{$U_SLIDESHOW}" title="{'slideshow'|@translate}" rel="nofollow">{'slideshow'|@translate}</a></li>
    {/if}
    {if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
  </ul>
  {/if}
  <h2>{$TITLE}</h2>
</div>
<div id="content">
  {$MENUBAR}
  <div id="subcontent">
    {if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}
    {if !empty($category_search_results) }
    <div>{'Category results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
      {foreach from=$category_search_results item=res name=res_loop}
      {if !$smarty.foreach.res_loop.first} &mdash; {/if}
      {$res}
      {/foreach}
    </div>
    {/if}
    {if !empty($tag_search_results) }
    <div>{'Tag results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
      {foreach from=$tag_search_results item=res name=res_loop}
      {if !$smarty.foreach.res_loop.first} &mdash; {/if}
      {$res}
      {/foreach}
    </div>
    {/if}
    {if !empty($CONTENT_DESCRIPTION) }
    <p id="additional_info">
      {$CONTENT_DESCRIPTION}
    </p>
    {/if}
    {if !empty($CATEGORIES) }<div id="categories">{$CATEGORIES}</div>{/if}
    {if !empty($THUMBNAILS) }<div id="thumbnails">{$THUMBNAILS}</div>{/if}
    {if !empty($navbar) }{include file='navigation_bar.tpl'|@get_extent:'navbar'}{/if}
    {if !empty($PLUGIN_INDEX_CONTENT_END) }{$PLUGIN_INDEX_CONTENT_END}{/if}
  </div> <!-- subContent -->
  <div style="clear: both;"></div>
</div> <!-- content -->
{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}
