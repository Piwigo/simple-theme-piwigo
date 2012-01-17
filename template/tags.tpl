<header class="titrePage">
  <ul class="categoryActions">
  {if $display_mode == 'letters'}
    <li><a href="{$U_CLOUD}" title="{'show tag cloud'|@translate}">{'show tag cloud'|@translate}</a></li>
  {/if}
  {if $display_mode == 'cloud'}
    <li><a href="{$U_LETTERS}" title="{'group by letters'|@translate}">{'group by letters'|@translate}</a></li>
  {/if}
  </ul>
  <h2>{'Tags'|@translate}</h2>
</header>

{if isset($tags)}
  {if $display_mode == 'cloud'}
  <div id="fullTagCloud">
    {foreach from=$tags item=tag}
    <span><a href="{$tag.URL}" class="tagLevel{$tag.level}" title="{$pwg->l10n_dec('%d photo', '%d photos', $tag.counter)}">{$tag.name}</a></span>
    {/foreach}
  </div>
  {/if}
  {if $display_mode == 'letters'}
  <table>
    <tr>
      {foreach from=$letters item=letter}
      <td>
      <fieldset class="tagLetter">
	<legend class="tagLetterLegend">{$letter.TITLE}</legend>
	<table class="tagLetterContent">
	  {foreach from=$letter.tags item=tag}
	  <tr class="tagLine">
	    <td><a href="{$tag.URL}">{$tag.name}</a></td>
	    <td class="nbEntries">{$pwg->l10n_dec('%d photo', '%d photos', $tag.counter)}</td>
	  </tr>
	  {/foreach}
	</table>
      </fieldset>
      </td>
      {/foreach}
    </tr>
  </table>
  {/if}
{/if}
