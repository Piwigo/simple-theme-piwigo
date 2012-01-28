<header class="titrePage">
  <h2>{'Password forgotten'|@translate}</h2>
</header>

{if $action eq 'lost'}

<div class="message">{'Please enter your username or email address.'|@translate}
 {'You will receive a link to create a new password via email.'|@translate}</div>

<form id="lostPassword" action="{$form_action}?action={$action}{if isset($key)}&amp;key={$key}{/if}" method="post">
  <input type="hidden" name="pwg_token" value="{$PWG_TOKEN}">
  <label>{'Username or email'|@translate}</label>
  <input type="text" id="username_or_email" name="username_or_email" {if isset($username_or_email)} value="{$username_or_email}"{/if}>
  <br />
  <input type="submit" name="submit" value="{'Change my password'|@translate}">
</form>

{elseif $action eq 'reset'}

<div class="message">{'Hello'|@translate} <em>{$username}</em>.
 {'Enter your new password below.'|@translate}</div>

<form id="lostPassword" action="{$form_action}?action={$action}{if isset($key)}&amp;key={$key}{/if}" method="post">
  <input type="hidden" name="pwg_token" value="{$PWG_TOKEN}">
  <label>{'New password'|@translate}</label>
  <input type="password" name="use_new_pwd" id="use_new_pwd" value="">
  <label>{'Confirm Password'|@translate}</label>
  <input type="password" name="passwordConf" id="passwordConf" value="">
  <br />
  <input type="submit" name="submit" value="{'Submit'|@translate}">
</form>

{/if}

