<div class="titrePage">
  <ul class="categoryActions">
    <li><a class="button" href="{$U_HOME}" title="{'return to homepage'|@translate}">{'Home'|@translate}</a></li>
  </ul>
  <h2>{'User comments'|@translate}</h2>
</div>
<div id="content">
  <form class="filter" action="{$F_ACTION}" method="get">
    <fieldset>
      <legend>{'Filter'|@translate}</legend>
      <ul>
        <li><div class="property">{'Keyword'|@translate}</div><input type="text" name="keyword" value="{$F_KEYWORD}" /></li>
        <li><div class="property">{'Author'|@translate}</div><input type="text" name="author" value="{$F_AUTHOR}" /></li>
        <li><div class="property">{'Category'|@translate}</div>
          <select name="cat">
            <option value="0">------------</option>
            {html_options options=$categories selected=$categories_selected}
          </select>
        </li>
        <li><div class="property">{'Since'|@translate}</div>
          <select name="since">
            {html_options options=$since_options selected=$since_options_selected}
          </select>
        </li>
      </ul>
    </fieldset>
    <fieldset>
      <legend>{'Display'|@translate}</legend>
      <ul>
        <li><div class="property">{'Sort by'|@translate}</div>
          <select name="sort_by">
            {html_options options=$sort_by_options selected=$sort_by_options_selected}
          </select>
        </li>
        <li><div class="property">{'Sort order'|@translate}</div>
          <select name="sort_order">
            {html_options options=$sort_order_options selected=$sort_order_options_selected}
          </select>
        </li>
        <li><div class="property">{'Number of items'|@translate}</div>
          <select name="items_number">
            {html_options options=$item_number_options selected=$item_number_options_selected}
          </select>
        </li>
      </ul>
    </fieldset>
    <p><input class="submit" type="submit" value="{'Filter and display'|@translate}"></p>
  </form>
  <div class="navigationBar">{$NAVBAR}</div>
  {if isset($comments)}
  <div id="comments">
    {include file='comment_list.tpl'}
  </div>
  {/if}
</div> <!-- content -->
