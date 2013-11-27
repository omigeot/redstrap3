<div id="profile-jot-wrapper" >

	<form id="profile-jot-form" action="{{$action}}" method="post" >
		<input type="hidden" name="type" value="{{$ptyp}}" />
		<input type="hidden" name="profile_uid" value="{{$profile_uid}}" />
		<input type="hidden" name="return" value="{{$return_path}}" />
		<input type="hidden" name="location" id="jot-location" value="{{$defloc}}" />
		<input type="hidden" name="expire" id="jot-expire" value="{{$defexpire}}" />
		<input type="hidden" name="media_str" id="jot-media" value="" />
		<input type="hidden" name="source" id="jot-source" value="{{$source}}" />
		<input type="hidden" name="coord" id="jot-coord" value="" />
		<input type="hidden" name="post_id" value="{{$post_id}}" />
		<input type="hidden" name="webpage" value="{{$webpage}}" />
		<input type="hidden" name="preview" id="jot-preview" value="0" />

		{{$mimeselect}}
		{{$layoutselect}}

		<div id="jot-title-wrap"><input name="title" id="jot-title" type="text" placeholder="{{$placeholdertitle}}" value="{{$title}}" class="jothidden" style="display:none"></div>
		{{if $catsenabled}}
		<div id="jot-category-wrap"><input name="category" id="jot-category" type="text" placeholder="{{$placeholdercategory}}" value="{{$category}}" class="jothidden" style="display:none" /></div>
		{{/if}}
		{{if $webpage}}
		<div id="jot-pagetitle-wrap"><input name="pagetitle" id="jot-pagetitle" type="text" placeholder="{{$placeholdpagetitle}}" value="{{$pagetitle}}" class="jothidden" style="display:none" /></div>
		{{/if}}
		<div id="jot-text-wrap">
		<textarea rows="5" cols="64" class="profile-jot-text" id="profile-jot-text" name="body" placeholder="{{$share}}">{{$content}}</textarea>
		</div>
		<div id="profile-jot-text-loading"></div>

<div id="profile-jot-submit-wrapper" class="jothidden btn-toolbar">
	<div id="profile-novisitor-wrapper" class="btn-group" style="display: {{$visitor}};" ondragenter="linkdropper(event);" ondragover="linkdropper(event);" ondrop="linkdrop(event);" >
		<span id="wall-image-upload" class="btn btn-default icon-camera" title="{{$upload}}"></span>
		<span id="wall-file-upload" class="btn btn-default icon-paper-clip" title="{{$attach}}"></span>
                <i id="profile-video" class="btn btn-default icon-facetime-video" title="{{$video}}" onclick="jotVideoURL();return false;"></i>
                <i id="profile-audio" class="btn btn-default icon-volume-up" title="{{$audio}}" onclick="jotAudioURL();return false;"></i>
                <i id="profile-location" class="btn btn-default icon-globe" title="{{$setloc}}" onclick="jotGetLocation();return false;"></i>
		<i id="profile-link" class="btn btn-default icon-link" title="{{$weblink}}" ondragenter="return linkdropper(event);" ondragover="return linkdropper(event);" ondrop="linkdrop(event);" onclick="jotGetLink(); return false;"></i>
	</div> 

	<div id="profile-nolocation-wrapper" style="display: none;" class="btn-group" >
		<i id="profile-nolocation" class="btn btn-default icon-circle-blank" title="{{$noloc}}" onclick="jotClearLocation();return false;"></i>
	</div>
	<div id="profile-expire-wrapper" style="display: {{$feature_expire}};" class="btn-group" >
		<i id="profile-expires" class="btn btn-default icon-eraser" title="{{$expires}}" onclick="jotGetExpiry();return false;"></i>
	</div> 
	
	<div id="profile-encrypt-wrapper" style="display: {{$feature_encrypt}};" class="btn-group">
		<i id="profile-encrypt" class="btn btn-info icon-key" title="{{$encrypt}}" onclick="red_encrypt('{{$cipher}}','#profile-jot-text',$('#profile-jot-text').val());return false;"></i>
	</div> 



        {{if $showacl}}
        <div id="profile-jot-perms" class="profile-jot-perms btn-group" style="display: {{$pvisit}};">
                <a href="#profile-jot-acl-wrapper" id="jot-perms-icon" class="btn btn-info {{$lockstate}}"  title="{{$permset}}" ></a>{{$bang}}
        </div>
        {{/if}}

        <div id="profile-jot-perms-end2"></div>


	<div class="btn-group" id="jot-post-mainbuttons">
        {{if $preview}}<span onclick="preview_post();" class="btn btn-primary icon-eye-open" title="{{$preview}}"></span>{{/if}}

        <input type="submit" class="btn btn-primary" id="profile-jot-submit" name="submit" value="{{$share}}" />
	</div>


	<div id="profile-rotator-wrapper" style="display: {{$visitor}};" >
		<div id="profile-rotator"></div>
	</div>  



	<div id="profile-jot-plugin-wrapper">
	{{$jotplugins}}
	</div>

	<div id="jot-preview-content" style="display:none;"></div>

	<div style="display: none;">
		<div id="profile-jot-acl-wrapper" style="width:auto;height:auto;overflow:auto;">
			{{$acl}}
			<hr style="clear:both"/>
			{{$jotnets}}
		</div>
	</div>


</div>

<div id="profile-jot-end"></div>
</form>
</div>
		{{if $content}}<script>initEditor();</script>{{/if}}
