<div class="panel">
   <div class="panel-header text-center">
      <figure class="avatar avatar-xl"><img src="{$tsConfig.url}/files/avatar/{if $tsInfo.p_avatar}{$tsInfo.uid}_120{else}avatar{/if}.jpg" alt="Avatar"></figure>
      <div class="panel-title h5 mt-10"><a href="{$tsConfig.url}/perfil/{$tsInfo.nick}">{$tsInfo.nick}</a></div>
      <div class="panel-subtitle">{$tsInfo.p_nombre}</div>
       <strong style="color:#{$tsInfo.stats.r_color}">{$tsInfo.stats.r_name}</strong>
   </div>
   <nav class="panel-nav">
      <ul class="tab tab-block" id="tabs">
         <li class="tab-item active"><a onclick="$('#Menu').show(),$('#Info').hide(),$('#Datos').hide();">Menú</a></li>
         <li class="tab-item"><a onclick="$('#Menu').hide(),$('#Info').show(),$('#Datos').hide();">Info</a></li>
         <li class="tab-item"><a onclick="$('#Menu').hide(),$('#Info').hide(),$('#Datos').show();">Datos</a></li>
      </ul>
   </nav>
   <div class="panel-body active" id="Menu">
      <ul id="tabs_menu" class="menu2">
         {if $tsType == 'news' || $tsType == 'story'}
         <li class="selected menu-item"><a href="#" onclick="perfil.load_tab('news', this); return false">{if $tsType == 'story'}Publicaci&oacute;n{else}Noticias{/if}</a></li>
         {/if}
         <li {if $tsType == 'wall'}class="selected menu-item"{/if}><a href="#" onclick="perfil.load_tab('wall', this); return false">Muro</a></li>
         <li class="menu-item"><a href="#" onclick="perfil.load_tab('actividad', this); return false" id="actividad">Actividad</a></li>
         <li class="menu-item"><a href="#" onclick="perfil.load_tab('info', this); return false" id="informacion">Informaci&oacute;n</a></li>
         <li class="menu-item"><a href="#" onclick="perfil.load_tab('posts', this); return false">Posts</a></li>
         <li class="menu-item"><a href="#" onclick="perfil.load_tab('seguidores', this); return false" id="seguidores">Seguidores</a></li>
         <li class="menu-item"><a href="#" onclick="perfil.load_tab('siguiendo', this); return false" id="siguiendo">Siguiendo</a></li>
         <li class="menu-item"><a href="#" onclick="perfil.load_tab('medallas', this); return false">Medallas</a></li>
      </ul>
      <div class="foot">
      {if $tsUser->uid != $tsInfo.uid}
         {if $tsUser->is_member}
         <a href="#" class="btn btn-success" onclick="mensaje.nuevo('{$tsInfo.nick}','','',''); return false">Enviar mensaje</a>
         {/if}
      {/if}{if $tsUser->uid != $tsInfo.uid && $tsUser->is_member}
         <a class="btn btn-{if $tsInfo.block.bid}success{else}error{/if}" href="javascript:bloquear({$tsInfo.uid}, {if $tsInfo.block.bid}false{else}true{/if}, 'perfil')" id="bloquear_cambiar">{if $tsInfo.block.bid}Desbloquear{else}Bloquear{/if}</a>
         <a href="#" class="btn btn-suspend" onclick="denuncia.nueva('usuario',{$tsInfo.uid}, '', '{$tsInfo.nick}'); return false">Denunciar</a>
         {if ($tsUser->is_admod || $tsUser->permisos.mosu) && !$tsInfo.user_baneado}
            <a href="#" class="btn btn-suspend" onclick="mod.users.action({$tsInfo.uid}, 'ban', true); return false;">Suspender</a>
         {/if}{if !$tsInfo.user_activo || $tsInfo.user_baneado}
            <span class="btn btn-suspend">Cuenta {if !$tsInfo.user_activo}desactivada{else}baneada{/if}</span>
         {/if}
         <a class="btn btn-error unfollow_user_post" onclick="notifica.unfollow('user', {$tsInfo.uid}, notifica.userInPostHandle, $(this).children('span'))" {if $tsInfo.follow == 0}style="display: none;"{/if}><span class="icons unfollow">Dejar de seguir</span></a>
            <a class="btn btn-success follow_user_post" onclick="notifica.follow('user', {$tsInfo.uid}, notifica.userInPostHandle, $(this).children('span'))" {if $tsInfo.follow == 1}style="display: none;"{/if}><span class="icons follow">Seguir Usuario</span></a>
      {/if}
      </div>
   </div>
   <div class="panel-body" id="Info">
      <div class="tile tile-centered">
         <div class="tile-content">
            <div class="tile-title text-bold">Mensaje</div>
            <div class="tile-subtitles">{$tsInfo.p_mensaje}</div>
         </div>
      </div>
      <div class="tile tile-centered">
         <div class="tile-content">
            <div class="tile-title text-bold">Se registro</div>
            <div class="tile-subtitle">{$tsInfo.user_registro|fecha:true}</div>
         </div>
      </div>
      <div class="tile tile-centered">
         <div class="tile-content">
            <div class="tile-title text-bold">Locación</div>
            <div class="tile-subtitle">{$tsInfo.user_pais}</div>
         </div>
      </div>
   </div>
   <div class="panel-body" id="Datos">
      <ul class="menu2">
         <li class="menu-item">
            <strong>{$tsInfo.stats.user_puntos}</strong>
            <span>Puntos</span>
         </li>
         <li class="menu-item">
            <strong>{$tsInfo.stats.user_posts}</strong>
            <span>Posts</span>
         </li>
         <li class="menu-item">
            <strong>{$tsInfo.stats.user_comentarios}</strong>
            <span>Comentarios</span>
         </li>
         <li class="menu-item">
            <strong>{$tsInfo.stats.user_seguidores}</strong>
            <span>Seguidores</span>
         </li>
         <li class="menu-item">
            <strong>{$tsInfo.stats.user_fotos}</strong>
            <span>Fotos</span>
         </li>
      </ul>
   </div>
   <div class="panel-footer">
      {if $tsInfo.p_sitio}
         <a target="_blank" href="{$tsInfo.p_sitio}" title="Website">
            <i class="lni-world"></i>
         </a>
      {/if}{if $tsInfo.p_socials.f}
         <a target="_blank" href="http://www.facebook.com/{$tsInfo.p_socials.f}" title="Facebook">
            <i class="lni-facebook"></i>
         </a>
      {/if}{if $tsInfo.p_socials.t}
         <a target="_blank" href="http://www.twitter.com/{$tsInfo.p_socials.t}" title="Twitter">
            <i class="lni-twitter"></i>
         </a>
      {/if}{if $tsUser->is_admod == 1}
         <a href="{$tsConfig.url}/admin/users?act=show&amp;uid={$tsInfo.uid}" title="Editar a {$tsInfo.nick}"><i class="lni-seo-consulting"></i></a>
      {/if}
   </div>
