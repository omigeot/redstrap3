<header>
	<div id="site-location">{{$sitelocation}}</div>
	<!--<div id="banner">{{$banner}}</div>-->
</header>
<!--
<nav class="navbar navbar-inverse narrownav" role="navigation"> 
        <ul class="navbar-header navbar-nav nav">
        	<li>
	                <a href="#" class="icon-reorder icon-large dropdown-toggle" data-toggle="dropdown" rel="#nav-narrow-menu"></a>
			<div id="nav-narrow-menu" class="dropdown-menu list-group">
				<a class="list-group-item" href="{{$nav.network.0}}">{{$nav.network.1}}<span class="badge net-update"></span></a>
                                <a class="list-group-item" href="{{$nav.notifications.0}}">{{$nav.notifications.1}}2<span class="badge notify-update"></span></a>

			</div>
        	</li>
	</ul>
</nav>
-->
<nav class="navbar navbar-default largenav" role="navigation">
	<ul class="navbar-header navbar-nav nav">

	{{if $userinfo}}
	      <li id="nav-user-linkmenu" class="dropdown" ><a href="#" class="dropdown-toggle" data-toggle="dropdown" rel="#nav-user-menu" title="{{$userinfo.name}}"><img src="{{$userinfo.icon}}" alt="{{$userinfo.name}}"><span class="nav-dropdown-indicator">&#x25BC;</span></a>
		{{if $localuser}}
			<ul id="nav-user-menu" class="menu-popup2 dropdown-menu">
				{{foreach $nav.usermenu as $usermenu}}
					<li><a class="{{$usermenu.2}}" href="{{$usermenu.0}}" title="{{$usermenu.3}}">{{$usermenu.1}}</a></li>
				{{/foreach}}
				{{if $nav.profiles}}<li><a class="{{$nav.profiles.2}}" href="{{$nav.profiles.0}}" title="{{$nav.profiles.3}}">{{$nav.profiles.1}}</a></li>{{/if}}
				{{if $nav.manage}}<li><a class="{{$nav.manage.2}}" href="{{$nav.manage.0}}" title="{{$nav.manage.3}}">{{$nav.manage.1}}</a></li>{{/if}}	
				{{if $nav.contacts}}<li><a class="{{$nav.contacts.2}}" href="{{$nav.contacts.0}}" title="{{$nav.contacts.3}}" >{{$nav.contacts.1}}</a></li>{{/if}}
				{{if $nav.settings}}<li><a class="{{$nav.settings.2}}" href="{{$nav.settings.0}}" title="{{$nav.settings.3}}">{{$nav.settings.1}}</a></li>{{/if}}

				{{if $nav.admin}}<li><a class="{{$nav.admin.2}}" href="{{$nav.admin.0}}" title="{{$nav.admin.3}}" >{{$nav.admin.1}}</a></li>{{/if}}

				{{if $nav.logout}}<li><a class="menu-sep {{$nav.logout.2}}" href="{{$nav.logout.0}}" title="{{$nav.logout.3}}" >{{$nav.logout.1}}</a></li>{{/if}}

			</ul>
		{{/if}}
		</li>
	{{/if}}


	{{if $nav.lock}}
		<li id="nav-rmagic-link" class="nav-menu-icon" >
			<a class="icon-2x icon-{{$nav.lock.2}}" href="{{$nav.lock.0}}" title="{{$nav.lock.3}}" >{{$nav.lock.1}}</a>
		</li>
	{{/if}}

		
	{{if $nav.network}}
		<li id="nav-network-link" class="{{$sel.network}}">
                        <a href="{{$nav.network.0}}"><span class="nvb-text" data-toggle="tooltip" title="{{$nav.network.1}}">{{$nav.network.1}}</span><span class="icon-globe nvb-icon icon-2x"></span></a><span id="net-update" href="#" class="badge badge-info notify-badge dropdown-toggle" data-toggle="dropdown" rel="#nav-network-menu"></span>

