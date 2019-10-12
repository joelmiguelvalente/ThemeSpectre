<h3 class="active" onclick="cuenta.chgsec(this)">1. M&aacute;s sobre mi</h3>
<fieldset>
   <div class="alert-cuenta cuenta-2">
   </div>
   <div class="form-group">
      <label class="form-label" for="nombrez">Nombre completo</label>
      <input type="text" value="{$tsPerfil.p_nombre}" maxlength="60" name="nombrez" id="nombrez" class="form-input cuenta-save-2">
   </div>
   <div class="form-group">
      <label class="form-label" for="sitio">Mensaje Personal</label>
      <textarea value="" maxlength="60" name="mensaje" id="mensaje" class="cuenta-save-2">{$tsPerfil.p_mensaje}</textarea>
   </div>
   
   <div class="form-group">
      <label class="form-label" for="sitioz">Sitio Web</label>
      <input type="text" value="{$tsPerfil.p_sitio}" maxlength="60" name="sitio" id="sitioz" class="form-input cuenta-save-2">
   </div>
   <div class="form-group">
      <label class="form-label" for="ft">Redes sociales</label>
      <div class="input-group" style="margin-bottom:10px">
         <span class="input-group-addon">Facebook.com/</span>
         <input type="text" class="form-input cuenta-save-2" value="{$tsPerfil.p_socials.f}" name="facebook" id="ft" placeholder="Id de tu facebook">
      </div>
      <div class="input-group">
         <span class="input-group-addon">Twitter.com/</span>
         <input type="text" class="form-input cuenta-save-2" value="{$tsPerfil.p_socials.t}" name="twitter" id="ft2" placeholder="Id de tu twitter">
      </div>
   </div>
   <div class="form-group">
      <label>Me gustar&iacute;a</label>
      <div class="input-fake">
         {foreach from=$tsPData.gustos key=val item=text}
         <div class="form-group">
            <label class="form-checkbox">
               <input type="checkbox" name="g_{$val}" class="cuenta-save-2" value="1" {if $tsPerfil.p_gustos.$val == 1}checked="checked"{/if}>
               <i class="form-icon"></i> {$text}
            </label>
         </div>
         {/foreach}
      </div>
   </div>
   <div class="form-group">
      <label class="form-label" for="estado">Estado Civil</label>
      <div class="input-fake">
         <select class="form-select cuenta-save-2" name="estado" id="estado">
            {foreach from=$tsPData.estado key=val item=text}
            <option value="{$val}" {if $tsPerfil.p_estado == $val}selected="selected"{/if}>{$text}</option>
            {/foreach}
         </select>
      </div>
   </div>
   <div class="form-group">
      <label class="form-label" for="hijos">Hijos</label>
      <div class="input-fake">
         <select class="form-select cuenta-save-2" name="hijos" id="hijos">
            {foreach from=$tsPData.hijos key=val item=text}
            <option value="{$val}" {if $tsPerfil.p_hijos == $val}selected="selected"{/if}>{$text}</option>
            {/foreach}
         </select>
      </div>
   </div>
   <div class="form-group">
      <label class="form-label" for="vivo">Vivo con</label>
      <div class="input-fake">
         <select class="form-select cuenta-save-2" name="vivo" id="vivo">
            {foreach from=$tsPData.vivo key=val item=text}
            <option value="{$val}" {if $tsPerfil.p_vivo == $val}selected="selected"{/if}>{$text}</option>
            {/foreach}
         </select>
      </div>
   </div>
   <div class="buttons">
      <input type="button" value="Guardar y seguir" onclick="cuenta.save(2, true)" class="btn btn-success">
   </div>
</fieldset>