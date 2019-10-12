<div class="boxy-title">
   <h3>Administrar Estad&iacute;sticas</h3>
</div>
<div id="res" class="boxy-content stastAdmin">
   <div id="ListStats">
      <div class="estadisticasList">
         <h6>Posts <span>{$tsAdminStats.posts_total}</span></h6>
         <ul>
            <li><span>Visibles</span><b>{$tsAdminStats.posts_visibles}</b></li>
            <li><span>En revisi&oacute;n</span><b>{$tsAdminStats.posts_revision}</b></li>
            <li><span>Inactivos</span><b>{$tsAdminStats.posts_ocultos}</b></li>
            <li><span>Eliminados</span><b>{$tsAdminStats.posts_eliminados}</b></li>
            <li><span>Posts compartidos</span><b>{$tsAdminStats.posts_compartidos}</b></li>
            <li><span>Posts favoritos</span><b>{$tsAdminStats.posts_favoritos}</b></li>
         </ul>
      </div>
      <div class="estadisticasList">
         <h6>Fotos <span>{$tsAdminStats.fotos_total}</span></h6>
         <ul>
            <li><span>Visibles</span><b>{$tsAdminStats.fotos_visibles}</b></li>
            <li><span>En revisi&oacute;n</span><b>{$tsAdminStats.fotos_ocultas}</b></li>
            <li><span>Eliminadas</span><b>{$tsAdminStats.fotos_eliminadas}</b></li>
         </ul>
      </div>
      <div class="estadisticasList">
         <h6>Comentarios en Posts <span>{$tsAdminStats.comentarios_posts_total}</span></h6>
         <ul>
            <li><span>Visibles</span><b>{$tsAdminStats.comentarios_posts_visibles}</b></li>
            <li><span>En revisi&oacute;n</span><b>{$tsAdminStats.comentarios_posts_ocultos}</b></li>
         </ul>
      </div>
      <div class="estadisticasList">
         <h6>Usuarios <span>{$tsAdminStats.usuarios_total}</span></h6>
         <ul>
            <li><span>Activos</span><b>{$tsAdminStats.usuarios_activos}</b></li>
            <li><span>Inactivos</span><b>{$tsAdminStats.usuarios_inactivos}</b></li>
            <li><span>Suspendidos</span><b>{$tsAdminStats.usuarios_baneados}</b></li>
         </ul>
      </div>
      <div class="estadisticasList">
         <h6>Muro <span>{$tsAdminStats.muro_total}</span></h6>
         <ul>
            <li><span>Estados</span><b>{$tsAdminStats.muro_estados}</b></li>
            <li><span>Comentarios</span><b>{$tsAdminStats.muro_comentarios}</b></li>
         </ul>
      </div>
      <div class="estadisticasList">
         <h6>Afiliados <span>{$tsAdminStats.afiliados_total}</span></h6>
         <ul>
            <li><span>Activos</span><b>{$tsAdminStats.afiliados_activos}</b></li>
            <li><span>Inactivos</span><b>{$tsAdminStats.afiliados_inactivos}</b></li>
         </ul>
      </div>
      <div class="estadisticasList">
         <h6>Medallas <span>{$tsAdminStats.medallas_total}</span></h6>
         <ul>
            <li><span>Usuarios</span><b>{$tsAdminStats.medallas_usuarios}</b></li>
            <li><span>Posts</span><b>{$tsAdminStats.medallas_posts}</b></li>
            <li><span>Fotos</span><b>{$tsAdminStats.medallas_fotos}</b></li>
            <li><span>Asignadas</span><b>{$tsAdminStats.medallas_asignadas}</b></li>
         </ul>
      </div>
      <div class="estadisticasList">
         <h6>Seguimiento <span>{$tsAdminStats.seguidos_total}</span></h6>
         <ul>
            <li><span>Usuarios</span><b>{$tsAdminStats.usuarios_follows}</b></li>
            <li><span>Posts</span><b>{$tsAdminStats.posts_follows}</b></li>
         </ul>
      </div>
      <div class="estadisticasList">
         <h6>Mensajes <span>{$tsAdminStats.mensajes_total}</span></h6>
         <ul>
            <li><span>Eliminados por receptor</span><b>{$tsAdminStats.mensajes_para_eliminados}</b></li>
            <li><span>Eliminados por autor</span><b>{$tsAdminStats.mensajes_de_eliminados}</b></li>
            <li><span>Respuestas</span><b>{$tsAdminStats.usuarios_respuestas}</b></li>
         </ul>
      </div>
      <div class="estadisticasList">
         <h6>Comentarios en Fotos <span>{$tsAdminStats.comentarios_fotos_total}</span></h6>
         <ul>
            <li><span>Visibles</span><b>{$tsAdminStats.comentarios_fotos_total}</b></li>
         </ul>
      </div>
   </div>
</div>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
{literal}
<script>
   var container = document.querySelector('#ListStats');
   var msnry = new Masonry( container, {
     // options
     itemSelector: '.estadisticasList',
   });
</script>
{/literal}