{if ($tsAction == 'agregar' && ($tsUser->permisos.gopf || $tsUser->is_admod)) || ($tsAction == 'editar' && ($tsUser->permisos.moedfo || $tsUser->is_admod))}
   <h2 class="encab">{if $tsAction == 'agregar'}Agregar nueva{else}Editar{/if} foto</h2>
   <form name="add_foto" method="post" action="" enctype="multipart/form-data" id="foto_form" class="form-add-post" autocomplete="off">
      <div class="loader" style="display: none;">
         <div>
            <div class="loading loading-lg"></div>
            <h2>Cargando foto, espere por favor....</h2>
         </div>
      </div>
      <div class="fade_out">
         <ul class="clearbeta">
            <li class="form-group">
               <label class="form-label" for="ftitle">T&iacute;tulo</label>
               <span style="display: none;" class="errormsg"></span>
               <input type="text" tabindex="1" name="titulo" id="ftitle" maxlength="40" class="form-input required" value="{$tsFoto.f_title}"/>
            </li>
            {if $tsAction != 'editar'}
            {if $tsConfig.c_allow_upload == 1}
            <li class="form-group">
               <label class="form-label" for="ffile">Archivo</label>
               <input type="file" name="file" id="ffile" />
            </li>
            {else}
            <li class="form-group">
               <label class="form-label" for="furl">URL</label>
               <span style="display: none;" class="errormsg"></span>
               <input type="text" tabindex="2" name="url" id="furl" maxlength="200" class="form-input required" value="{$tsFoto.f_url}"/>
            </li>
            {/if}
            {/if}
            <li class="form-group">
               <label class="form-label" for="fdesc">Descripci&oacute;n (<small>Max 500 car.</small>)</label>
               <span style="display: none;" class="errormsg"></span>
               <textarea name="desc" class="form-input" id="fdesc" cols="60" rows="5" onkeydown="return ControlLargo(this);" onkeyup="return ControlLargo(this);">{$tsFoto.f_description}</textarea>
            </li>
            <li class="form-group">
               <label>Opciones</label>
               <div class="form-group">
                  <label class="form-checkbox" for="sin_comentarios">
                     <input type="checkbox" id="sin_comentarios" name="closed"{if $tsFoto.f_closed == 1} checked="true"{/if}>
                     <i class="form-icon"></i> <b>Cerrar Comentarios</b>: Si no quieres recibir comentarios en tu foto.
                  </label>
               </div>
               <div class="form-group">
                  <label class="form-checkbox" for="visitas">
                     <input type="checkbox" id="visitas" name="visitas"  {if $tsFoto.f_visitas == 1} checked="true"{/if}>
                     <i class="form-icon"></i> <b>&Uacute;ltimos visitantes</b>: Se mostrar&aacute;n los &uacute;ltimos visitantes.
                  </label>
               </div>
               
            </li>
         </ul>
         {if $tsUser->is_admod > 0 && $tsAction == 'editar' && $tsFoto.f_user  != $tsUser->uid}
         <li class="form-group">
            <label>Raz&oacute;n</label>
            <input type="text" tabindex="8" name="razon" maxlength="150" size="60" class="form-input" value=""/>
            Si has modificado el contenido de esta foto, ingresa la raz&oacute;n.
         </li>
         {/if}
         <div class="end-form clearbeta">
            <input type="button" class="btn btn-{if $tsAction == 'agregar'}success{else}primary{/if}" name="new" value="{if $tsAction == 'agregar'}Agregar foto{else}Guardar cambios{/if}" onclick="fotos.agregar()"/>
         </div>
      </div>
   </form>

{else}
<div class="emptyData clearfix">
   Lo sentimos, pero no puedes {if $tsAction == 'agregar'}agregar{else}editar{/if} una nueva foto.
</div>
{/if}