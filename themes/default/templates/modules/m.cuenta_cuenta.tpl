<div class="content-tabs cuenta">
   <div class="alert-cuenta cuenta-1"></div>
   <fieldset>
      <div class="form-control">
         <label class="form-label" for="email">E-Mail:</label>
         <div class="input-fake input-hide-email">
            <a class="btn btn-primary btn-sm" onclick="input_fake('email')">Cambiar</a>
            <input type="text" value="{$tsUser->info.user_email}" class="form-input" disabled>
         </div>
         <input type="text" style="display: none" value="{$tsUser->info.user_email}" maxlength="35" name="email" id="email" class="form-input cuenta-save-1 input-hidden-email">
      </div>
      <div class="form-control">
         <label class="form-label" for="pais">Pa&iacute;s:</label>
         <select onchange="cuenta.chgpais()" class="cuenta-save-1 form-select" name="pais" id="pais">
            <option value="">Pa&iacute;s</option>
            {foreach from=$tsPaises key=code item=pais}
            <option value="{$code}" {if $code == $tsPerfil.user_pais}selected="selected"{/if}>{$pais}</option>
            {/foreach}
         </select>
      </div>
      <div class="form-control">
         <label class="form-label" for="estadoz">Estado/Provincia:</label>
         <select name="estado" id="estadoz" class="cuenta-save-1 form-select">
            {foreach from=$tsEstados key=code item=estado}
            <option value="{$code+1}" {if $code+1 == $tsPerfil.user_estado}selected="selected"{/if}>{$estado}</option>
            {/foreach}
         </select>
      </div>
      <div class="form-group">
         <label class="form-label">Sexo</label>
         <label class="form-radio">
            <input type="radio" value="m" name="sexo" class="radio cuenta-save-1" {if $tsPerfil.user_sexo == '1'}checked="checked"{/if}>
            <i class="form-icon"></i> Masculino
         </label>
         <label class="form-radio">
            <input type="radio" value="f" name="sexo" class="radio cuenta-save-1" {if $tsPerfil.user_sexo == '0'}checked="checked"{/if}>
            <i class="form-icon"></i> Femenino
         </label>
      </div>
   </fieldset>
   <div class="form-control">
      <label>Nacimiento:</label>
      <div class="columns gapless">
         <select class="cuenta-save-1 column col-4 form-select" name="dia">
            {section name=dias start=1 loop=32}
            <option value="{$smarty.section.dias.index}" {if $tsPerfil.user_dia ==  $smarty.section.dias.index}selected="selected"{/if}>{$smarty.section.dias.index}</option>
            {/section}
         </select>
         <select class="cuenta-save-1 column col-4 form-select" name="mes">
            {foreach from=$tsMeces key=mid item=mes}
            <option value="{$mid}" {if $tsPerfil.user_mes == $mid}selected="selected"{/if}>{$mes}</option>
            {/foreach}
         </select>
         <select class="cuenta-save-1 column col-4 form-select" name="ano">
            {section name=year start=$tsEndY loop=$tsEndY step=-1 max=$tsMax}
            <option value="{$smarty.section.year.index}" {if $tsPerfil.user_ano ==  $smarty.section.year.index}selected="selected"{/if}>{$smarty.section.year.index}</option>
            {/section}
         </select>
      </div>
   </div>
   {if $tsConfig.c_allow_firma}
   <div class="form-group">
      <label class="form-label" for="firma">Firma:<br /> <small style="font-weight:normal">(Acepta BBCode) Max. 300 car.</small></label>
      <textarea name="firma" id="firma" class="cuenta-save-1 form-control">{$tsPerfil.user_firma}</textarea>
   </div>
   {/if}
   <div class="buttons">
      <input type="button" value="Guardar" onclick="cuenta.save(1)" class="btn btn-primary">
      <input type="button" value="Siguiente" onclick="cuenta.save(1, true)" class="btn btn-success">
   </div>
   <div class="clearfix"></div>
</div>