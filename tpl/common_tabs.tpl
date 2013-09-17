<ul class="nav nav-tabs nav-justified">
	{{foreach $tabs as $tab}}
		<li class="{{$tab.sel}}" {{if $tab.id}}id="{{$tab.id}}"{{/if}}><a href="{{$tab.url}}" {{if $tab.title}} title="{{$tab.title}}"{{/if}}>{{$tab.label}}</a></li>
	{{/foreach}}
</ul>
<!-- <div class="tabs-end"></div> -->
