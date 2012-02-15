<header class="titrePage">
  <h2>{'Password forgotten'|@translate}</h2>
</header>

<div class="subcontent">
  {if $action eq 'lost'}

  <div class="message">{'Please enter your username or email address.'|@translate}
   {'You will receive a link to create a new password via email.'|@translate}</div>

  <form action="{$form_action}?action={$action}{if isset($key)}&amp;key={$key}{/if}" method="post">
    <label>{'Username or email'|@translate}
    <input type="text" id="username_or_email" name="username_or_email" {if isset($username_or_email)} value="{$username_or_email}"{/if}></label>
    <input type="hidden" name="pwg_token" value="{$PWG_TOKEN}">
    <input type="submit" name="submit" value="{'Change my password'|@translate}" class="btn">
  </form>

  {elseif $action eq 'reset'}

  <div class="message">{'Hello'|@translate} <em>{$username}</em>.
   {'Enter your new password below.'|@translate}</div>

  <form action="{$form_action}?action={$action}{if isset($key)}&amp;key={$key}{/if}" method="post">
    <label>{'New password'|@translate}
    <input type="password" name="use_new_pwd" value=""></label>
    <label>{'Confirm Password'|@translate}
    <input type="password" name="passwordConf" value=""></label>
    <input type="hidden" name="pwg_token" value="{$PWG_TOKEN}">
    <input type="submit" name="submit" value="{'Submit'|@translate}">
  </form>

  {/if}
</div>