</div>
<div style="margin: 10px 0;text-align: center;">
{$tsConfig.ads_300}
</div>

<div class="box">
   <ul class="tab">
      <li class="tab-item active"><a href="#medallas" onclick="perfil.load_tab('medallas', $('#medallas'));">Medallas<span>{$tsGeneral.m_total}</span></a></li>
   </ul>
   {if $tsGeneral.m_total}
   <ul class="listabox">
      {foreach from=$tsGeneral.medallas item=m}
      <img src="{$tsConfig.images}/icons/med/{$m.m_image}_32.png" title="{$m.m_title} - {$m.m_description}"/>
      {/foreach}
   </ul>
   {if $tsGeneral.m_total >= 21}<a href="#medallas" onclick="perfil.load_tab('medallas', $('#medallas'));" class="see-more">Ver m&aacute;s &raquo;</a>{/if}
   {else}
   <div class="emptyData">No tiene medallas</div>
   {/if}
</div>
<div class="box">
   <ul class="tab">
      <li class="tab-item active"><a href="#seguidores" onclick="perfil.load_tab('seguidores', $('#seguidores'));">Seguidores<span>{$tsInfo.stats.user_seguidores}</span></a></li>
   </ul>
   {if $tsGeneral.segs.data}
   <ul class="listabox">
      {foreach from=$tsGeneral.segs.data item=s}
      <li><a href="{$tsConfig.url}/perfil/{$s.user_name}" class="hovercard" uid="{$s.user_id}"><img src="{$tsConfig.url}/files/avatar/{$s.user_id}_120.jpg"/></a></li>
      {/foreach}
   </ul>
   {if $tsGeneral.segs.total >= 21}<a href="#seguidores" onclick="perfil.load_tab('seguidores', $('#seguidores'));" class="see-more">Ver m&aacute;s &raquo;</a>{/if}
   {else}
   <div class="emptyData">No tiene seguidores</div>
   {/if}
</div>
<div class="box">
   <ul class="tab">
      <li class="tab-item active"><a href="#seguidores" href="#siguiendo" onclick="perfil.load_tab('siguiendo', $('#siguiendo'));">Siguiendo<span>{$tsInfo.sigd.total}</span></a></li>
   </ul>
   {if $tsGeneral.sigd.data}
      <ul class="listabox">
         {foreach from=$tsGeneral.sigd.data item=s}
         <li><a href="{$tsConfig.url}/perfil/{$s.user_name}" class="hovercard" uid="{$s.user_id}"><img src="{$tsConfig.url}/files/avatar/{$s.user_id}_120.jpg"/></a></li>
         {/foreach}
      </ul>
   {if $tsGeneral.sigd.total >= 21}<a href="#siguiendo" onclick="perfil.load_tab('siguiendo', $('#siguiendo'));" class="see-more">Ver m&aacute;s &raquo;</a>{/if}
   {else}
      <div class="emptyData">No sigue usuarios</div>
   {/if}
</div>