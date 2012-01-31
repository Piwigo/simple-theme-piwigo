{if isset($high)}
<a href="javascript:phpWGOpenWindow('{$high.U_HIGH}','{$high.UUID}','scrollbars=yes,toolbar=no,status=no,resizable=yes')">
{/if}

<img src="{$SRC_IMG}" style="width:{$WIDTH_IMG}px;" alt="{$ALT_IMG}"
     {if isset($high)}title="{'Click on the photo to see it in high definition'|@translate}"{/if}>

{if isset($high)}
</a>
{/if}
