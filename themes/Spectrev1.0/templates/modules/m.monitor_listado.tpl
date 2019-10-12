{if $tsData}
<ul class="listado">
   {if $tsAction == 'seguidores' || $tsAction == 'siguiendo'}
   <div class="monigrid">
   {foreach from=$tsData.data item=u}
      <div class="card">
         <div class="imagen_user" data-usuario="{$u.user_name}" onclick="location.href='{$tsConfig.url}/perfil/{$u.user_name}'">
            <img src="{$tsConfig.url}/files/avatar/{$u.user_id}_120.jpg" class="img-responsive">
         </div>
        <div class="card-body">
         <img src="{$tsConfig.images}/flags/{$u.user_pais|lower}.png"/> {$u.p_mensaje}
        </div>
        <div class="card-footer">
         <div{if $u.follow == 0 && $tsAction != 'siguiendo'} style="display: none;"{/if} class="btn_follow ruser{$u.user_id}">
            <a title="Dejar de seguir" class="btn btn-error" onclick="notifica.unfollow('user', {$u.user_id}, notifica.ruserInAdminHandle, this)"><span class="remove_follow"></span>Dejar de seguir</a>
         </div>
         <div{if $u.follow == 1 || $tsAction == 'siguiendo'} style="display: none;"{/if} class="btn_follow ruser{$u.user_id}">
            <a title="Seguir usuario" class="btn btn-success" onclick="notifica.follow('user', {$u.user_id}, notifica.ruserInAdminHandle, this)"><span class="add_follow"></span>Seguir usuario</a>
         </div>
        </div>
      </div>
   {/foreach}
   </div>
   {elseif $tsAction == 'posts'}
   <div class="monigrid">
   {foreach from=$tsData.data item=p}
      <div class="card">
         <div class="imagen_user" data-usuario="{$u.user_name}" onclick="location.href='{$tsConfig.url}/perfil/{$p.user_name}'">
            <img src="{$tsConfig.url}/files/avatar/{$p.post_user}_120.jpg" class="img-responsive">
         </div>
        <div class="card-body">
         <a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.f_id}/{$p.post_title|seo}.html">{$p.post_title}</a> | <img src="{$tsConfig.images}/icons/cat/{$p.c_img}"/> <span class="grey">{$p.c_nombre}</span>
        </div>
        <div class="card-footer">
         <div class="btn_follow list{$p.f_id}">
            <a title="Dejar de seguir" class="btn btn-error" onclick="notifica.unfollow('post', {$p.f_id}, notifica.ruserInAdminHandle, this)"><span class="remove_follow"></span>Dejar de seguir</a>
         </div>
         <div style="display: none;" class="btn_follow list{$p.f_id}">
            <a title="Seguir post" class="btn btn-success" onclick="notifica.follow('post', {$p.f_id}, notifica.ruserInAdminHandle, this)"><span class="add_follow"></span>Seguir post</a>
         </div>
        </div>
      </div>
   {/foreach}
   </div>
   {/if}
   {if $tsData.pages}
   <li class="listado-paginador clearfix">
      {if $tsData.pages.prev != 0}<a href="{$tsConfig.url}/monitor/{$tsAction}?page={$tsData.pages.prev}" class="anterior-listado floatL">Anterior</a>{/if}
      {if $tsData.pages.next != 0}<a href="{$tsConfig.url}/monitor/{$tsAction}?page={$tsData.pages.next}" class="siguiente-listado floatR">Siguiente</a>{/if}
   </li>
   {/if}
</ul>
{else}
<div class="emptyData">Nada por aqu&iacute;</div>
{/if}