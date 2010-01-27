<div class="titrePage">
  <ul class="categoryActions">
    <li><a href="{$U_HOME}" title="{'return to homepage'|@translate}">{'home'|@translate}</a></li>
  </ul>
  <h2>{'Profile'|@translate}</h2>
</div>
<div id="content">
  {if isset($errors) and count($errors)}
  <div class="errors">
    <ul>
      {foreach from=$errors item=error}
      <li>{$error}</li>
      {/foreach}
    </ul>
  </div>
  {/if}
  <form method="post" name="profile" action="{$F_ACTION}" id="profile" class="properties">
    <fieldset>
      <legend>{'Registration'|@translate}</legend>
      <input type="hidden" name="redirect" value="{$REDIRECT}" />
      <ul>
        <li>
          <div class="property">{'Username'|@translate}</div>
          {$USERNAME}
        </li>
	{if not $SPECIAL_USER} {* can modify password + email*}
        <li>
          <div class="property">
            <label for="mail_address">{'Email address'|@translate}</label>
          </div>
          <input type="text" name="mail_address" id="mail_address" value="{$EMAIL}" size=35>
        </li>
	{if not $IN_ADMIN} {* admins do not need old password*}
        <li>
          <div class="property">
            <label for="password">{'Password'|@translate}</label>
          </div>
          <input type="password" name="password" id="password" value="">
        </li>
	{/if}
        <li>
          <div class="property">
            <label for="use_new_pwd">{'new_password'|@translate}</label>
          </div>
          <input type="password" name="use_new_pwd" id="use_new_pwd" value="">
        </li>
        <li>
          <div class="property">
            <label for="passwordConf">{'Confirm Password'|@translate}</label>
          </div>
          <input type="password" name="passwordConf" id="passwordConf" value="">
        </li>
      </ul>
      {/if}
    </fieldset>
    <fieldset>
      <legend>{'preferences'|@translate}</legend>
      <ul>
        <li>
          <div class="property">
            <label for="nb_image_line">{'nb_image_per_row'|@translate}</label>
          </div>
          <input type="text" size="3" maxlength="2" name="nb_image_line" id="nb_image_line" value="{$NB_IMAGE_LINE}">
        </li>
        <li>
          <div class="property">
            <label for="nb_line_page">{'nb_row_per_page'|@translate}</label>
          </div>
          <input type="text" size="3" maxlength="2" name="nb_line_page" id="nb_line_page" value="{$NB_ROW_PAGE}" >
        </li>
        <li>
          <div class="property">
            <label>{'theme'|@translate}</label>
          </div>
          {html_options name=template options=$template_options selected=$template_selection}
        </li>
        <li>
          <div class="property">
            <label>{'language'|@translate}</label>
          </div>
          {html_options name=language options=$language_options selected=$language_selection}
        </li>
        <li>
          <div class="property">
            <label for="recent_period">{'recent_period'|@translate}</label>
          </div>
          <input type="text" size="3" maxlength="2" name="recent_period" id="recent_period" value="{$RECENT_PERIOD}">
        </li>
        <li>
          <div class="property">{'auto_expand'|@translate}</div>
          {html_radios name='expand' options=$radio_options selected=$EXPAND}
        </li>
        <li>
          <div class="property">{'show_nb_comments'|@translate}</div>
          {html_radios name='show_nb_comments' options=$radio_options selected=$NB_COMMENTS}
        </li>
        <li>
          <div class="property">{'show_nb_hits'|@translate}</div>
          {html_radios name='show_nb_hits' options=$radio_options selected=$NB_HITS}
        </li>
        <li>
          <div class="property">
            <label for="maxwidth">{'maxwidth'|@translate}</label>
          </div>
          <input type="text" size="4" maxlength="4" name="maxwidth" id="maxwidth" value="{$MAXWIDTH}">
        </li>
        <li>
          <div class="property">
            <label for="maxheight">{'maxheight'|@translate}</label>
          </div>
          <input type="text" size="4" maxlength="4" name="maxheight" id="maxheight" value="{$MAXHEIGHT}">
        </li>
      </ul>
    </fieldset>
    <p class="bottomButtons">
      <input class="submit" type="submit" name="validate" value="{'Submit'|@translate}">
      <input class="submit" type="reset" name="reset" value="{'Reset'|@translate}">
    </p>
  </form>
</div> <!-- content -->
