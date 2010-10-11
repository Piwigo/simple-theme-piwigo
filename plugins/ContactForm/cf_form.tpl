<!-- {known_script id="jquery" src=$ROOT_URL|@cat:"template-common/lib/jquery.packed.js"} -->
{known_script id="jquery.ui" src=$ROOT_URL|@cat:"template-common/lib/ui/ui.core.packed.js"}
{known_script id="jquery.ui.resizable" src=$ROOT_URL|@cat:"template-common/lib/ui/ui.resizable.packed.js"}
{literal}
<script type="text/javascript">
jQuery().ready(function(){
    // Resize possible for textarea
    jQuery("#cf_message").resizable({
        handles: "all",
        animate: true,
        animateDuration: "slow",
        animateEasing: "swing",
        preventDefault: true,
        preserveCursor: true,
        autoHide: true,
        ghost: true
      });
  });
jQuery().ready(function(){
  // Resize possible for textarea
  jQuery(".cf-input").resizable({
        handles: "e",
        animate: true,
        animateDuration: "slow",
        animateEasing: "swing",
        preventDefault: true,
        preserveCursor: true,
        autoHide: true,
        ghost: true
      });
  });

function cf_validate() {
  var items = new Array('cf_from_name','cf_from_mail','cf_subject','cf_message');
  var is_mail = new Array(false,true,false,false);
  var is_needed = new Array(
    {/literal}{if $CF.NEED_NAME}true{else}false{/if}{literal},
    {/literal}{if $CF.NEED_MAIL}true{else}false{/if}{literal},
    true,true);
  var messages = new Array(
    '{/literal}{'cf_from_name_error'|@translate|@escape:javascript}{literal}',
    '{/literal}{'cf_mail_format_error'|@translate|@escape:javascript}{literal}',
    '{/literal}{'cf_subject_error'|@translate|@escape:javascript}{literal}',
    '{/literal}{'cf_message_error'|@translate|@escape:javascript}{literal}');
  var i;
  for (i=0 ; i<items.length ; i++) {
    var item = document.getElementById(items[i]);
    var is_ok = cf_check_content(item, is_mail[i]);
    if (!is_ok && is_needed[i]) {
      alert(messages[i]);
      item.focus();
      return false;
    }
  }
  return true;
}
</script>
{/literal}
<div id="subcontent" class="contact-form">
  <form  method="post" action="{$CF.F_ACTION}" class="filter" id="contactform" onsubmit="return cf_validate();">
  <div class="contact-form-content">
    <table>
      <tr>
        <td class="contact-form-left">{'cf_from_name'|@translate}</td>
        <td class="contact-form-right">
        {if $CF.LOGGED}
          <input type="text" name="cf_from_name_label" id="cf_from_name" size="40" value="{$CF.NAME}" disabled="disabled" class="cf-input-disabled">
          <input type="hidden" name="cf_from_name" value="{$CF.NAME}" />
        {else}
          <input type="text" name="cf_from_name" id="cf_from_name" size="40" value="{$CF.NAME}" class="cf-input">
        {/if}
        </td>
      </tr>
      <tr>
        <td class="contact-form-left">{'cf_from_mail'|@translate}</td>
        <td class="contact-form-right">
        {if $CF.LOGGED and ''!=$CF.EMAIL}
          <input type="text" name="cf_from_mail_label" id="cf_from_mail" size="40" value="{$CF.EMAIL}" disabled="disabled" class="cf-input-disabled">
          <input type="hidden" name="cf_from_mail" value="{$CF.EMAIL}" />
        {else}
          <input type="text" name="cf_from_mail" id="cf_from_mail" size="40" value="{$CF.EMAIL}" class="cf-input"></td>
        {/if}
        </td>
      </tr>
      <tr>
        <td class="contact-form-left">{'cf_subject'|@translate}</td>
        <td class="contact-form-right"><input type="text" name="cf_subject" id="cf_subject" size="40" value="{$CF.SUBJECT}" class="cf-input"></td>
      </tr>
      <tr>
        <td class="contact-form-left" id="cf_message_label">{'cf_message'|@translate}</td>
        <td class="contact-form-right"><textarea name="cf_message" id="cf_message" rows="10" cols="40">{$CF.MESSAGE}</textarea></td>
      </tr>
      <tr>
        <td class="contact-form-left">&nbsp;</td>
        <td class="contact-form-right"><input class="submit" type="submit" value="{'cf_submit'|@translate}"></td>
      </tr>
    </table>
    <input type="hidden" name="cf_key" value="{$CF.KEY}" />
    <input type="hidden" name="cf_id" value="{$CF.ID}" />
  </div>
  </form>
</div>