<!--			<a class="{{$nav.network.2}}" href="{{$nav.network.0}}" title="{{$nav.network.3}}" >{{$nav.network.1}}</a>
			<span id="net-update" class="nav-notify fakelink" rel="#nav-network-menu"></span> -->
			<ul id="nav-network-menu" class="dropdown-menu notify-menus" rel="network">
				<li id="nav-network-see-all"><a href="{{$nav.network.all.0}}">{{$nav.network.all.1}}</a></li>
				<li id="nav-network-mark-all"><a href="#" onclick="markRead('network'); return false;">{{$nav.network.mark.1}}</a></li>
				<li class="empty">{{$emptynotifications}}</li>
			</ul>
			</li>
	{{/if}}

	{{if $nav.home}}
		<li id="nav-home-link" class="{{$sel.home}}">
                        <a href="{{$nav.home.0}}"><span class="nvb-text" data-toggle="tooltip" title="{{$nav.home.1}}">{{$nav.home.1}}</span><span class="icon-user nvb-icon icon-2x"></span></a><span id="home-update" href="#" class="badge badge-info notify-badge dropdown-toggle" data-toggle="dropdown" rel="#nav-home-menu"></span>

<!--			<a class="{{$nav.home.2}}" href="{{$nav.home.0}}" title="{{$nav.home.3}}" >{{$nav.home.1}}</a>
			<span id="home-update" class="nav-notify fakelink" rel="#nav-home-menu"></span> -->
			<ul id="nav-home-menu" class="dropdown-menu notify-menus" rel="home">
				<li id="nav-home-see-all"><a href="{{$nav.home.all.0}}">{{$nav.home.all.1}}</a></li>
				<li id="nav-home-mark-all"><a href="#" onclick="markRead('home'); return false;">{{$nav.home.mark.1}}</a></li>
				<li class="empty">{{$emptynotifications}}</li>
			</ul>
		</li>
	{{/if}}

   {{if $nav.register}}<li id="nav-register-link" class="{{$nav.register.2}}"><a href="{{$nav.register.0}}" title="{{$nav.register.3}}" >{{$nav.register.1}}</a><li>{{/if}}


	{{if $nav.messages}}
		<li id="nav-mail-link" class="{{$sel.messages}}">
                        <a href="{{$nav.messages.0}}"><span class="nvb-text" data-toggle="tooltip" title="{{$nav.messages.1}}">{{$nav.messages.1}}</span><span class="icon-envelope-alt icon-2x nvb-icon"></span></a><span id="mail-update" href="#" class="badge badge-info notify-badge dropdown-toggle" data-toggle="dropdown" rel="#nav-messages-menu"></span>

<!--			<a class="{{$nav.messages.2}}" href="{{$nav.messages.0}}" title="{{$nav.messages.3}}" >{{$nav.messages.1}}</a>
			<span id="mail-update" class="nav-notify fakelink" rel="#nav-messages-menu"></span> -->
			<ul id="nav-messages-menu" class="dropdown-menu notify-menus" rel="messages">
				<li id="nav-messages-see-all"><a href="{{$nav.messages.all.0}}">{{$nav.messages.all.1}}</a></li>
				<li id="nav-messages-mark-all"><a href="#" onclick="markRead('messages'); return false;">{{$nav.messages.mark.1}}</a></li>
				<li class="empty">{{$emptynotifications}}</li>
			</ul>
		</li>
	{{/if}}

	{{if $nav.all_events}}
		<li id="nav-all_events-link" class="{{$sel.all_events}}">
                        <a href="{{$nav.all_events.0}}"><span class="nvb-text" data-toggle="tooltip" title="{{$nav.all_events.1}}">{{$nav.all_events.1}}</span><span class="nvb-icon icon-calendar icon-2x"></span></a><span class="badge badge-info notify-badge dropdown-toggle" rel="#nav-all_events-menu" id="all_events-update" class="dropdown-toggle" data-toggle="dropdown"></span>
<!--			<a class="{{$nav.all_events.2}}" href="{{$nav.all_events.0}}" title="{{$nav.all_events.3}}" >{{$nav.all_events.1}}</a>
			<span id="all_events-update" class="nav-notify fakelink" rel="#nav-all_events-menu"></span> -->
			<ul id="nav-all_events-menu" class="dropdown-menu notify-menus" rel="all_events">
				<li id="nav-all_events-see-all"><a href="{{$nav.all_events.all.0}}">{{$nav.all_events.all.1}}</a></li>
				<li id="nav-all_events-mark-all"><a href="#" onclick="markRead('all_events'); return false;">{{$nav.all_events.mark.1}}</a></li>
				<li class="empty">{{$emptynotifications}}</li>
			</ul>
		</li>
	{{/if}}

	{{if $nav.intros}}
		<li id="nav-intros-link" class="{{$sel.intros}}">
                        <a href="{{$nav.intros.0}}"><span class="nvb-text" data-toggle="tooltip" title="{{$nav.intros.1}}">{{$nav.intros.1}}</span><span class="icon-info icon-2x nvb-icon"></span></a><span id="trino-update" href="#" class="badge badge-info notify-badge dropdown-toggle" data-toggle="dropdown" rel="#nav-intros-menu"></span>

