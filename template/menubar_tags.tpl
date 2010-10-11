<h3>{'Related tags'|@translate}</h3>
<ul id="menuTagCloud">
  {foreach from=$block->data item=tag}
  <li>
    <a class="tagLevel{$tag.level}"
       {if isset($tag.U_ADD)}
         href="{$tag.U_ADD}"
         title="{$pwg->l10n_dec('%d image is also linked to current tags', '%d images are also linked to current tags', $tag.counter)}"
         rel="nofollow">+
       {else}
         href="{$tag.URL}"
         title="{'See elements linked to this tag only'|@translate}">
       {/if}
       {$tag.name}</a>
  </li>
  {/foreach}
</ul>
