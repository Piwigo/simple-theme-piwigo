<?php
load_language('theme.lang', PHPWG_THEMES_PATH.'simple/');

global $conf;
if (!isset($conf['stripped']))
{
  $conf['simple'] = serialize(array('albumDisplay' => 'column'));
}

$simple_conf = array();

if (isset($_POST['submit']))
{
  $simple_conf['albumDisplay'] = $_POST['albumDisplay'];
  
  conf_update_param('simple', pwg_db_real_escape_string(serialize($simple_conf)));

  array_push($page['infos'], l10n('Your configuration settings are saved'));

  load_conf_from_db();
}

$template->set_filenames(
  array(
    'theme_admin_content' => dirname(__FILE__) . '/admin.tpl')
  );

$template->assign('options', unserialize($conf['simple']));

$template->assign_var_from_handle('ADMIN_CONTENT', 'theme_admin_content');
?>