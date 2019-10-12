<h3 onclick="cuenta.chgsec(this)">2. Como soy</h3>
<fieldset style="display: none">
   <div class="alert-cuenta cuenta-3"></div>
   <div class="form-group">
      <label class="form-label" for="altura">Mi altura</label>
      <div class="input-group">
         <span class="input-group-addon">cent&iacute;metros</span>
         <input type="number" class="form-input cuenta-save-3" placeholder="cent&iacute;metros" value="{if $tsPerfil.p_altura}{$tsPerfil.p_altura}{/if}" name="altura" id="altura" maxlength="3">
      </div>
   </div>
   <div class="form-group">
      <label class="form-label" for="peso">Mi peso</label>
      <div class="input-group">
         <span class="input-group-addon">kilogramos</span>
         <input type="number" class="form-input cuenta-save-3" placeholder="kilogramos" value="{if $tsPerfil.p_peso > 0}{$tsPerfil.p_peso}{/if}" name="peso" id="peso" maxlength="3">
      </div>
   </div>
   <div class="form-group">
      <label class="form-label" for="pelo_color">Color de pelo</label>
      <div class="input-fake">
         <select class="form-select cuenta-save-3" name="pelo_color" id="pelo_color">
            {foreach from=$tsPData.pelo key=val item=text}
            <option value="{$val}" {if $tsPerfil.p_pelo == $val}selected="selected"{/if}>{$text}</option>
            {/foreach}
         </select>
      </div>
   </div>
   <div class="form-group">
      <label class="form-label" for="ojos_color">Color de ojos</label>
      <div class="input-fake">
         <select class="form-select cuenta-save-3" name="ojos_color" id="ojos_color">
            {foreach from=$tsPData.ojos key=val item=text}
            <option value="{$val}" {if $tsPerfil.p_ojos == $val}selected="selected"{/if}>{$text}</option>
            {/foreach}
         </select>
      </div>
   </div>
   <div class="form-group">
      <label class="form-label" for="fisico">Complexi&oacute;n</label>
      <div class="input-fake">
         <select class="form-select cuenta-save-3" name="fisico" id="fisico">
            {foreach from=$tsPData.fisico key=val item=text}
            <option value="{$val}" {if $tsPerfil.p_fisico == $val}selected="selected"{/if}>{$text}</option>
            {/foreach}
         </select>
      </div>
   </div>
   <div class="form-group">
      <label class="form-label" for="dieta">Mi dieta es</label>
      <div class="input-fake">
         <select class="form-selectcuenta-save-3" name="dieta" id="dieta">
            {foreach from=$tsPData.dieta key=val item=text}
            <option value="{$val}" {if $tsPerfil.p_dieta == $val}selected="selected"{/if}>{$text}</option>
            {/foreach}
         </select>
      </div>
   </div>
   <div class="buttons">
      <input type="button" value="Guardar y seguir" onclick="cuenta.save(3, true)" class="btn btn-success">
   </div>
</fieldset>