<div id="post-comentarios">
   {if $tsUser->info.user_id == $tsPost.post_user}
   <div class="toast toast-error tet">
      <span>Si hay usuarios que insultan o generan disturbios en tu post puedes bloquearlos haciendo click sobre la opci&oacute;n desplegable de su avatar.</span>
   </div>
   {/if}
   <div class="comentarios-title">
      <h4><span id="ncomments">{$tsPost.post_comments}</span> Comentarios</h4>
      <div class="loading" id="com_gif" style="display: none"></div>
   </div>
   {if $tsPost.post_comments > $tsConfig.c_max_com}
   <div class="comentarios-title">
      <div class="paginadorCom"><!--HTML de las páginas--></div>
   </div>{/if}
   <div id="comentarios">
      <script type="text/javascript">
      // {literal}
      $(document).ready(function(){
      /*
      top_cmt = $("#offset_cmts").offset().top;
      //
      function check_load(){
      if (!comentario.cargado && $(window).scrollTop() + $(window).height() > top_cmt ) {
      // {/literal}
      */
      comentario.cargar({$tsPages.post_id}, 1, {$tsPages.autor});
      /*
      // {literal}
      comentario.cargado = true;
      }
      }
      $(window).scroll(check_load);
      check_load();*/
      });
      // {/literal}
      </script>
      <div id="no-comments"><div class="loading loading-lg"></div>Cargando comentarios espera un momento...</div>
   </div>{if $tsPost.post_comments > $tsConfig.c_max_com}
   <div class="comentarios-title">
      <div class="paginadorCom"><!--HTML de las páginas--></div>
   </div>{/if}
   
   {if $tsPost.post_block_comments == 1 && ($tsUser->is_admod == 0 && $tsUser->permisos.mocepc == false)}
   <div id="no-comments">El post se encuentra cerrado y no se permiten comentarios.</div>
   {elseif $tsUser->is_admod == 0 && $tsUser->permisos.gopcp == false}
   <div id="no-comments">No tienes permisos para comentar.</div>
   {elseif $tsUser->is_member && ($tsPost.post_block_comments != 1 || $tsPost.post_user == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.gopcp) && $tsPost.block == 0}
   <div class="miComentario">
      {include file='modules/m.posts_comments_form.tpl'}
   </div>
   {/if}
</div>
</div>