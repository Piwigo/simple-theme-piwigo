{if !empty($thumbnails)}
{define_derivative name='derivative_params' width=250 height=200 crop=true}
<ul>
  {foreach from=$thumbnails item=thumbnail}
  {assign var=derivative value=$pwg->derivative($derivative_params, $thumbnail.src_image)}
  <li>
    <figure>
    <a href="{$thumbnail.URL}">
      <img class="thumbnail" src="{$derivative->get_url()}" alt="{$thumbnail.TN_ALT}" data-original-title="{$thumbnail.TN_TITLE}" />
    </a>
      {*
    {if $SHOW_THUMBNAIL_CAPTION}
    <figcaption>
      {if isset($thumbnail.NAME)}{$thumbnail.NAME}{/if}
  	  {if !empty($thumbnail.icon_ts)}
	  <img title="{$thumbnail.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent.png" class="icon" alt="(!)">
	  {/if}
      {if isset($thumbnail.NB_COMMENTS)}
      <span class="{if 0==$thumbnail.NB_COMMENTS}zero {/if}nb-comments">
        ({$pwg->l10n_dec('%d comment', '%d comments',$thumbnail.NB_COMMENTS)})
      </span>
      {/if}
      {if isset($thumbnail.NB_HITS)}
      <span class="{if 0==$thumbnail.NB_HITS}zero {/if}nb-hits">
        {$pwg->l10n_dec('%d hit', '%d hits',$thumbnail.NB_HITS)}
      </span>
      {/if}
    </figcaption>
    {/if}
      *}
    </figure>
  </li>
  {/foreach}
</ul>
{/if}
