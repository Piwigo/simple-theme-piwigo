<ul class="thumbnailCategories">
  {foreach from=$category_thumbnails item=cat}
  <li>
    <div class="illustration">
      <a href="{$cat.URL}">
        <img src="{$cat.TN_SRC}" alt="{$cat.TN_ALT}" title="{'shows images at the root of this category'|@translate}">
      </a>
    </div>
    <div class="description">
      <h3>
		<a href="{$cat.URL}">{$cat.NAME}</a>
		{$cat.ICON_TS}
	  </h3>
      {if isset($cat.INFO_DATES) }
      <p class="thumbCatDescNfoDate">{$cat.INFO_DATES}</p>
      {/if}

      <p class="thumbCatDescNbImg">{$cat.CAPTION_NB_IMAGES}</p>
      {if not empty($cat.DESCRIPTION)}
      <p class="thumbCatDesc">{$cat.DESCRIPTION}</p>
      {/if}
    </div>
  </li>
  {/foreach}
</ul>
