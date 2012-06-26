{if !empty($thumbnails)}
{define_derivative name='derivative_params' width=260 height=180 crop=true}
<ul class="thumbnails">
  {foreach from=$thumbnails item=thumbnail}
  {assign var=derivative value=$pwg->derivative($derivative_params, $thumbnail.src_image)}
  <li class="span3">
    <a href="{$thumbnail.URL}" class="thumbnail">
      <img src="{$derivative->get_url()}" alt="{$thumbnail.TN_ALT}" data-original-title="{$thumbnail.TN_TITLE}" />
    </a>
  </li>
  {/foreach}
</ul>
{/if}
