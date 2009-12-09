<h3>{'identification'|@translate}</h3>
<ul>
  {if isset($U_REGISTER)}
  <li><a href="{$U_REGISTER}" title="{'Create a new account'|@translate}" rel="nofollow">{'Register'|@translate}</a></li>
  {/if}
  {if isset($U_LOGIN)}
  <li><a href="{$U_LOGIN}" rel="nofollow">{'Connection'|@translate}</a></li>
  {/if}
  {if isset($U_LOGOUT)}
  <li><a href="{$U_LOGOUT}">{'logout'|@translate}</a></li>
  {/if}
  {if isset($U_PROFILE)}
  <li><a href="{$U_PROFILE}" title="{'hint_customize'|@translate}">{'customize'|@translate}</a></li>
  {/if}
  {if isset($U_ADMIN)}
  <li><a href="{$U_ADMIN}" title="{'hint_admin'|@translate}">{'admin'|@translate}</a></li>
  {/if}
</ul>
