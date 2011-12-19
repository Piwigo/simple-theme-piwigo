{if !empty($thumbnails)}
<ul>
  {foreach from=$thumbnails item=thumbnail}
  <li>
    <a href="{$thumbnail.URL}">
      <img class="thumbnail" src="{$thumbnail.TN_SRC}" alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" />
    </a>
    {if $SHOW_THUMBNAIL_CAPTION }
    <p>
      {if isset($thumbnail.NAME)}{$thumbnail.NAME}{/if}
  	  {if !empty($thumbnail.icon_ts)}
	  <img title="{$thumbnail.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent.png" class="icon" alt="(!)">
	  {/if}
      {if isset($thumbnail.NB_COMMENTS)}
      <span class="{if 0==$thumbnail.NB_COMMENTS}zero {/if}nb-comments">
        {$pwg->l10n_dec('%d comment', '%d comments',$thumbnail.NB_COMMENTS)}
      </span>
      {/if}
      {if isset($thumbnail.NB_HITS)}
      <span class="{if 0==$thumbnail.NB_HITS}zero {/if}nb-hits">
        {$pwg->l10n_dec('%d hit', '%d hits',$thumbnail.NB_HITS)}
      </span>
      {/if}
    </p>
    {/if}
  </li>
  {/foreach}
</ul>
{/if}
