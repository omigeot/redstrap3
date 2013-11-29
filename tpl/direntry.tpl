<div class="directory-item lframe thumbnail" id="directory-item-{{$entry.id}}" >
<div class="generic-content-wrapper">

<div class="contact-photo-wrapper" id="directory-photo-wrapper-{{$entry.id}}" >
<div class="contact-photo" id="directory-photo-{{$entry.id}}" >
<a href="{{$entry.profile_link}}" class="directory-profile-link" id="directory-profile-link-{{$entry.id}}" ><img class="directory-photo-img2 img-thumbnail" src="{{$entry.photo}}" alt="{{$entry.alttext}}" title="{{$entry.alttext}}" /></a>
</div>
</div>

<div class="contact-name h3" id="directory-name-{{$entry.id}}">{{$entry.name}}{{if $entry.connect}} <a class="icon-plus-sign btn" href="{{$entry.connect}}"></a>{{/if}}</div>
<!--{{if $entry.connect}}
<div class="directory-connect"><a class="btn btn-default" href="{{$entry.connect}}">{{$entry.conn_label}}</a></div>
{{/if}}-->
<div class="contact-details h5">{{$entry.details}}</div>
</div>
</div>
