{if $tsUser->uid != $tsFoto.f_user && $tsUser->is_member}
<div class="v_follow">
   <a href="#" class="btn btn-info m-1" onclick="mensaje.nuevo('{$tsFoto.user_name}','','',''); return false;">Enviar mensaje</a>
   <a class="btn btn-error m-1 unfollow_user_post" onclick="notifica.unfollow('user', {$tsFoto.f_user}, notifica.userInPostHandle, $(this).children('span'))" {if $tsFoto.follow == 0}style="display: none;"{/if}><span class="icons unfollow">Dejar de seguir</span></a>
   <a class="btn btn-success m-1 follow_user_post" onclick="notifica.follow('user', {$tsFoto.f_user}, notifica.userInPostHandle, $(this).children('span'))" {if $tsFoto.follow == 1}style="display: none;"{/if}><span class="icons follow">Seguir Usuario</span></a>
   <a onclick="denuncia.nueva('foto',{$tsFoto.foto_id}, '{$tsFoto.f_title}', '{$tsFoto.user_name}'); return false;" class="btn btn-purple m-1" style="width:105px;"><span class="icons denunciar_post">Denunciar</span></a>
</div>
{/if}
{if $tsFoto.f_user == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.moef || $tsUser->permisos.moedfo}
<div class="box herr">
   <h4>Herramientas</h4>
   {if $tsFoto.f_status != 2 && ($tsUser->is_admod || $tsUser->permisos.moef || $tsFoto.f_user == $tsUser->uid)}<a href="#" class="btn btn-lock m-1 btn-error" onclick="{if $tsUser->uid == $tsFoto.f_user}fotos.borrar({$tsFoto.foto_id}, 'foto'); {else}mod.fotos.borrar({$tsFoto.foto_id}, 'foto');  {/if}return false;">Borrar</a>{/if}
   {if $tsUser->is_admod || $tsUser->permisos.moedfo || $tsFoto.f_user == $tsUser->uid}<a href="#" class="btn btn-lock m-1 btn-success" onclick="location.href='{$tsConfig.url}/fotos/editar.php?id={$tsFoto.foto_id}'; return false">Editar</a>{/if}
</div>
{/if}

<div class="box">
   <h4>Seguidores</h4>
   <ul id="v_album">
      {if $tsFFotos}
      {foreach from=$tsFFotos item=f}
      <li><a href="{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html"><img src="{$f.f_url}" title="{$f.f_title}" width="120" height="90" /></a><br /><a href="{$tsConfig.url}/perfil/{$f.user_name}" style="text-decoration:underline;"><strong>{$f.user_name}</strong></a></li>
      {/foreach}
      {else}
      <li class="emptyData"><u>{$tsFoto.user_name}</u> no sigue usuarios o no han subido fotos.</li>
      {/if}
   </ul>
   {if $tsFFotos}<a href="{$tsConfig.url}/fotos/{$tsFoto.user_name}" class="fb_foot">Ver todas</a>{/if}

   <h4>Estad&iacute;sticas</h4>
   <ul>
      <li><a href="{$tsConfig.url}/fotos/{$tsFoto.user_name}"><span>Fotos subidas</span><b>{$tsFoto.user_fotos}</b></a></li>
      <li><a href="#"><span>Comentarios</span><b>{$tsFoto.user_foto_comments}</b></a></li>
   </ul>
   
</div>