<div class="panel">
   <div class="panel-header text-center">
      <figure class="avatar avatar-xl">
         <img src="{$tsConfig.url}/files/avatar/{$tsAutor.user_id}_120.jpg" alt="Avatar">
         <i class="avatar-presence {$tsAutor.status.css}"></i>
      </figure>
      <div class="panel-title h4 mt-10" style="color:#{$tsAutor.rango.r_color}">{$tsAutor.user_name}</div>
      <small class="panel-subtitle">{$tsAutor.rango.r_name}</small>
   </div>
   {if $tsAutor.user_id != $tsUser->uid}
      <div class="tile tile-centered">
         <div class="tile-content">
            <a href="#" class="btn btn-link btn-block" onclick="{if !$tsUser->is_member}registro_load_form();{else}mensaje.nuevo('{$tsAutor.user_name}','','','');{/if}return false">Enviar mensaje privado</a>
         </div>
      </div>
   {/if}

   <nav class="panel-nav">
      <ul class="tab">
         <li class="tab-item active"><a href="#">Datos del post</a></li>
      </ul>
   </nav>
   <div class="panel-body">
      <div>{$tsPost.m_total|kmg} <b>Medalla{if $tsPost.m_total != 1}s{/if}</b></div>
      <div>{$tsPost.post_favoritos|kmg} <b>Favoritos</b></div>
      <div>{$tsPost.post_hits|kmg} <b>Visitas</b></div>
      <div id="puntos_post">{$tsPost.post_puntos|kmg} <b>Puntos</b></div>
      <div>{$tsPost.post_seguidores|kmg} <b>Seguidores</b></div>
   </div>
   {if $tsUser->is_admod || $tsUser->permisos.modu || $tsUser->permisos.mosu}
   <nav class="panel-nav">
      <ul class="tab">
         <li class="tab-item active"><a href="#">Herramientas</a></li>
      </ul>
   </nav>
   <div class="panel-body">
      <a href="{$tsConfig.url}/moderacion/buscador/1/1/{$tsPost.post_ip}" class="btn m-1" target="_blank">{$tsPost.post_ip}</a>
      {if $tsUser->is_admod == 1}
         <a href="{$tsConfig.url}/admin/users?act=show&amp;uid={$tsAutor.user_id}" class="btn m-1">Editar Usuario</a>
      {/if}{if $tsAutor.user_id != $tsUser->uid} 
         <a href="#" onclick="mod.users.action({$tsAutor.user_id}, 'aviso', false); return false;" class="alert btn">Enviar Aviso</a>
      {/if}{if $tsAutor.user_id != $tsUser->uid && $tsUser->is_admod || $tsUser->permisos.modu || $tsUser->permisos.mosu}
         {if $tsAutor.user_baneado}
            {if $tsUser->is_admod || $tsUser->permisos.modu}
               <a href="#" onclick="mod.reboot({$tsAutor.user_id}, 'users', 'unban', false); $(this).remove(); return false;" class="btn m-1 unban">Desuspender Usuario</a>
            {/if}
          {else}
            {if $tsUser->is_admod || $tsUser->permisos.mosu}
               <a href="#" onclick="mod.users.action({$tsAutor.user_id}, 'ban', false); $(this).remove(); return false;" class="btn m-1 ban">Suspender Usuario</a>
            {/if}
         {/if}
      {/if}
   </div>
   {/if}
   <div class="panel-footer">
      {if !$tsUser->is_member}
         <a class="btn btn-success btn-block follow_user_post" href="#" onclick="registro_load_form(); return false"><span class="icons follow">Seguir Usuario</span></a>
      {elseif $tsAutor.user_id != $tsUser->uid}
         <a class="btn btn-error btn-block unfollow_user_post" onclick="notifica.unfollow('user', {$tsAutor.user_id}, notifica.userInPostHandle, $(this).children('span'))" {if !$tsAutor.follow}style="display: none;"{/if}><span class="icons unfollow">Dejar de seguir</span></a>
         <a class="btn btn-success btn-block follow_user_post" onclick="notifica.follow('user', {$tsAutor.user_id}, notifica.userInPostHandle, $(this).children('span'))" {if $tsAutor.follow > 0}style="display: none;"{/if}><span class="icons follow">Seguir Usuario</span></a>
      {/if}
   </div>
</div>
{include 'modules/m.global_ads_300.tpl'}