<div class="modalForm" style="margin:-15px 0;">
{if $tsDo == 'aviso'}
    <div class="form-group"><label class="form-label">Para: <strong>{$tsUsername}</strong></label></div>
    <div class="form-group"><label class="form-label">Tipo:</label>
        <select name="mod_type" class="form-select" id="mod_type">
            <option value="0">Informaci&oacute;n</option>
            <option value="1">Alerta</option>
            <option value="2">Staff Message</option>
            <option value="3">Prohibici&oacute;n</option>
            <option value="4">Gif Message</option>
        </select>
    </div>
    <div class="form-group"><label class="form-label">Asunto:</label>
        <input type="text" name="mod_subject" class="form-input" id="mod_subject" size="50" tabindex="0" maxlength="24" value=""/></div>
    <div class="form-group">Mensaje:
        <textarea style="height:100px;" class="form-input" name="mod_body" id="mod_body" rows="10" tabindex="0"></textarea>
    </div>
{elseif $tsDo == 'ban'}
    <div class="form-group"><label class="form-label">Suspender a: <strong>{$tsUsername}</strong></label></div>
    
    <div class="form-group"><label class="form-label">Tiempo:</label>
        <select name="mod_time" class="form-select" id="mod_time" onchange="ban_time(this.value);">
            <option value="0">Indefinido</option>
            <option value="1">Permanente</option>
            <option value="2">Horas</option>
            <option value="3">D&iacute;as</option>
        </select>
    </div>
    
    <div id="ban_time" style="display:none">
    <div class="form-group"><label class="form-label">Cuantos:</label>
        <input type="text" class="form-input" name="mod_cant" id="mod_cant" size="10" tabindex="0" maxlength="3" class="mDate iTxt"/>
    </div>
    
    </div>
    <div class="form-group"><label class="form-label">Causa:</label>
        <textarea style="height:50px;" class="form-input" name="mod_causa" id="mod_causa" rows="10" tabindex="0"></textarea>
    </div>
    
<script type="text/javascript">
// {literal}
function ban_time(tid){
    if(tid == 2 || tid == 3){
        var txt = (tid == 2) ? 'Cuantas' : 'Cuantos';
        $('#ban_time > .form-group').text(txt);
        $('#ban_time').show()
    } else $('#ban_time').hide();
}
// {/literal}
</script>
{/if}
</div>