<?php
  // This needs changing now, if we're going for global settings.  Admin settings have been removed in preparation, You *should* just be able to remove all 
  // the get_config bits, though this is untested.  
  // We also need to eventually.  Use the page owners settings for everybody - get_pconfig(page_owner()) or whatever that would look like.


	$uid = get_theme_uid();

	if($uid)
	    load_pconfig($uid,'redstrap3');

    $line_height = false;
    $redstrap3_font_size = false;
    $resolution = false;
    $colour = false;
    $shadows = false;
    $navcolour = false;
    $nav_bg_1 = "f88";
    $nav_bg_2 = "b00";
	$nav_bg_3 = "f00";
	$nav_bg_4 = "b00";
    $displaystyle = false;
    $linkcolour = false;
    $shiny = false;
	$radius = 5;
    $site_line_height = get_config("redstrap3","line_height");
    $site_redstrap3_font_size = get_config("redstrap3", "font_size" );
    $site_colour = get_config("redstrap3", "colour" );
    $shadows = get_config("redstrap3", "shadow" );
    $navcolour = get_config("redstrap3", "navcolour" );
    $displaystyle = get_config("redstrap3", "displaystyle" );
    $linkcolour = get_config("redstrap3", "linkcolour" );
    $shiny = get_config("redstrap3", "shiny" );

	$x = get_config('redstrap3','radius');
	if($x !== false)
		$radius = $x;
    
    if ($uid) {
        $line_height = get_pconfig($uid, "redstrap3","line_height");
        $redstrap3_font_size = get_pconfig($uid, "redstrap3", "font_size");
        $colour = get_pconfig($uid, "redstrap3", "colour");
        $shadows = get_pconfig($uid, "redstrap3", "shadow");
        $navcolour = get_pconfig($uid, "redstrap3", "navcolour");
        $displaystyle = get_pconfig($uid, "redstrap3", "displaystyle");
        $linkcolour = get_pconfig($uid, "redstrap3", "linkcolour");
        $shiny = get_pconfig($uid, "redstrap3", "shiny");
		$x = get_pconfig($uid,'redstrap3','radius');
		if($x !== false)
			$radius = $x;

        if (! feature_enabled($uid,'expert')) {$colour_scheme = get_pconfig($uid, "redstrap3", "colour_scheme");}
    }

    // In non-expert mode, we just let them choose font size, line height, and a colour scheme.  A colour scheme is just a pre-defined set of the above variables.
    // But only apply these settings in non-expert mode to prevent confusion when turning expert mode on and off.
    if(! feature_enabled($uid,'expert')) {
	    if ($colour_scheme === 'fancyred') {$shadows = true; $navcolour = 'black'; $displaystyle = 'fancy'; $linkcolour = 'f00'; $shiny = "opaque";}
	    // Dark themes are very different - we need to do some of these from scratch, so don't bother setting vars for anything else
	    if ($colour_scheme === 'dark') {$colour = 'dark'; $navcolour = 'black';}
	    if ($colour_scheme === 'redstrap3'){$navcolour = 'red';}
		$shadows = false;
		$radius = 5;
}

// This is probably the easiest place to apply global settings.  Don't bother with site line height and such.  Instead, check pconfig for global user settings.  
// eg, if ($redstrap3_font_size === false) {$redstrap3_font_size = get_pconfig($uid, "global", "font_size");  If it's not set, we'll just use the CSS with no changes.
// Then all you need to do is add a "Global Settings" tab to settings/display, and make an equivalent of theme_settings.tpl and config.php to be loaded there.  Easy.

    if ($line_height === false) {$line_height = $site_line_height;}
    if ($line_height === false) {$line_height = "1.2";}
    if ($redstrap3_font_size === false) {$redstrap3_font_size = $site_redstrap3_font_size;}
    if ($redstrap3_font_size === false) {$redstrap3_font_size = "12";}
    if ($colour === false) {$colour = $site_colour;}
    if ($colour === false) {$colour = "light";}
	    if ($navcolour === "black") {$nav_bg_1 = "000";
			      $nav_bg_2 = "2e2f2e";}

	if(file_exists('view/theme/' . current_theme() . '/css/style.css')) {
		$x = file_get_contents('view/theme/' . current_theme() . '/css/style.css');
		if(get_config('system','pcss_compress')) {
			// this shaves off about 10%, probably not enough to worry about right now.
			logger('pcss compress: original size: ' . strlen($x), LOGGER_DEBUG);
			$x = str_replace(array("\r","\t","  "),array("",' ',' '),$x);
			$x = preg_replace('/(\n[ ]+?)/s',"\n",$x);
			$x = str_replace("\n","",$x);
			logger('pcss compress: final size: ' . strlen($x), LOGGER_DEBUG);
		}
		echo str_replace(array('$radius'),array($radius),$x);
    }
    echo "\r\n";

// use $colour_scheme for idiot mode.
    if($colour === "dark") {if (file_exists('view/theme/' . current_theme() . '/css/dark.css')) {
		  $dark = (file_get_contents('view/theme/' . current_theme() . '/css/dark.css'));
	      echo "$dark";}
	  }




// This takes quite a lot of code, so we'll keep it in a separate file, and echo the lot.  Devs still don't have to worry about - it's just overrides.
// Theme devs can play with it without facing scary PHP.

	if ($displaystyle === "fancy") 
	      {if (file_exists('view/theme/' . current_theme() . '/css/fancy.css')) {
		  $fancy = (file_get_contents('view/theme/' . current_theme() . '/css/fancy.css'));
			echo str_replace(array('$radius'),array($radius),$fancy);
	      }
	  }
    
// Put the # here to force hex colours - if we don't, somebody is going to do something odd, using RGB and we're all going to be confused on the support forums
// until one of us works out what they've done.

	  if ($linkcolour != false) {
		    echo "a, a:visited, a:link, .fakelink, .fakelink:visited, .fakelink:link {color: #$linkcolour;}\r\n";
	}
	
// If you want a shiny that just sets a different colour, add an if $shiny != false and handle it as the linkcolour above.

	if ($shiny === 'opaque') {
		    echo "div.wall-item-content-wrapper.shiny {opacity: 1;}\r\n
			 .wall-item-content-wrapper {opacity: 0.8;}";
	}
