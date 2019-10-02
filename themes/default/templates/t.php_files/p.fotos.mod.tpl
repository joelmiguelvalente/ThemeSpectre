<div class="form-group">
	<label class="form-label">Raz&oacute;n para borrar esta foto:</label>
	<select id="razon" class="form-select" onchange="if($(this).val() == 8) $('input[name=razon_desc]').slideDown();">
	{foreach from=$tsDenuncias item=d key=i}
	    {if $d}<option value="{$i}">{$d}</option>{/if}
	{/foreach}
	</select>
	<input type="text" name="razon_desc" maxlength="150" size="35" style="display:none" />
</div>
<style>
	#modalBody {
		padding: 0!important;
	}
</style>