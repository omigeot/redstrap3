<div class="field custom form-group">
<label for="group-selection" id="group-selection-lbl">{{$label}}</label>
<select name="group-selection" id="group-selection" class='form-control' >
{{foreach $groups as $group}}
<option value="{{$group.id}}" {{if $group.selected}}selected="selected"{{/if}} >{{$group.name}}</option>
{{/foreach}}
</select>
</div>
