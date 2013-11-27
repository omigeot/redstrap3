<?php

function theme_content(&$a) {
	if(!local_user()) { return;}

	$arr = array();

	$arr['schema'] = get_pconfig(local_user(),'redstrap3', 'schema' );
	$arr['inverse_nav'] = get_pconfig(local_user(),'redstrap3', 'inverse_nav' );
	return redstrap3_form($a, $arr);
}

function theme_post(&$a) {
	if(!local_user()) { return;}

	if (isset($_POST['redstrap3-settings-submit'])) {
		set_pconfig(local_user(), 'redstrap3', 'schema', $_POST['redstrap3_schema']);
		set_pconfig(local_user(), 'redstrap3', 'inverse_nav', $_POST['redstrap3_inverse_nav']);
	}
}



function redstrap3_form(&$a, $arr) {


	$scheme_choices = array();
	$scheme_choices['view/theme/redstrap3/css/bootstrap.css'] = t("Default");
	$files = glob('view/theme/redstrap3/css/bootstrap/*.css');
	if($files) {
		foreach($files as $file) {
			$f = basename($file, ".css");
			$scheme_name = ucfirst($f);
			$scheme_choices["view/theme/redstrap3/css/bootstrap/".$f.".css"] = $scheme_name;
		}
	}
		
		
		$inverse_nav = array (
		  '' => t('Scheme Default'),
		  'red' => t('red'),
		  'black' => t('black'),	
		  'silver' => t('silver'),	
		);

if(feature_enabled(local_user(),'expert')) 
				$expert = 1;
					
	  $t = get_markup_template('theme_settings.tpl');
	  $o .= replace_macros($t, array(
		'$submit' => t('Submit'),
		'$baseurl' => $a->get_baseurl(),
		'$expert' => $expert,
		'$title' => t("Theme settings"),
		'$schema' => array('redstrap3_schema', t('Set scheme'), $arr['schema'], '', $scheme_choices),
		'$inverse_nav' => array('redstrap3_inverse_nav', t('Navigation bar colour'), $arr['inverse_nav'], '', $inverse_nav),
		));

	return $o;
}
