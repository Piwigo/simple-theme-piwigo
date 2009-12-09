<div id="titrePage">
  <ul class="categoryActions">
    <li><a href="{$U_HOME}" title="{'return to homepage'|@translate}">{'home'|@translate}</a></li>
  </ul>
  <h2>{'Registration'|@translate}</h2>
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
  <form method="post" action="{$F_ACTION}" class="properties" name="register_form">
    <fieldset>
      <legend>{'Enter your personnal informations'|@translate}</legend>
      <ul>
        <li>
          <div class="property">
            <label for="login">{'Username'|@translate}</label>
          </div>
          <input type="text" name="login" id="login" value="{$F_LOGIN}" >&nbsp;<span class="mandatorystar">*</span>
        </li>
        <li>
          <div class="property">
            <label for="password">{'Password'|@translate}</label>
          </div>
          <input type="password" name="password" id="password" >&nbsp;<span class="mandatorystar">*</span>
        </li>
        <li>
          <div class="property">
            <label for="password_conf">{'Confirm Password'|@translate}</label>
          </div>
          <input type="password" name="password_conf" id="password_conf" >&nbsp;<span class="mandatorystar">*</span>
        </li>
        <li>
          <div class="property">
            <label for="mail_address">{'Mail address'|@translate}</label>
          </div>
          <input type="text" name="mail_address" id="mail_address" value="{$F_EMAIL}" size=35>
          ({'useful when password forgotten'|@translate})
        </li>
      </ul>
    </fieldset>
    <p class="bottomButtons">
      <input class="submit" type="submit" name="submit" value="{'Register'|@translate}">
      <input class="submit" type="reset" value="{'Reset'|@translate}">
    </p>
  </form>
  <p><span class="mandatorystar">*</span> : {'mandatory'|@translate}</p>
  <script type="text/javascript">
    <!--
       document.register_form.login.focus();
       //-->
  </script>
</div> <!-- content -->