<!--			<a class="{{$nav.intros.2}}" href="{{$nav.intros.0}}" title="{{$nav.intros.3}}" >{{$nav.intros.1}}</a>
			<span id="intro-update" class="nav-notify fakelink" rel="#nav-intros-menu"></span> -->
			<ul id="nav-intros-menu" class="dropdown-menu notify-menus" rel="intros">
				<li id="nav-intros-see-all"><a href="{{$nav.intros.all.0}}">{{$nav.intros.all.1}}</a></li>
				<li class="empty">{{$emptynotifications}}</li>
			</ul>
		</li>
	{{/if}}
		
	{{if $nav.notifications}}
		<li id="nav-notify-linkmenu" class="fakelink {{$sel.notifications}}">
                        <a href="{{$nav.notifications.0}}"><span class="nvb-text" data-toggle="tooltip" title="{{$nav.notifications.1}}">{{$nav.notifications.1}}</span><span class="icon-bell icon-2x nvb-icon"></span></a><span id="notify-update" href="#" class="badge badge-info notify-badge dropdown-toggle" data-toggle="dropdown" rel="#nav-notify-menu"></span>

<!--			<a href="{{$nav.notifications.0}}" title="{{$nav.notifications.1}}">{{$nav.notifications.1}}</a>
			<span id="notify-update" class="nav-notify fakelink" rel="#nav-notify-menu"></span>-->
			<ul id="nav-notify-menu" class="dropdown-menu menu-popup2 notify-menus" rel="notify">
				
				<li id="nav-notify-see-all"><a href="{{$nav.notifications.all.0}}">{{$nav.notifications.all.1}}</a></li>
				<li id="nav-notify-mark-all"><a href="#" onclick="markRead('notify'); return false;">{{$nav.notifications.mark.1}}</a></li>
				<li class="empty">{{$emptynotifications}}</li>
			</ul>
		</li>
	{{/if}}		
	
	{{if $nav.login}}<li id="nav-login-link" class="navbar-right {{$nav.login.2}}"><a href="{{$nav.login.0}}" title="{{$nav.login.3}}" >{{$nav.login.1}}</a><li>{{/if}}
	{{if $nav.alogout}}<li id=nav-alogout-link" class="navvar-right {{$nav}}-alogout.2"><a href="{{$nav.alogout.0}}" title="{{$nav.alogout.3}}" >{{$nav.alogout.1}}</a></li>{{/if}}

	{{if $nav.directory}}
		<li id="nav-directory-link" class="navbar-right {{$sel.directory}}">
			<a class="{{$nav.directory.2}}" href="{{$nav.directory.0}}" title="{{$nav.directory.3}}">{{$nav.directory.1}}</a>
		</li>
	{{/if}}

	{{if $nav.help}} 
		<li id="nav-help-link" class="navbar-right {{$sel.help}}">
			<a class="{{$nav.help.2}}" target="friendika-help" href="{{$nav.help.0}}" title="{{$nav.help.3}}" >{{$nav.help.1}}</a>
		</li>
	{{/if}}

	{{if $nav.apps}}
		<li id="nav-apps-link" class="navbar-right nav-menu {{$sel.apps}}">
			<a class=" {{$nav.apps.2}}" href="#" rel="#nav-apps-menu" title="{{$nav.apps.3}}" >{{$nav.apps.1}}</a>
			<ul id="nav-apps-menu" class="menu-popup">
			{{foreach $apps as $ap}}
				<li>{{$ap}}</li>
				{{/foreach}}
			</ul>
		</li>
	{{/if}}

		<li id="nav-searchbar">		
			<form method="get" action="search" class="navbar-form navbar-left">
				<input id="nav-search-text" class="form-control" type="text" value="" placeholder="{{$nav.search.1}}" name="search" title="{{$nav.search.3}}" onclick="this.submit();" />
			</form>
		</li>
		<div id="nav-search-spinner"></div>

	</ul>
</nav>

<ul id="nav-notifications-template" style="display:none;" rel="template">
	<li class="{4}"><a href="{0}"><img src="{1}">{2} <span class="notif-when">{3}</span></a></li>
</ul>

{{if $langselector}}<div id="langselector" >{{$langselector}}</div>{{/if}}
<div id="panel" style="display: none;"></div>
