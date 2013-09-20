<?php

function redstrap3_init(&$a) {
	if($a->config['system']['theme_engine'])
		$a->set_template_engine($a->config['system']['theme_engine']);
	else
		$a->set_template_engine('smarty3');
	head_add_js('jquery.js');
        head_add_js('bootstrap.min.js');
	$uid = get_theme_uid();
        if($uid) {
        	load_pconfig($uid,'redstrap3');
//		var_dump($a->config);		die('');
		$swatch = get_pconfig($uid, "redstrap3", "colour_scheme");
	} else { 
		$swatch  = 'redstrap3';
	}

	head_add_css('bootstrap.'.$swatch.'.css');
}
