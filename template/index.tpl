{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}
<div class="titrePage">
  <span id="menuswitcher" title="{'Show/hide menu'|@translate}">Menu</span> »
  {if isset($U_EDIT) or isset($U_SLIDESHOW) or !empty($PLUGIN_INDEX_ACTIONS)}
  <ul class="categoryActions">
    {if isset($U_EDIT)}
    <li><a href="{$U_EDIT}" title="{'edit album informations'|@translate}">{'edit'|@translate}</a></li>
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
  {if isset($MENUBAR)}{$MENUBAR}{/if}
  <div class="subcontent">
    {if isset($chronology.TITLE) }
    <h2>{$chronology.TITLE}</h2>
    {/if}
    {if isset($chronology_views) }
    {if isset($U_MODE_POSTED) }
    <a href="{$U_MODE_POSTED}" rel="nofollow">{'display a calendar by posted date'|@translate}</a>
    {/if}
    {if isset($U_MODE_CREATED) }
    <a href="{$U_MODE_CREATED}" rel="nofollow">{'display a calendar by creation date'|@translate}</a>
    {/if}
    <div class="calendarViews">{'View'|@translate}:
    <select onchange="document.location = this.options[this.selectedIndex].value;">
      {foreach from=$chronology_views item=view}
      <option value="{$view.VALUE}"{if $view.SELECTED} selected="selected"{/if}>{$view.CONTENT}</option>
      {/foreach}
    </select>
    </div>
    {/if}

    {if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}
    {if !empty($category_search_results) }
    <div>{'Album results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
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
    {if isset($FILE_CHRONOLOGY_VIEW) }
      {include file=$FILE_CHRONOLOGY_VIEW}
    {/if}

    {if !empty($CATEGORIES) }{$CATEGORIES}{/if}
    {if !empty($THUMBNAILS) }<div id="thumbnails">{$THUMBNAILS}</div>{/if}
    {if !empty($navbar) }{include file='navigation_bar.tpl'|@get_extent:'navbar'}{/if}
    {if !empty($PLUGIN_INDEX_CONTENT_END) }{$PLUGIN_INDEX_CONTENT_END}{/if}
  </div> <!-- subContent -->
  {if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}
  <div style="clear: both;"></div>
</div> <!-- content -->

