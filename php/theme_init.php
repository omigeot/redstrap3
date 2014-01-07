<?php

head_add_css('library/font_awesome/css/font-awesome.min.css');

require_once('view/php/theme_init.php');
head_remove_css('library/bootstrap/css/bootstrap.min.css');
head_remove_css('library/bootstrap/css/bootstrap-theme.min.css');
head_remove_css('view/css/bootstrap-red.css');
head_remove_js('library/bootstrap/js/bootstrap.min.js');



// Get the UID of the channel owner
$uid =  $a->profile_uid;
if ($uid == 0) {
	$uid = get_theme_uid();
}

if($uid)
	load_pconfig($uid,'redstrap3');
$schema = get_pconfig($uid,'redstrap3','schema');
if (!$schema)
	$schema = 'bootstrap.css';
head_add_css($schema);
head_add_css('style-large.css','screen and (min-width: 1360px)');
head_add_css('style-medium.css','screen and (max-width: 1359px)');



