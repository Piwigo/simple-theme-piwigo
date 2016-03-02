{combine_script id='jquery.selectize' load='footer' path='themes/default/js/plugins/selectize.min.js'}
{combine_css id='jquery.selectize' path="themes/default/js/plugins/selectize.{$themeconf.colorscheme}.css"}

{footer_script}
jQuery(document).ready(function() {
  jQuery("#authors, #tags, #categories").each(function() {
    jQuery(this).selectize({
      plugins: ['remove_button'],
      maxOptions:jQuery(this).find("option").length
    });
  })
});
{/footer_script}

{html_style}
legend {
  border-color:#303030;
}
{/html_style}

<header class="titrePage">
  <h2>{'Search'|@translate}</h2>
</header>

<form class="filter subcontent form-horizontal" method="post" name="search" action="{$F_SEARCH_ACTION}">
<fieldset>
  <legend>{'Search for words'|@translate}</legend>
  <div class="control-group">
    <div class="controls">
      <input type="text" name="search_allwords">
      <label class="radio inline"><input type="radio" name="mode" value="AND" checked="checked">{'Search for all terms'|@translate}</label>
      <label class="radio inline"><input type="radio" name="mode" value="OR">{'Search for any term'|@translate}</label>
    </div>
  </div>
  <div class="control-group">
  <label>{'Apply on properties'|translate}</label>
    
  <div class="controls">
    <label class="checkbox inline"><input type="checkbox" name="fields[]" value="name" checked="checked"> {'Photo title'|translate}</label>
    <label class="checkbox inline"><input type="checkbox" name="fields[]" value="comment" checked="checked"> {'Photo description'|translate}</label>
    <label class="checkbox inline"><input type="checkbox" name="fields[]" value="file" checked="checked"> {'File name'|translate}</label>
{if isset($TAGS)}
    <label class="checkbox inline"><input type="checkbox" name="search_in_tags" value="tags"> {'Tags'|translate}</label>
{/if}
  </div>

  </div>
</fieldset>

{if count($AUTHORS)>=1}
<fieldset>
  <legend>{'Search for Author'|@translate}</legend>
  <div class="controls">
    <select id="authors" placeholder="{'Type in a search term'|translate}" name="authors[]" multiple>
{foreach from=$AUTHORS item=author}
      <option value="{$author.author|strip_tags:false|escape:html}">{$author.author|strip_tags:false} ({$author.counter|translate_dec:'%d photo':'%d photos'})</option>
{/foreach}
    </select>
  </div>
</fieldset>
{/if}

{if isset($TAGS)}
<fieldset>
  <legend>{'Search tags'|@translate}</legend>
  <div class="controls">
  <select id="tags" placeholder="{'Type in a search term'|translate}" name="tags[]" multiple>
{foreach from=$TAGS item=tag}
    <option value="{$tag.id}">{$tag.name} ({$tag.counter|translate_dec:'%d photo':'%d photos'})</option>
{/foreach}
  </select>
  <label class="radio inline"><span><input type="radio" name="tag_mode" value="AND" checked="checked"> {'All tags'|@translate}</span></label>
  <label class="radio inline"><span><input type="radio" name="tag_mode" value="OR"> {'Any tag'|@translate}</span></label>
  </div>
</fieldset>
{/if}

<fieldset>
  <legend>{'Search by date'|@translate}</legend>
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
  <legend>{'Search in albums'|@translate}</legend>
  <div class="controls">
    <select id="categories" name="cat[]" multiple>
      {html_options options=$category_options selected=$category_options_selected}
    </select>
    <label><input type="checkbox" name="subcats-included" value="1" checked="checked"> {'Search in sub-albums'|@translate}</label>
  </div>
</fieldset>

<input class="btn" type="submit" name="submit" value="{'Submit'|@translate}">
</form>
