<h3><a href="{$block->data.U_CATEGORIES}">{'Categories'|@translate}</a></h3>
{$block->data.MENU_CATEGORIES_CONTENT}
<p class="totalImages">{$pwg->l10n_dec('%d element', '%d elements', $block->data.NB_PICTURE)}</p>
{if isset($block->data.U_UPLOAD)}
<p><a href="{$block->data.U_UPLOAD}">+ {'upload_picture'|@translate}</a></p>
{/if}
