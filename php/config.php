<?php
/**
 * Theme settings
 */

function theme_content(&$a) {
	// Doesn't yet work for anyone other than the channel owner, and stupid mode isn't finished, so return both for now.
	if(!local_user()) { return;	}
	$font_size = get_pconfig(local_user(),'redstrap3', 'font_size' );
	$line_height = get_pconfig(local_user(), 'redstrap3', 'line_height' );
	$colour = get_pconfig(local_user(), 'redstrap3', 'colour' );
	$shadow = get_pconfig(local_user(), 'redstrap3', 'shadow' );
	$navcolour = get_pconfig(local_user(), 'redstrap3', 'navcolour');
	$displaystyle = get_pconfig(local_user(), 'redstrap3', 'displaystyle');
	$linkcolour = get_pconfig(local_user(), 'redstrap3', 'linkcolour');
	$iconset = get_pconfig(local_user(), 'redstrap3', 'iconset');
	$shiny = get_pconfig(local_user(), 'redstrap3', 'shiny');
	$colour_scheme = get_pconfig(local_user(), 'redstrap3', 'colour_scheme');
	$radius = get_pconfig(local_user(),'redstrap3','radius');

	return redstrap3_form($a, $font_size, $line_height, $colour, $shadow, $navcolour, $opaquenav, $displaystyle, $linkcolour, $iconset, $shiny, $colour_scheme,$radius);
}

function theme_post(&$a) {
	if(!local_user()) { return; }

	if (isset($_POST['redstrap3-settings-submit'])) {
		set_pconfig(local_user(), 'redstrap3', 'font_size', $_POST['redstrap3_font_size']);
		set_pconfig(local_user(), 'redstrap3', 'line_height', $_POST['redstrap3_line_height']);
		set_pconfig(local_user(), 'redstrap3', 'colour', $_POST['redstrap3_colour']);	
		set_pconfig(local_user(), 'redstrap3', 'shadow', $_POST['redstrap3_shadow']);	
		set_pconfig(local_user(), 'redstrap3', 'navcolour', $_POST['redstrap3_navcolour']);
		set_pconfig(local_user(), 'redstrap3', 'displaystyle', $_POST['redstrap3_displaystyle']);
		set_pconfig(local_user(), 'redstrap3', 'linkcolour', $_POST['redstrap3_linkcolour']);
		set_pconfig(local_user(), 'redstrap3', 'iconset', $_POST['redstrap3_iconset']);
		set_pconfig(local_user(), 'redstrap3', 'shiny', $_POST['redstrap3_shiny']);
		set_pconfig(local_user(), 'redstrap3', 'colour_scheme', $_POST['redstrap3_colour_scheme']);
		set_pconfig(local_user(), 'redstrap3', 'radius', $_POST['redstrap3_radius']);
	}

}

// We probably don't want these if we're having global settings, but we'll comment out for now, just in case
//function theme_admin(&$a) {	$font_size = get_config('redstrap3', 'font_size' );
//	$line_height = get_config('redstrap3', 'line_height' );
//	$colour = get_config('redstrap3', 'colour' );	
//	$shadow = get_config('redstrap3', 'shadow' );	
//	$navcolour = get_config('redstrap3', 'navcolour' );
//	$opaquenav = get_config('redstrap3', 'opaquenav' );
//	$itemstyle = get_config('redstrap3', 'itemstyle' );
//	$linkcolour = get_config('redstrap3', 'linkcolour' );
//	$iconset = get_config('redstrap3', 'iconset' );
//	$shiny = get_config('redstrap3', 'shiny' );
//	
//	return redstrap3_form($a, $font_size, $line_height, $colour, $shadow, $navcolour, $opaquenav, $itemstyle, $linkcolour, $iconset, $shiny);
//}

//function theme_admin_post(&$a) {
//	if (isset($_POST['redstrap3-settings-submit'])) {
//		set_config('redstrap3', 'font_size', $_POST['redstrap3_font_size']);
//		set_config('redstrap3', 'line_height', $_POST['redstrap3_line_height']);
//		set_config('redstrap3', 'colour', $_POST['redstrap3_colour']);
//		set_config('redstrap3', 'shadow', $_POST['redstrap3_shadow']);
//		set_config('redstrap3', 'navcolour', $_POST['redstrap3_navcolour']);
//		set_config('redstrap3', 'opaquenav', $_POST['redstrap3_opaquenav']);
//		set_config('redstrap3', 'itemstyle', $_POST['redstrap3_itemstyle']);
//		set_config('redstrap3', 'linkcolour', $_POST['redstrap3_linkcolour']);
//		set_config('redstrap3', 'iconset', $_POST['redstrap3_iconset']);
//		set_config('redstrap3', 'shiny', $_POST['redstrap3_shiny']);
//	}
//}

