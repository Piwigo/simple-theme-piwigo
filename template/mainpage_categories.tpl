{define_derivative name='derivative_params' width=260 height=180 crop=true}

<ul class="thumbnails">
{foreach from=$category_thumbnails item=cat name=cat_loop}
  <li class="span3">
  <figure class="thumbnail">
    <a href="{$cat.URL}" data-original-title="{$cat.CAPTION_NB_IMAGES}">
      <img src="{$pwg->derivative_url($derivative_params, $cat.representative.src_image)}" alt="{$cat.TN_ALT}" /></a>
    <figcaption class="caption">
      <h3>
        <a href="{$cat.URL}">{$cat.NAME}</a>
        {if !empty($cat.icon_ts)}
        <i class="icon-exclamation-sign icon-white"></i>
        {/if}
      </h3>
      {if isset($cat.INFO_DATES) }
      <p class="dates">{$cat.INFO_DATES}</p>
      {/if}
{*
      {if not empty($cat.DESCRIPTION)}
      <p class="thumbCatDesc">{$cat.DESCRIPTION}</p>
      {/if}
*}
    </figcaption>
  </figure>
  </li>
{/foreach}
</ul>
