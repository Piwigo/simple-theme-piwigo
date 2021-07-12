<li class="nav-item dropdown">
  <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{$block->get_title()}</a>
  <ul class="dropdown-menu dropdown-menu-right" role="menu">
{foreach from=$block->data item=data}
    <li><a class="dropdown-item" href="{$data.URL}">{$data.LABEL}</a></li>
{/foreach}
  </ul>
</li>
