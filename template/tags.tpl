<header class="titrePage">
  <ul class="categoryActions">
  {if $display_mode == 'letters'}
    <li><a href="{$U_CLOUD}">{'show tag cloud'|@translate}</a></li>
  {/if}
  {if $display_mode == 'cloud'}
    <li><a href="{$U_LETTERS}">{'group by letters'|@translate}</a></li>
  {/if}
  </ul>
  <h2>{'Tags'|@translate}</h2>
</header>

{if isset($tags)}
  {if $display_mode == 'cloud'}
  <div id="fullTagCloud" class="subcontent">
    {foreach from=$tags item=tag}
    <span><a href="{$tag.URL}" class="tagLevel{$tag.level}" title="{$pwg->l10n_dec('%d photo', '%d photos', $tag.counter)}">{$tag.name}</a></span>
    {/foreach}
  </div>
  {/if}

  {if $display_mode == 'letters'}
  <div class="subcontent">
    {foreach from=$letters item=letter}
    <div class="tagLetter">
      <h3>{$letter.TITLE}</h3>
      {foreach from=$letter.tags item=tag}
      <div>
        <a href="{$tag.URL}">{$tag.name}</a>
        <span class="nbEntries">{$pwg->l10n_dec('%d photo', '%d photos', $tag.counter)}</span>
      </div>
      {/foreach}
    </div>
    {/foreach}
  </div>
  {/if}
{/if}
