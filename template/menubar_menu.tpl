<h3>{'Menu'|@translate}</h3>
{*if isset($block->data.qsearch) and  $block->data.qsearch==true*}
<form action="{$ROOT_URL}qsearch.php" method="get" id="quicksearch">
  <input type="text" name="q" id="q" value="{'Quick search'|@translate|@escape:'javascript'}" onfocus="value='';">
</form>
{*/if*}
<ul>
{foreach from=$block->data item=link}
  {if is_array($link)}
  <li><a href="{$link.URL}" title="{$link.TITLE}" {if isset($link.REL)}{$link.REL}{/if}>{$link.NAME}</a></li>
  {/if}
{/foreach}
</ul>
