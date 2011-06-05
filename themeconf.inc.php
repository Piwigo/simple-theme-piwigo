<?php
/*
Theme Name: Simple Grey
Version: 2.4.3
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

global $user;
$user['maxwidth'] = 720;

load_language('theme.lang', PHPWG_THEMES_PATH.'simple/');

// debug - do not combine files
// $conf['template_combine_files'] = false;

?>
