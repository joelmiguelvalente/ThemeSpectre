{include file='sections/main_header.tpl'}
{literal}
<script type="text/javascript">
var buscador = {
   // {/literal}
   tipo: '{if !$tsEngine}web{$tsEngine}{/if}',
   // {literal}
   select: function(tipo){
      if(this.tipo==tipo) return;
      //
      $('input[name="e"]').val(tipo);
      //Solo hago los cambios visuales si no envia consulta
      if(!this.buscadorLite){
         //Cambio here en <a />
         $('#select_' + this.tipo).removeClass('active');
         $('#select_' + tipo).addClass('active');
         //Cambio de logo
         $('#buscador-'+this.tipo).css('display', 'none');
         $('#buscador-'+tipo).css('display', 'inline');
         console.log(tipo);
      }
      //Muestro/oculto los input google
      if(tipo=='google'){ 
         //Ahora es google {/literal}
         $('form[name="buscador"]').append('<input type="hidden" name="cx" value="{keySearch}" />');
         // {literal}
      } else if(this.tipo=='google'){ //El anterior fue google
         $('input[name="cx"]').remove();
      }
      this.tipo = tipo;
   }
}
var bs = {
   busk: function(MoreOptions) {
      if(MoreOptions == MoreOptions) {
         $('#more_'+MoreOptions).toggle(1000);
      }
   }
}
</script>
{/literal}
<div class="empty">
   <div class="empty-icon"><i class="icon icon-3x icon-search"></i></div>
   <p class="empty-title h5">Buscar en <span>{if $tsEngine != 'google'}<b style="display: none;" id="buscador-google">Google</b>{/if}{if $tsEngine != 'web'}<b id="buscador-web">Web</b>{/if}{if $tsEngine != 'tags'}<b style="display: none;" id="buscador-tags">Tags</b>{/if}</span></p>
   {if $tsQuery || $tsAutor}
   <div id="buscadorLite">
      <div class="searchCont">
         <form action="" method="GET" name="buscador">
            <div class="searchFil">
               <ul class="tab">
                  <li class="tab-item" id="select_google"><a href="javascript:buscador.select('google')">Google</a></li>
                  <li class="tab-item active" id="select_web"><a href="javascript:buscador.select('web')">{$tsConfig.titulo}</a></li>
                  <li class="tab-item" id="select_tags"><a href="javascript:buscador.select('tags')">Tags</a></li>
                  <li class="tab-item tab-action">
                     <div class="empty-action input-group input-inline">
                        <input class="form-input input-sm" type="text" name="q" value="{$tsQuery}">
                        <button class="btn btn-primary btn-sm input-group-btn">Buscar</button>
                        <input type="hidden" name="e" value="{$tsEngine}" />
                        {if $tsEngine == 'google'}
                           <input type="hidden" name="cx" value="{keySearch}" />
                        {/if}
                     </div>
                  </li>
               </ul>
               <div class="columns">
                  <div class="column col-6">
                     <div class="form-group">
                        <label class="form-label">Categor&iacute;a</label>
                        <select class="form-select" name="cat">
                           <option value="-1">Todas</option>
                           {foreach from=$tsConfig.categorias item=c}
                              <option value="{$c.cid}"{if $tsCategory == $c.cid} selected="true"{/if}>{$c.c_nombre}</option>
                           {/foreach}
                        </select>
                     </div>
                  </div>
                  <div class="column col-6">
                     <div class="form-group" id="filtro_autor">
                        <label class="form-label">Usuario</label>
                        <input class="form-input" type="text" name="autor" value="{$tsAutor}"/>
                     </div>
                  </div>
               </div><!-- columns -->
            </div> <!-- .searchFil -->
         </form>
      </div>
   </div>
   <!-- BUSQUEDA EN GOOGLE | RESULTADOS -->
   {if $tsEngine == 'google'}
   <script async src="https://cse.google.com/cse.js?cx={keySearch}"></script>
   <div class="gcse-search"></div>
   {else}
   <div id="resultados" class="floatL" style="text-align: left;">
      <div id="showResult">
         <h2>Mostrando <strong>{$tsResults.total}</strong> de <strong>{$tsResults.pages.total}</strong> resultados totales</h2>
         <div class="columns">
            {foreach from=$tsResults.data item=r}
               <div class="column col-4">
                  <div class="tile tile-centered" id="div_{$r.post_id}">
                     <div class="tile-icon">
                        <div class="random-tile-icon">{$r.c_nombre|truncate:1:''}</div>
                     </div>
                     <div class="tile-content">
                        <div class="tile-title">
                           <a class="titlePost" href="{$tsConfig.url}/posts/{$r.c_seo}/{$r.post_id}/{$r.post_title|seo}.html">{$r.post_title}</a>
                        </div>
                        <small class="tile-subtitle text-gray">
                           <a href="{$tsConfig.url}/perfil/{$r.user_name}">{$r.user_name}</a> · 
                           <a href="{$tsConfig.url}/buscador/?q={$r.post_title}&e={$tsEngine}&cat={$tsCategory}&autor={$tsAutor}">Post Relacionados</a> · {$r.post_date|hace:true}
                        </small>
                     </div>
                     <div class="tile-action searchAction">
                        <button class="btn btn-link" onclick="bs.busk('{$r.post_id}'); return false;"><i class="icon icon-more-vert"></i></button>
                        <div class="info" id="more_{$r.post_id}">
                           <span><i class="lni-producthunt"></i> Puntos <strong>{$r.post_puntos|kmg}</strong></span>
                           <span><i class="lni-heart-filled"></i> Favoritos <strong>{$r.post_favoritos|kmg}</strong></span>
                           <span><i class="lni-comment-alt"></i> Comentarios <strong>{$r.post_comments|kmg}</strong></span> 
                        </div>
                     </div>
                  </div>
               </div>
            {/foreach}
         </div>
      </div>
      <div class="paginadorCom">
         {if $tsResults.pages.prev != 0}<div style="display: block; margin: 5px 0pt; width: 110px;text-align:left" class="floatL before"><a href="{$tsConfig.url}/buscador/?page={$tsResults.pages.prev}{if $tsQuery}&q={$tsQuery}{/if}{if $tsEngine}&e={$tsEngine}{/if}{if $tsCategory}&cat={$tsCategory}{/if}{if $tsAutor}&autor={$tsAutor}{/if}">&laquo; Anterior</a></div>{/if}
               {if $tsResults.pages.next != 0}<div style="display: block; margin: 5px 0pt; width: 110px;text-align:right" class="floatR next"><a href="{$tsConfig.url}/buscador/?page={$tsResults.pages.next}{if $tsQuery}&q={$tsQuery}{/if}{if $tsEngine}&e={$tsEngine}{/if}{if $tsCategory}&cat={$tsCategory}{/if}{if $tsAutor}&autor={$tsAutor}{/if}">Siguiente &raquo;</a></div>{/if}
            </div>
        </div>
   {/if}
   <!-- FIN -->
   {else}
   <div id="buscadorBig">
      <div class="searchCont">
         <form action="" method="GET" name="buscador" >
            <div class="searchFil">
               <ul class="tab">
                  <li class="tab-item" id="select_google"><a href="javascript:buscador.select('google')">Google</a></li>
                  <li class="tab-item active" id="select_web"><a href="javascript:buscador.select('web')">{$tsConfig.titulo}</a></li>
                  <li class="tab-item" id="select_tags"><a href="javascript:buscador.select('tags')">Tags</a></li>
                  <li class="tab-item tab-action">
                     <div class="empty-action input-group input-inline">
                        <input class="form-input input-sm" type="text" name="q" placeholder="">
                        <button class="btn btn-primary btn-sm input-group-btn">Buscar</button>
                        <input type="hidden" name="e" value="web" />
                     </div>
                  </li>
               </ul>
               <div class="columns">
                  <div class="column col-6">
                     <div class="form-group">
                        <label class="form-label">Categor&iacute;a</label>
                        <select class="form-select" name="cat">
                           <option value="-1">Todas</option>
                           {foreach from=$tsConfig.categorias item=c}
                              <option value="{$c.cid}">{$c.c_nombre}</option>
                           {/foreach}
                        </select>
                     </div>
                  </div>
                  <div class="column col-6">
                     <div class="form-group" id="filtro_autor">
                        <label class="form-label">Usuario</label>
                        <input class="form-input" type="text" name="autor" value="{$tsAutor}"/>
                     </div>
                  </div>
               </div><!-- .columns -->
            </div> <!-- .searchFil -->
         </form>
      </div><!-- .searchCont -->
   </div>
   {/if}
</div>
{include file='sections/main_footer.tpl'}