<form action="{{$dest_url}}" id="{{$form_id}}" method="post" class="well">
	<input type="hidden" name="auth-params" value="login" />

	<div id="login_standard">
	{{include file="field_input.tpl" field=$lname}}
	{{include file="field_password.tpl" field=$lpassword}}
	</div>
	
	<div id="login-extra-links">
		{{if $register}}<a href="{{$register.link}}" title="{{$register.title}}" id="register-link" class="btn">{{$register.desc}}</a>{{/if}}
        <a href="lostpass" title="{{$lostpass}}" id="lost-password-link" class="btn" >{{$lostlink}}</a>
	</div>

	{{include file="field_checkbox.tpl" field=$remember}}
	
	<div id="login-standard-end"></div>

	<div id="login-submit-wrapper" >
		<input type="submit" name="submit" id="login-submit-button" value="{{$login}}" class="btn btn-primary" />
	</div>
	
	{{foreach $hiddens as $k=>$v}}
		<input type="hidden" name="{{$k}}" value="{{$v}}" />
	{{/foreach}}
	
	
</form>


<script type="text/javascript"> $(document).ready(function() { $("#id_{{$lname.0}}").focus();} );</script>