// These aren't all used yet, but they're not bloat - we'll use drop down menus in idiot mode.
function redstrap3_form(&$a, $font_size, $line_height, $colour, $shadow, $navcolour, $opaquenav, $displaystyle, $linkcolour, $iconset, $shiny, $colour_scheme,$radius) {
	$line_heights = array(
		"1.3" => "1.3",
		"---" => "---",
		"1.6" => "1.6",				
		"1.5" => "1.5",		
		"1.4" => "1.4",
		"1.2" => "1.2",
		"1.1" => "1.1",
	);	
	$font_sizes = array(
		'12' => '12',
		'14' => '14',
		"---" => "---",
		"16" => "16",		
		"15" => "15",
		'13.5' => '13.5',
		'13' => '13',		
		'12.5' => '12.5',
		'12' => '12',
	);
	$colours = array(
		'light' => 'light',		
		'dark' => 'dark',						
	);

	$colour_schemes = array(
		'redstrap3' => 'redstrap3',
                'amelia' => 'amelia',
                'cerulean' => 'cerulean',
                'cosmo' => 'cosmo',
                'cyborg' => 'cyborg',
                'flatly' => 'flatly',
                'journal' => 'journal',
                'readable' => 'readable',
                'simplex' => 'simplex',
                'slate' => 'slate',
                'spacelab' => 'spacelab',
                'united' => 'united',
	);
	$shadows = array(
		  'true' => 'Yes',
		  'false' => 'No',
	);

	$navcolours = array (
		  'red' => 'red',
		  'black' => 'black',	
	);
	
	$displaystyles = array (
		    'fancy' => 'fancy',
		    'classic' => 'classic',
	);
	
	$linkcolours = array (
		    'blue' => 'blue',
		    'red' => 'red',
	);
	
	$iconsets = array (
		    'default' => 'default',
	);
	
	$shinys = array (
		    'none' => 'none',
		    'opaque' => 'opaque',
	);
	if(feature_enabled(local_user(),'expert')) {
	  $t = get_markup_template('theme_settings.tpl');
	  $o .= replace_macros($t, array(
		'$submit' => t('Submit'),
		'$baseurl' => $a->get_baseurl(),
		'$title' => t("Theme settings"),
		'$font_size' => array('redstrap3_font_size', t('Set font-size for posts and comments'), $font_size, '', $font_sizes),
		'$line_height' => array('redstrap3_line_height', t('Set line-height for posts and comments'), $line_height, '', $line_heights),
		'$colour' => array('redstrap3_colour', t('Set colour scheme'), $colour, '', $colours),	
		'$shadow' => array('redstrap3_shadow', t('Draw shadows'), $shadow, '', $shadows),
		'$navcolour' => array('redstrap3_navcolour', t('Navigation bar colour'), $navcolour, '', $navcolours),
		'$displaystyle' => array('redstrap3_displaystyle', t('Display style'), $displaystyle, '', $displaystyles),
		'$linkcolour' => array('redstrap3_linkcolour', t('Display colour of links - hex value, do not include the #'), $linkcolour, '', $linkcolours),
		'$iconset' => array('redstrap3_iconset', t('Icons'), $iconset, '', $iconsets),
		'$shiny' => array('redstrap3_shiny', t('Shiny style'), $shiny, '', $shinys),
		'$radius' => array('redstrap3_radius', t('Corner radius'), $radius, t('0-99 default: 5')),
	  ));}
	 
	 if(! feature_enabled(local_user(),'expert')) {
	    $t = get_markup_template('basic_theme_settings.tpl');
	    $o .= replace_macros($t, array(
		'$submit' => t('Submit'),
		'$baseurl' => $a->get_baseurl(),
		'$title' => t("Theme settings"),
		'$font_size' => array('redstrap3_font_size', t('Set font-size for posts and comments'), $font_size, '', $font_sizes),
		'$line_height' => array('redstrap3_line_height', t('Set line-height for posts and comments'), $line_height, '', $line_heights),
		'$colour_scheme' => array('redstrap3_colour_scheme', t('Bootswatch variant'), $colour_scheme, '', $colour_schemes),	
	 ));}
	 
	return $o;
}

