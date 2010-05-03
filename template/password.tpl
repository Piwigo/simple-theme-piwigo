<div class="titrePage">
  <ul class="categoryActions">
    <li><a class="button" href="{$U_HOME}" title="{'Go through the gallery as a visitor'|@translate}">{'Home'|@translate}</a></li>
  </ul>
  <h2>{'Password forgotten'|@translate}</h2>
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
  {if count($infos) and count($infos)}
  <div class="infos">
    <ul>
      {foreach from=$infos item=info}
      <li>{$info}</li>
      {/foreach}
    </ul>
  </div>
  {/if}
  <form action="{$F_ACTION}" method="post" class="properties">
    <fieldset>
      <legend>{'Retrieve password'|@translate}</legend>
      <ul>
        <li>
          <div class="property">
            <label for="mail_address">{'Email address'|@translate}</label>
          </div>
          <input class="login" type="text" name="mail_address" id="mail_address" size="35" maxlength="40" >
        </li>
        <li>
          <div class="property">
            <label for="no_mail_address">{'No email address'|@translate}</label>
          </div>
          <input type="checkbox" id="no_mail_address" name="no_mail_address" value="1">
        </li>
      </ul>
    </fieldset>
    <p><input class="submit" type="submit" name="submit" value="{'Send new password'|@translate}"></p>
  </form>
</div> <!-- content -->
