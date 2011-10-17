<div class="titrePage">
  <ul class="categoryActions">
    <li><a href="{$U_HOME}" title="{'Home'|@translate}">{'Home'|@translate}</a></li>
  </ul>
  <h2>{'Notification'|@translate}</h2>
</div>
<div id="content">
{if isset($MENUBAR)}{$MENUBAR}{/if}
  <p>{'The RSS notification feed provides notification on news from this website : new photos, updated categories, new comments. Use a RSS feed reader.'|@translate}</p>
  <ul>
    <li><a href="{$U_FEED_IMAGE_ONLY}">{'Photos only RSS feed'|@translate}</a></li>
    <li><a href="{$U_FEED}">{'Complete RSS feed (photos, comments)'|@translate}</a></li>
  </ul>
  <div style="clear: both;"></div>
</div>
