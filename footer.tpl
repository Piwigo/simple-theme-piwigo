  <div id="copyright">
    {if isset($debug.TIME) }
    {'generation_time'|@translate} {$debug.TIME} ({$debug.NB_QUERIES} {'sql_queries_in'|@translate} {$debug.SQL_TIME}) -
    {/if}
    {'powered_by'|@translate} <a href="http://piwigo.org/">Piwigo</a> - <a href="{$themeconf.url}">{$themeconf.template} {$themeconf.theme}</a>
  </div> <!-- copyright -->
  {if isset($footer_elements)}
  {foreach from=$footer_elements item=v}{$v}{/foreach}
  {/if}
</div> <!-- the_page -->
<script type="text/javascript" src="{$ROOT_URL}template-common/scripts.js"></script>
<script type="text/javascript" src="{$ROOT_URL}template/{$themeconf.template}/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="{$ROOT_URL}template/{$themeconf.template}/js/scripts.js"></script>
{if isset($debug.QUERIES_LIST)}{$debug.QUERIES_LIST}{/if}
</body>
</html>
