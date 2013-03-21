<ul class="unstyled">
  {foreach from=$comments item=comment name=comment_loop}
  <li class="row">
    {if isset($comment.src_image)}
    <div class="illustration span4">
      <a href="{$comment.U_PICTURE}">
		<img src="{$pwg->derivative_url($derivative_params, $comment.src_image)}" alt="{$comment.ALT}">
	  </a>
    </div>
    {/if}
    <div class="description span6">
      {if isset($comment.U_DELETE) or isset($comment.U_VALIDATE) or isset($comment.U_EDIT) }
      <div class="actions">
	{if isset($comment.U_DELETE)}
	<a href="{$comment.U_DELETE}" title="{'delete this comment'|@translate}" onclick="return confirm('{'Are you sure?'|@translate|@escape:javascript}');"><i class="icon-remove icon-white"></i></a>
	{/if}
        {if isset($comment.U_EDIT) and !isset($comment.IN_EDIT)}
        <a class="editComment" href="{$comment.U_EDIT}#edit_comment" title="{'edit this comment'|@translate}"><i class="icon-edit icon-white"></i></a>
        {/if}
	{if isset($comment.U_VALIDATE)}
	<a href="{$comment.U_VALIDATE}" title="{'validate this comment'|@translate}"><i class="icon-ok icon-white"></i></a>
	{/if}
      </div>
      {/if}

      <span class="author">
        {if $comment.WEBSITE_URL}<a href="{$comment.WEBSITE_URL}">{$comment.AUTHOR}</a>{else}{$comment.AUTHOR}{/if}
      </span>
      {if $comment.EMAIL}- <a href="mailto:{$comment.EMAIL}">{$comment.EMAIL}</a>{/if}
      - <span class="date">{$comment.DATE}</span>

      {if isset($comment.IN_EDIT)}
      <a name="edit_comment"></a>
      <form  method="post" action="{$comment.U_EDIT}" id="editComment">
        <fieldset>
          <legend>{'Edit a comment'|@translate}</legend>
          <textarea name="content" id="contenteditid">{$comment.CONTENT|@escape}</textarea>
          <input type="hidden" name="key" value="{$comment.KEY}">
          <input type="hidden" name="pwg_token" value="{$comment.PWG_TOKEN}">
          <input type="hidden" name="image_id" value="{$comment.IMAGE_ID|@default:$current.id}">
          <br />
          <input type="submit" value="{'Submit'|@translate}">
        </fieldset>
      </form>
      {else}
      <blockquote><div>{$comment.CONTENT}</div></blockquote>
      {/if}
    </div>
  </li>
  {/foreach}
</ul>
