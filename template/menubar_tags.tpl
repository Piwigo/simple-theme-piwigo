<a class="dropdown-toggle" data-toggle="dropdown" href="#">{'Related tags'|@translate}</a>
<ul class="dropdown-menu" id="menuTagCloud">
  {foreach from=$block->data item=tag}
  <li>
    <a class="tagLevel {if isset($tag.level)}{$tag.level}{/if}"
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
