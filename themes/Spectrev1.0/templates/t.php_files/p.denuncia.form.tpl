{if $tsAction == 'denuncia-post'}
<div>
    <div class="form-group">
        <label class="form-label"><b>Denunciar el post:</b> {$tsData.obj_title}</label>
    </div>
    <div class="form-group">
        <label class="form-label"><b>Creado por:</b> <a href="{$tsConfig.url}/perfil/{$tsData.obj_user}" target="_blank">{$tsData.obj_user}</a></label>
    </div>
    <div class="form-group">
        <label class="form-label"><b>Raz&oacute;n de la denuncia:</b></label>
        <select name="razon" class="form-select">
        {foreach from=$tsDenuncias key=i item=denuncia}
            {if $denuncia}<option value="{$i}">{$denuncia}</option>{/if}
        {/foreach}
        </select>
    </div>
    <div class="form-group">
        <label class="form-label"><b>Aclaraci&oacute;n y comentarios:</b></label>
        <textarea tabindex="6" rows="5" class="form-input" style="width:100%" cols="40" name="extras"></textarea>
        <small>En el caso de ser Re-post se debe indicar el link del post original.</small>
    </div>
</div>
{elseif $tsAction == 'denuncia-foto'}
<div>
    <div class="form-group">
        <label class="form-label"><b>Denunciar foto:</b> {$tsData.obj_title}</label>
    </div>
    <div class="form-group">
        <label class="form-label"><b>Raz&oacute;n de la denuncia:</b></label>
        <select name="razon" class="form-select">
        {foreach from=$tsDenuncias key=i item=denuncia}
        	{if $denuncia}<option value="{$i}">{$denuncia}</option>{/if}
        {/foreach}
        </select>
    </div>
    <div class="form-group">
        <label class="form-label"><b>Aclaraci&oacute;n y comentarios:</b></label>
        <textarea tabindex="6" rows="5" cols="40" class="form-input" style="width:100%" name="extras"></textarea>
        <small>Para atender tu caso r&aacute;pidamente, adjunta pruebas de tu denuncia.<br /> (capturas de pantalla)</small>
    </label>
</div>
{elseif $tsAction == 'denuncia-mensaje'}
    <div class="form-group">
        <div class="emptyData">Si reportas este mensaje ser&aacute; eliminado de tu bandeja. <br />&iquest;Realmente quieres denunciar este mensaje como correo no deseado?</div>
        <input type="hidden" name="razon" class="form-input" value="spam" />
    </div>
{elseif $tsAction == 'denuncia-usuario'}
<div>
    <div class="form-group">
        <label class="form-label"><b>Denunciar usuario:</b> {$tsData.nick}</label>
    </div>
    <div class="form-group">
        <label class="form-label"><b>Raz&oacute;n de la denuncia:</b></label>
        <select name="razon" class="form-select">
        {foreach from=$tsDenuncias key=i item=denuncia}
            {if $denuncia}<option value="{$i}">{$denuncia}</option>{/if}
        {/foreach}
        </select>
    </div>
    <div class="form-group">
        <label class="form-label"><b>Aclaraci&oacute;n y comentarios:</b></label>
        <textarea tabindex="6" rows="5" cols="40" class="form-input" style="width:100%" name="extras"></textarea>
        <small>Para atender tu caso r&aacute;pidamente, adjunta pruebas de tu denuncia.<br /> (capturas de pantalla)</small>
    </div>
</div>
{/if}