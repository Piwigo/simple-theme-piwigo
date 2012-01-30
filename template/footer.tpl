  </article>  <!-- content -->

  {if isset($MENUBAR)}{$MENUBAR}{/if}

  <footer id="copyright">
    {if isset($debug.TIME)}
    {'Page generated in'|@translate} {$debug.TIME}
    ({$debug.NB_QUERIES} {'SQL queries in'|@translate} {$debug.SQL_TIME}) -
    {/if}
    {'Powered by'|@translate} <a href="{$PHPWG_URL}">Piwigo</a>
     - <a href="{$themeconf.url}">{$themeconf.name}</a>
    {if isset($CONTACT_MAIL)}
    - {'Contact'|@translate}
    <a href="mailto:{$CONTACT_MAIL}?subject={'A comment on your site'|@translate|@escape:url}">{'Webmaster'|@translate}</a>
    {/if}

    {if isset($footer_elements)}
    {foreach from=$footer_elements item=v}
      {$v}
    {/foreach}
    {/if}
  </footer> <!-- copyright -->
</div> <!-- the_page -->

{get_combined_scripts load='footer'}

{if isset($debug.QUERIES_LIST)}
<div id="debug">
  {$debug.QUERIES_LIST}
</div>
{/if}
</body>
</html>
