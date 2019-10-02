<div class="sidebar-add-post">
   {include file='modules/m.global_emoticons.tpl'}
   <div class="form-group">
      <label class="form-label">Tags</label>
      <span style="display: none;" class="form-input-hint"></span>
      <input type="text" tabindex="4" name="tags" placeholder="post, {$tsConfig.titulo}, otros, Argentina" maxlength="128" class="form-input required" value="{$tsDraft.b_tags}"/>
      Una lista separada por comas, que describa el contenido
   </div>
   <div class="form-group">
      <label class="form-label">Categor&iacute;a</label>
      <span style="display: none;" class="form-input-hint"></span>
      <select class="agregar form-select required" tabindex="5" name="categoria">
         <option value="" selected="selected">Elegir una categor&iacute;a</option>
         {foreach from=$tsConfig.categorias item=c}
         <option value="{$c.cid}" {if $tsDraft.b_category == $c.cid}selected="selected"{/if}><img src="{$tsConfig.images}/icons/cat/{$c.c_img}" alt="{$c.c_nombre}"> {$c.c_nombre}</option>
         {/foreach}
      </select>
   </div>
      <h5 style="padding: 4px;border-bottom:1px solid #CCC;display:block;">Opciones</h5>
      <div class="form-group">
         <label class="form-label">Qui&eacute;nes pueden comentar?</label>
         <select class="form-select" tabindex="5" name="sin_comentarios">
            <option value="0" {if $tsDraft.b_block_comments == 0}selected="selected"{/if}>Todos pueden comentar</option>
            <option value="1" {if $tsDraft.b_block_comments == 1}selected="selected"{/if}>Nadie puede comentar</option>
         </select>
      </div>
      <div class="form-group">
         <label class="form-checkbox" for="privado">
            <input type="checkbox" tabindex="6" name="privado" id="privado"{if $tsDraft.b_private == 1} checked="checked"{/if}> <i class="form-icon"></i> S&oacute;lo usuarios registrados <small>Tu post ser&aacute; visto s&oacute;lo por los usuarios que tengan cuenta en {$tsConfig.titulo}</small>
         </label>
      </div>
      <div class="form-group">
         <label class="form-checkbox" for="visitantes">
            <input type="checkbox" tabindex="8" name="visitantes" id="visitantes"{if $tsDraft.b_visitantes == 1} checked="checked"{/if}> <i class="form-icon"></i> Mostrar visitantes recientes <small>Tu post mostrar&aacute; los &uacute;ltimos visitantes que ha tenido.</small>
         </label>
      </div>
      <div class="form-group">
         <label class="form-checkbox" for="smileys">
            <input type="checkbox" tabindex="9" name="smileys" id="smileys"{if $tsDraft.b_smileys == 1} checked="checked"{/if}> <i class="form-icon"></i> Sin Smileys <small>Si tu post no necesita smileys, desact&iacute;valos.</small>
         </label>
      </div>
      {if $tsUser->is_admod == 1}
      <div class="form-group">
         <label class="form-checkbox" for="patrocinado">
            <input type="checkbox" tabindex="9" name="patrocinado" id="patrocinado"{if $tsDraft.b_sponsored == 1} checked="checked"{/if}> <i class="form-icon"></i> Patrocinado <small>Resalta este post entre los dem&aacute;s.</small>
         </label>
      </div>
      {/if}
      {if $tsUser->is_admod || $tsUser->permisos.most}
      <div class="form-group">
         <label class="form-checkbox" for="sticky">
            <input type="checkbox" tabindex="7" name="sticky" id="sticky"{if $tsDraft.b_sticky == 1} checked="checked"{/if}> <i class="form-icon"></i> Sticky <small>Colocar a este post fijo en la home.</small>
         </label>
      </div>
      {/if}
</div>