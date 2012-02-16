<?php
/*
Theme Name: Simple3
Version: 3.0-dev
Description: Simple theme for Piwigo
Theme URI: http://piwigo.org/ext/extension_view.php?eid=308
Author: Saïmon
Author URI: http://saimon.org/
*/

$themeconf = array(
  'parent' => 'default',
  'load_parent_css' => false,
  'load_parent_local_head' => false,
  'name' => 'simple3',
  'theme_dir' => 'simple3',
  'icon_dir' => 'themes/simple3/img',
  'admin_icon_dir' => 'themes/default/icon/admin',
  'mime_icon_dir' => 'themes/default/icon/mimetypes/',
  'local_head' => 'local_head.tpl',
  'url' => 'http://saimon.org/simple-theme-piwigo/'
);

// set this if you want to restrict the width of pictures to a specifc width
// global $user;
// $user['maxwidth'] = 800;

load_language('theme.lang', PHPWG_THEMES_PATH.'simple3/');
pwg_set_session_var('show_metadata', true);

$conf['level_separator'] = '&nbsp;»&nbsp;';

// debug - do not combine files
$conf['template_combine_files'] = false;

?>
