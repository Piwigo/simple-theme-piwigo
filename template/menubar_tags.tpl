<h3>{'Related tags'|@translate}</h3>
<ul id="menuTagCloud">
  {foreach from=$block->data item=tag}
  <li>
    <a class="tagLevel{$tag.level}"
       {if isset($tag.U_ADD)}
         href="{$tag.U_ADD}"
         title="{$pwg->l10n_dec('%d photo is also linked to current tags', '%d photo are also linked to current tags', $tag.counter)}"
         rel="nofollow">+
       {else}
         href="{$tag.URL}"
         title="{'display photos linked to this tag'|@translate}">
       {/if}
       {$tag.name}</a>
  </li>
  {/foreach}
</ul>
