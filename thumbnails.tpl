{if !empty($thumbnails)}
<ul>
  {foreach from=$thumbnails item=thumbnail}
  <li>
    <a href="{$thumbnail.URL}">
      <img class="thumbnail" src="{$thumbnail.TN_SRC}" alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" />
    </a>
    <p>
      {if !empty($thumbnail.NAME)}{$thumbnail.NAME}{/if}
      {if !empty($thumbnail.ICON_TS)}{$thumbnail.ICON_TS}{/if}
      {if isset($thumbnail.NB_COMMENTS)}
      <span class="{if 0==$thumbnail.NB_COMMENTS}zero {/if}nb-comments">
        {$pwg->l10n_dec('%d comment', '%d comments',$thumbnail.NB_COMMENTS)}
      </span>
      {/if}
{*      {if isset($thumbnail.NB_HITS)}
      <span class="{if 0==$thumbnail.NB_HITS}zero {/if}nb-hits">
        {$pwg->l10n_dec('%d hit', '%d hits',$thumbnail.NB_HITS)}
      </span>
      {/if} *}
    </p>
  </li>
  {/foreach}
</ul>
{/if}
