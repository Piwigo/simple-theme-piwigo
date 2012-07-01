<header class="titrePage">
  <h2>{'Search'|@translate}</h2>
</header>

<form class="filter subcontent form-horizontal" method="post" name="search" action="{$F_SEARCH_ACTION}">
<fieldset>
  <legend>{'Filter'|@translate}</legend>
  <div class="control-group">
    <label>{'Search for words'|@translate}</label>
    <div class="controls">
      <input type="text" name="search_allwords">
      <label class="radio inline"><input type="radio" name="mode" value="AND" checked="checked">{'Search for all terms'|@translate}</label>
      <label class="radio inline"><input type="radio" name="mode" value="OR">{'Search for any terms'|@translate}</label>
    </div>
  </div>
  <div class="control-group">
    <label>{'Search for Author'|@translate}</label>
    <div class="controls">
      <input type="text" name="search_author">
    </div>
  </div>
</fieldset>

{if isset($TAG_SELECTION)}
<fieldset>
  <legend>{'Search tags'|@translate}</legend>
  {$TAG_SELECTION}
  <label><input type="radio" name="tag_mode" value="AND" checked="checked">{'All tags'|@translate}</label>
  <label><input type="radio" name="tag_mode" value="OR">{'Any tag'|@translate}</label>
</fieldset>
{/if}

<fieldset>
  <legend>{'Search by Date'|@translate}</legend>
  <div class="control-group">
    <label>{'Kind of date'|@translate}</label>
    <div class="controls">
      <label class="radio inline"><input type="radio" name="date_type" value="date_creation" checked="checked">{'Creation date'|@translate}</label>
      <label class="radio inline"><input type="radio" name="date_type" value="date_available"> {'Post date'|@translate}</label>
    </div>
  </div>

  <div class="control-group">
    <label>{'Date'|@translate}</label>
    <div class="controls">
      <select id="start_day" name="start_day">
        <option value="0">--</option>
        {section name=day start=1 loop=32}
        <option value="{$smarty.section.day.index}" {if $smarty.section.day.index==$START_DAY_SELECTED}selected="selected"{/if}>{$smarty.section.day.index}</option>
        {/section}
      </select>
      <select id="start_month" name="start_month">
        {html_options options=$month_list selected=$START_MONTH_SELECTED}
      </select>
      <input id="start_year" name="start_year" type="text">
      <input id="start_linked_date" name="start_linked_date" type="hidden" disabled="disabled">
      <p class="help-block>
        <a class="date_today" href="#" onClick="document.search.start_day.value={$smarty.now|date_format:"%d"};document.search.start_month.value={$smarty.now|date_format:"%m"};document.search.start_year.value={$smarty.now|date_format:"%Y"};return false;">{'today'|@translate}</a>
      </p>
    </div>
  </div>

  <div class="control-group">
    <label>{'End-Date'|@translate}</label>
    <div class="controls">
      <select id="end_day" name="end_day">
        <option value="0">--</option>
        {section name=day start=1 loop=32}
        <option value="{$smarty.section.day.index}" {if $smarty.section.day.index==$END_DAY_SELECTED}selected="selected"{/if}>{$smarty.section.day.index}</option>
        {/section}
      </select>
      <select id="end_month" name="end_month">
        {html_options options=$month_list selected=$END_MONTH_SELECTED}
      </select>
      <input id="end_year" name="end_year" type="text">
      <input id="end_linked_date" name="end_linked_date" type="hidden" disabled="disabled">
      <p class="help-block>
        <a class="date_today" href="#" onClick="document.search.end_day.value={$smarty.now|date_format:"%d"};document.search.end_month.value={$smarty.now|date_format:"%m"};document.search.end_year.value={$smarty.now|date_format:"%Y"};return false;">{'today'|@translate}</a>
      </p>
    </div>
  </div>
</fieldset>

<fieldset>
  <legend>{'Search Options'|@translate}</legend>
  <div class="control-group">
    <label>{'Search in albums'|@translate}</label>
    <div class="controls">
      <select class="categoryList" name="cat[]" multiple="multiple" >
      {html_options options=$category_options selected=$category_options_selected}
      </select>
    </div>
  </div>

  <div class="control-group">
    <label>{'Search in sub-albums'|@translate}</label>
    <div class="controls">
      <label class="radio inline"><input type="radio" name="subcats-included" value="1" checked="checked">{'Yes'|@translate}</label>
      <label class="radio inline"><input type="radio" name="subcats-included" value="0">{'No'|@translate}</label>
    </div>
  </div>
</fieldset>

<input class="btn btn-primary" type="submit" name="submit" value="{'Submit'|@translate}">
<input class="btn" type="reset" value="{'Reset'|@translate}">
</form>
