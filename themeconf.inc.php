<?php
/*
Theme Name: Simple Grey
Version: 2.5.3
Description: Simple Grey
Theme URI: http://piwigo.org/ext/extension_view.php?eid=308
Author: Saïmon
Author URI: http://saimon.org/
*/

$themeconf = array(
  'parent' => 'default',
  'load_parent_css' => false,
  'load_parent_local_head' => false,
  'name' => 'simple-grey',
  'theme_dir' => 'simple',
  'icon_dir' => 'themes/simple/icon',
  'admin_icon_dir' => 'themes/default/icon/admin',
  'mime_icon_dir' => 'themes/default/icon/mimetypes/',
  'local_head' => 'local_head.tpl',
  'url' => 'http://saimon.org/log/theme-simple-grey-pour-piwigo.html'
);

// set this if you want to restrict the width of pictures to a specifc width
// global $user;
// $user['maxwidth'] = 800;

load_language('theme.lang', PHPWG_THEMES_PATH.'simple/');

// debug - do not combine files
// $conf['template_combine_files'] = false;

if (!isset($conf['simple']))
{
  $conf['simple'] = serialize(array('albumDisplay' => 'column'));
}
$conf['simple'] = unserialize($conf['simple']);

add_event_handler('loc_begin_page_header', 'simple_set_config');
function simple_set_config()
{
  global $template, $conf;
  
  $template->assign('simple_conf', $conf['simple']);
}

?>
