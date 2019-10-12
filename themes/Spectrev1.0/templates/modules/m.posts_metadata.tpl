<div class="post-metadata floatL">
   <div style="padding: 12px">
      <div style="display:none" class="toast"></div>
      {if ($tsUser->is_admod || $tsUser->permisos.godp) && $tsUser->is_member == 1 && $tsPost.post_user != $tsUser->uid && $tsUser->info.user_puntosxdar >= 1}
      <div class="dar-puntos">
         {if $tsPunteador.rango >= 50}
         <center>
            <div class="input-group" style="width: 30%;">
              <input type="number" id="points" class="form-input" value="{$tsPunteador.rango}" min="1" max="{$tsPunteador.rango}">
              <button onclick="votar_post(document.getElementById('points').value); return false;" class="btn btn-success input-group-btn">Votar</button>
            </div>
         </center>
         {else}
         <span>Dar Puntos: <small>disponibles {$tsUser->info.user_puntosxdar}</small></span>
         <div class="dar_puntos">
         {section name=puntos start=1 loop=$tsUser->info.user_puntosxdar+1 max=$tsPunteador.rango}
            <a href="#" onclick="votar_post({$smarty.section.puntos.index}); return false;">{$smarty.section.puntos.index}</a>
         {/section}
         </div>
         {/if}
      </div>
      <hr class="divider"/>
      {/if}
      <div class="post-acciones">
         <ul>
            {if !$tsUser->is_member}
            <li><a class="btn btn-sm btn-secondary follow_user_post" href="#" onclick="registro_load_form(); return false"><span class="icons follow_post follow">Seguir Post</span></a></li>
            {elseif $tsPost.post_user != $tsUser->uid}
            <li{if !$tsPost.follow} style="display: none;"{/if}>
               <a class="btn btn-sm btn-error unfollow_post" onclick="notifica.unfollow('post', {$tsPost.post_id}, notifica.inPostHandle, $(this).children('span'))"><span class="icons follow_post unfollow">Dejar de seguir</span></a>
            </li>
            <li{if $tsPost.follow > 0} style="display: none;"{/if}>
               <a class="btn btn-sm btn-success follow_post" onclick="notifica.follow('post', {$tsPost.post_id}, notifica.inPostHandle, $(this).children('span'))"><span class="icons follow_post follow">Seguir Post</span></a>
            </li>
            <li><a href="#" onclick="{if !$tsUser->is_member}registro_load_form(){else}add_favoritos(){/if}; return false" class="btn btn-info btn-sm"><span class="icons agregar_favoritos">Agregar a Favoritos</span></a></li>
            <li><a href="#" onclick="denuncia.nueva('post', '{$tsPost.post_id}', '{$tsPost.post_title}', '{$tsAutor.user_name}'); return false;" class="btn btn-error btn-sm"><span class="icons denunciar_post">Denunciar</span></a></li>
            {/if}
         </ul>
      </div>
      <hr class="divider"/>
      <div class="tags-block">
         <span class="icons tags_title">Tags:</span>
         {foreach from=$tsPost.post_tags key=i item=tag}
         <a rel="tag" style="padding:2px 6px;font-size:11px;" class="label bg-dark" href="{$tsConfig.url}/buscador/?q={$tag|seo}&e=tags">{$tag}</a>
         {/foreach}
      </div>
   </div>
   
</div>
</div>