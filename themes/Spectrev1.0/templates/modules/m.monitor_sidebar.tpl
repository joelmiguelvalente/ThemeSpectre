<div>
   <ul class="tab tab-block">
      <li class="tab-item"><a href="{$tsConfig.url}/monitor/seguidores">Seguidores</a></li>
      <li class="tab-item"><a href="{$tsConfig.url}/monitor/siguiendo">Siguiendo</a></li>
      <li class="tab-item"><a href="{$tsConfig.url}/monitor/posts">Posts</a></li>
   </ul>
   <div class="categoriaList">
      <h2 class="h4">Filtrar Actividad</h2>
      <ul>
         <li style="text-align:center;">Elige que notificaciones recibir y cuales no.</li>
         <li class="divider"></li>
         <li><strong>Mis Posts</strong></li>
         <li><input type="checkbox" {if $tsData.filtro.f1 != true}checked="checked"{/if} onclick="notifica.filter('1', this)"/> Favoritos</li>
         <li><input type="checkbox" {if $tsData.filtro.f2 != true}checked="checked"{/if}onclick="notifica.filter('2', this)"/> Comentarios</li>
         <li><input type="checkbox" {if $tsData.filtro.f3 != true}checked="checked"{/if}onclick="notifica.filter('3', this)"/> Puntos Recibidos</li>
         <li><strong>Mis Comentarios</strong></li>
         <li><input type="checkbox" {if $tsData.filtro.f8 != true}checked="checked"{/if}onclick="notifica.filter('8', this)"/> Votos</li>
         <li><input type="checkbox" {if $tsData.filtro.f9 != true}checked="checked"{/if}onclick="notifica.filter('9', this)"/> Respuestas</li>
         <li><strong>Usuarios que sigo</strong></li>
         <li><input type="checkbox" {if $tsData.filtro.f4 != true}checked="checked"{/if}onclick="notifica.filter('4', this)"/> Nuevos</li>
         <li><input type="checkbox" {if $tsData.filtro.f5 != true}checked="checked"{/if}onclick="notifica.filter('5', this)"/> Posts</li>
         <li><input type="checkbox" {if $tsData.filtro.f10 != true}checked="checked"{/if}onclick="notifica.filter('10', this)"/> Fotos</li>
         <li><span class="monac_icons ma_share"></span><input type="checkbox" {if $tsData.filtro.f6 != true}checked="checked"{/if}onclick="notifica.filter('6', this)"/> Recomendaciones</li>
         <li><strong>Posts que sigo</strong></li>
         <li><span class="monac_icons ma_blue_ball"></span><input type="checkbox" {if $tsData.filtro.f7 != true}checked="checked"{/if}onclick="notifica.filter('7', this)"/> Comentarios</li>
         <li><strong>Mis Fotos</strong></li>
         <li><span class="monac_icons ma_comment_post"></span><input type="checkbox" {if $tsData.filtro.f11 != true}checked="checked"{/if}onclick="notifica.filter('11', this)"/> Comentarios</li>
         <li><strong>Perfil</strong></li>
         <li><span class="monac_icons ma_status"></span><input type="checkbox" {if $tsData.filtro.f12 != true}checked="checked"{/if}onclick="notifica.filter('12', this)"/> Publicaciones</li>
         <li><span class="monac_icons ma_w_comment"></span><input type="checkbox" {if $tsData.filtro.f13 != true}checked="checked"{/if}onclick="notifica.filter('13', this)"/> Comentarios</li>
         <li><span class="monac_icons ma_w_like"></span><input type="checkbox" {if $tsData.filtro.f14 != true}checked="checked"{/if}onclick="notifica.filter('14', this)"/> Likes</li>
      </ul>
      <div class="divider"></div>
       {if $tsConfig.c_allow_live == 1}
          <h2 class="h4">Live</h2>
          <ul>
             <li><input type="checkbox" {if $tsStatus.live_nots == 'ON'}checked="checked"{/if} onclick="live.ch_status('nots');"/> Ver notificaciones</li>
             <li><input type="checkbox" {if $tsStatus.live_mps == 'ON'}checked="checked"{/if} onclick="live.ch_status('mps');"/> Ver mensajes nuevos</li>
             <li><input type="checkbox" {if $tsStatus.live_sound == 'ON'}checked="checked"{/if} onclick="live.ch_status('sound');"/> Reproducir sonidos</li>
          </ul>
       {/if}
      </div>
      
   
</div>