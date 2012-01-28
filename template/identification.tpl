<header class="titrePage">
<h2>{'Identification'|@translate}</h2>
</header>

<form action="{$F_LOGIN_ACTION}" method="post" name="login_form">
    <label for="username">{'Username'|@translate}</label>
    <input class="login" type="text" name="username" id="username" autofocus required >
    <label for="password">{'Password'|@translate}</label>
    <input class="login" type="password" name="password" id="password" required >

    {if $authorize_remembering}
    <label for="remember_me">{'Auto login'|@translate}</label>
    <input type="checkbox" name="remember_me" id="remember_me" value="1">
    {/if}
    <br />
    <input type="hidden" name="redirect" value="{$U_REDIRECT|@urlencode}">
    <input type="submit" name="login" value="{'Submit'|@translate}">
</form>
<p>
{if isset($U_REGISTER)}
<a href="{$U_REGISTER}">{'Register'|@translate}</a> • 
{/if}
<a href="{$U_LOST_PASSWORD}">{'Forgot your password?'|@translate}</a>
</p>
