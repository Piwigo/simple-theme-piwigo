<header class="titrePage">
  <h2>{'Upload a picture'|@translate}</h2>
</header>

{if not $UPLOAD_SUCCESSFUL }
<form enctype="multipart/form-data" method="post" action="{$F_ACTION}">
  <fieldset>
    <legend>{$ADVISE_TITLE}</legend>
    {if not empty($advises)}
    <ul>
      {foreach from=$advises item=advise}
      <li>{$advise}</li>
      {/foreach}
    </ul>
    {/if}
    <ul>
      <li>
        <div class="property">&nbsp;</div><input name="picture" type="file" value="" />
      </li>
      {if isset($SHOW_FORM_FIELDS) and $SHOW_FORM_FIELDS}
      <!-- category -->
      <li>
        <div class="property">{'Album'|@translate}</div>
        {html_options name="category" options=$categories selected=$categories_selected}
      </li>
      <!-- username -->
      <li>
        <div class="property">{'Username'|@translate}</div>
        <input name="username" type="text" value="{$NAME}" />&nbsp;<span class="mandatorystar">*</span>
      </li>
      <!-- mail address -->
      <li>
        <div class="property">{'E-mail address'|@translate}</div>
        <input name="mail_address" type="text" value="{$EMAIL}" size="35"/>&nbsp;<span class="mandatorystar">*</span>
      </li>
      <!-- name of the picture -->
      <li>
        <div class="property">{'Name of the picture'|@translate}</div>
        <input name="name" type="text" value="{$NAME_IMG}" size="35"/>
      </li>
      <!-- author -->
      <li>
        <div class="property">{'Author'|@translate}</div>
        <input name="author" type="text" value="{$AUTHOR_IMG}" size="35"/>
      </li>
      <!-- date of creation -->
      <li>
        <div class="property">{'Creation date'|@translate} (DD/MM/YYYY)</div>
        <input name="date_creation" type="text" value="{$DATE_IMG}" />
      </li>
      <!-- comment -->
      <li>
        <div class="property">{'Comment'|@translate}</div>
        <textarea name="comment" rows="6" cols="60" style="overflow:auto">{$COMMENT_IMG}</textarea>
      </li>
      {/if}
    </ul>
  </fieldset>
  <p class="bottomButtons">
    <input class="submit" name="submit" type="submit" value="{'Submit'|@translate}" />
  </p>
</form>
{else}
{'Picture uploaded with success, an administrator will validate it as soon as possible'|@translate}<br />
<div style="text-align:center;">
  <a href="{$U_RETURN}">[ {'Home'|@translate} ]</a>
</div>
{/if}
{if isset($SHOW_FORM_FIELDS) and $SHOW_FORM_FIELDS}
<p><span class="mandatorystar">*</span> : {'obligatory'|@translate}</p>
{/if}
