{assign var='ref_level' value=0}

<a class="dropdown-toggle" data-toggle="dropdown" href="#">{'Albums'|@translate}</a>
<ul class="dropdown-menu">
{foreach from=$block->data.MENU_CATEGORIES item=cat}
    <li {if $cat.SELECTED}class="selected"{/if}>
      <a href="{$cat.URL}" {if $cat.IS_UPPERCAT}rel="up"{/if} title="{$cat.TITLE}">
      {if $cat.count_images > 0}
      <span class="{if $cat.nb_images > 0}menuInfoCat{else}menuInfoCatByChild{/if}" title="{$cat.TITLE}">[{$cat.count_images}]</span>
        {$cat.NAME}
      {/if}
      {if !empty($cat.icon_ts)}
      <img title="{$cat.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent{if $cat.icon_ts.IS_CHILD_DATE}_by_child{/if}.png" class="icon" alt="(!)">
      {/if}
      </a></li>
{/foreach}

<li class="divider"></li>
<li><em>{$pwg->l10n_dec('%d photo', '%d photos', $block->data.NB_PICTURE)}</em></li>
</ul>
