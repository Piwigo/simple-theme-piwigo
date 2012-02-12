{if !empty($blocks)}

<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      {* <a class="brand" href="{$U_HOME}">{$PAGE_BANNER}</a> *}

      <div class="nav-collapse">
        <ul class="nav">
          {foreach from=$blocks key=id item=block}
          <li id="{$id}" class="dropdown">
            {if not empty($block->template)}
            {include file=$block->template|@get_extent:$id }
            {else}
            {$block->raw_content}
            {/if}
          </li>
          {/foreach}
        </ul>

        {*if isset($block->data.qsearch) and  $block->data.qsearch==true*}
        <form action="{$ROOT_URL}qsearch.php" method="get" class="navbar-search pull-right">
          <input class="search-query" type="text" name="q" placeholder="{'Search'|@translate}">
        </form>
        {*/if*}
      </div>
    </div>
  </div>
</div>
{/if}
