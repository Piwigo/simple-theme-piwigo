<header class="titrePage">
  <h2>{'User comments'|@translate}</h2>
</header>

<form class="subcontent" action="{$F_ACTION}" method="get">
  <fieldset>
    <legend>{'Filter'|@translate}</legend>
    <label>{'Keyword'|@translate} : <input type="text" name="keyword" value="{$F_KEYWORD}"></label>
    <label>{'Author'|@translate} : <input type="text" name="author" value="{$F_AUTHOR}"></label>
    <label>{'Album'|@translate} :
    <select name="cat">
      <option value="0">------------</option>
      {html_options options=$categories selected=$categories_selected}
    </select>
    </label>
    <label>{'Since'|@translate} :
    <select name="since">
      {html_options options=$since_options selected=$since_options_selected}
    </select>
    </label>
  </fieldset>
  <fieldset>
    <legend>{'Display'|@translate}</legend>
    <label>{'Sort by'|@translate} :
    <select name="sort_by">
      {html_options options=$sort_by_options selected=$sort_by_options_selected}
    </select>
    </label>
    <label>{'Sort order'|@translate} :
    <select name="sort_order">
      {html_options options=$sort_order_options selected=$sort_order_options_selected}
    </select>
    </label>
    <label>{'Number of items'|@translate} :
    <select name="items_number">
      {html_options options=$item_number_options selected=$item_number_options_selected}
    </select>
    </label>
  </fieldset>
  <input type="submit" value="{'Filter and display'|@translate}" class="btn">
</form>
{if !empty($navbar) }{include file='navigation_bar.tpl'|@get_extent:'navbar'}{/if}

{if isset($comments)}
<div id="comments">
  {if isset($COMMENT_LIST)}
    {$COMMENT_LIST}
  {else}
    {include file='comment_list.tpl'}
  {/if}
</div>
{/if}
