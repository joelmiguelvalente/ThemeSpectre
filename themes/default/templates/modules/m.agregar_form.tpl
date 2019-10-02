<input type="hidden" value="{$tsDraft.bid}" name="borrador_id"/>
<ul class="clearbeta">
   <div class="form-group">
      <label class="form-label">T&iacute;tulo</label>
      <span style="display: none;" class="form-input-hint"></span>
      <input type="text" tabindex="1" name="titulo" class="form-control required" value="{$tsDraft.b_title}"/>
      <div id="repost"></div>
   </div>
   <div class="form-group">
      <a name="post"></a>
      <label class="form-label">Contenido del Post</label>
      <span style="display: none;" class="form-input-hint"></span>
      <textarea id="markItUp" name="cuerpo" tabindex="2" style="min-height:400px;" class="required">{$tsDraft.b_body}</textarea>
   </div>
   
   </li>
   {if ($tsUser->is_admod > 0 || $tsUser->permisos.moedpo) && $tsDraft.b_title && $tsDraft.b_user != $tsUser->uid}
   <div style="clear:both;">
      <label>Raz&oacute;n</label>
      <span style="display: none;" class="form-input-hint"></span>
      <input type="text" tabindex="8" name="razon" maxlength="150" size="60" class="text-inp" value="" style="width:578px"/>
      Si has modificado el contenido de este post ingresa la raz&oacute;n por la cual lo modificaste.
   </div>
   {/if}
</ul>
<div class="actions" style="padding:10px">
   <span id="vistaPrevia" class="btn btn-info">Previsualizar</span>
   <span id="PublicarPost" class="btn btn-{if $tsDraft}info{else}success{/if}">{if $tsDraft}Guardar{else}Publicar{/if}</span>
   <span onclick="save_borrador()" id="borrador-save" class="btn btn-link">Guardar en borradores</span>
   <div id="borrador-guardado" style="float:right"></div>
</div>
