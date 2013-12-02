<?php

function redstrap3_init(&$a) {
	if($a->config['system']['theme_engine'])
		$a->set_template_engine($a->config['system']['theme_engine']);
	else
		$a->set_template_engine('smarty3');
	head_add_js('jquery.js');
	head_add_js('bootstrap.min.js');
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
	head_add_js('dna.min.js');
	head_add_js('redstrap3.js');
}
