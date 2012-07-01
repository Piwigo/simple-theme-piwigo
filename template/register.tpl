<header class="titrePage">
  <h2>{'Registration'|@translate}</h2>
</header>

<div class="subcontent">
  <p><span class="mandatorystar">*</span> : {'obligatory'|@translate}</p>
  <form method="post" action="{$F_ACTION}" name="register_form">
    <label for="login">{'Username'|@translate}&nbsp;<span class="mandatorystar">*</span></label>
    <input type="text" name="login" id="login" value="{$F_LOGIN}" autofocus required>
    <label for="password">{'Password'|@translate}&nbsp;<span class="mandatorystar">*</span></label>
    <input type="password" name="password" id="password" required>
    <label for="password_conf">{'Confirm Password'|@translate}&nbsp;<span class="mandatorystar">*</span></label>
    <input type="password" name="password_conf" id="password_conf" required>
    <label for="mail_address">{'Email address'|@translate}&nbsp;<span class="mandatorystar">*</span></label>
    <input type="email" name="mail_address" id="mail_address" value="{$F_EMAIL}" required>
    <br />
    <input type="hidden" name="key" value="{$F_KEY}" >
    <input type="submit" name="submit" value="{'Register'|@translate}" class="btn btn-primary">
    <input type="reset" value="{'Reset'|@translate}" class="btn">
  </form>
</div>
