<div class="panel">
   <div class="panel-header text-center">
      <figure class="avatar avatar-xx avatar-big-cont">
         <div style="display: none" class="avatar-loading"></div>
         <img src="{$tsConfig.url}/files/avatar/{if $tsPerfil.p_avatar}{$tsPerfil.user_id}_120{else}avatar{/if}.jpg?t={$smarty.now}" class="avatar-big" id="avatar-img" alt="Avatar">
      </figure>
      <a onclick="avatar.edit(this)" class="edit btn btn-primary" id="avatar-edit">Editar</a>
      <div class="sidebar-tabs clearbeta">
         <ul class="change-avatar" style="display: none;">
            <li class="local-file">
               <span><a onclick="avatar.chgtab(this)" id="avatar-local">Local</a></span>
               <div class="mini-modal" style="display: none;">
                  <div class="dialog-m"></div>
                  <span>Subir Archivo</span>
                  <input type="file" name="file-avatar" id="file-avatar" size="15" class="browse"/><br/>
                  <button onclick="avatar.upload(this)" class="avatar-next btn btn-success local">Subir</button>
               </div>
            </li>
            <li class="url-file">
               <span><a onclick="avatar.chgtab(this)" id="avatar-url">Url</a></span>
               <div class="mini-modal" style="display: none;">
                  <div class="dialog-m"></div>
                  {if $tsConfig.c_allow_upload}
                  <span>Direcc&oacute;n de la imagen</span>
                  <input type="text" name="url-avatar" id="url-avatar" size="45"/><br/>
                  <button onclick="avatar.upload(this);" class="avatar-next btn btn-success url">Subir</button>
                  {else}
                  Lo sentimos por el momento solo puedes subir avatares desde tu PC.
                  {/if}
               </div>
            </li>
         </ul>
      </div>
   </div>
</div>

<h5 id="porc-completado-label">Perfil completo al {$tsPerfil.porcentaje}%</h5>
<div class="bar">
   <div class="bar-item tooltip" title="{$tsPerfil.porcentaje}%" style="width:{$tsPerfil.porcentaje}%;">{$tsPerfil.porcentaje}%</div>
</div>
<div id="prueba"></div>