<ul>
  {foreach from=$comments item=comment}
  <li>
    {if isset($comment.TN_SRC)}
    <div class="illustration">
      <a href="{$comment.U_PICTURE}"><img src="{$comment.TN_SRC}" alt="{$comment.ALT}" /></a>
    </div>
    {/if}
    <div class="description">
      {if isset($comment.U_DELETE) or isset($comment.U_VALIDATE) }
      <ul class="actions">
	{if isset($comment.U_DELETE)}
	<li><a href="{$comment.U_DELETE}" title="{'delete this comment'|@translate}">{'delete'|@translate}</a></li>
	{/if}
	{if isset($comment.U_VALIDATE)}
	<li><a href="{$comment.U_VALIDATE}" title="{'validate this comment'|@translate}">{'validate'|@translate}</a></li>
	{/if}
      </ul>
      {/if}
      <span class="author">{$comment.AUTHOR}</span> - <span class="date">{$comment.DATE}</span>
      <blockquote>{$comment.CONTENT}</blockquote>
    </div>
  </li>
  {/foreach}
</ul>
<div style="clear: both;"></div>
