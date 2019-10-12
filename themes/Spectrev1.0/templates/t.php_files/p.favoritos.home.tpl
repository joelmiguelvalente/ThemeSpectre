{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/favoritos.js?{$smarty.now}"></script>
<script type="text/javascript">
var favoritos_data = [{$tsFavoritos}];
</script>
<div class="columns">
   {if !$tsFavoritos}
   <div class="emptyData">No agregaste ning&uacute;n post a favoritos todav&iacute;a</div>{else}
   <div class="column col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 col-3">
      <label style="display: none;" for="favoritos-search">Buscar</label>
      <input type="text" autocomplete="off" class="form-input" placeholder="Buscar..." onblur="favoritos.search_blur()" onfocus="favoritos.search_focus()" onkeyup="favoritos.search(this.value, event)" value="" id="favoritos-search">
      <div class="categoriaList">
         <ul class="nav">
            <li id="cat_-1" class="nav-item">
               <a href="" onclick="favoritos.active(this); favoritos.categoria = 'todas'; favoritos.query(); return false;"><strong>Categor&iacute;as</strong></a>
            </li>
         </ul>
      </div>
   </div>
   <div class="column col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-9 col-9">
      <div id="resultados">
         <table class="table">
            
            <thead>
               <tr>
                  <th></th>
                  <th><a href="" onclick="favoritos.active2(this); favoritos.orden = 'titulo'; favoritos.query(); return false;">T&iacute;tulo</a></th>
                  <th><a href="" onclick="favoritos.active2(this); favoritos.orden = 'fecha_creado'; favoritos.query(); return false;">Creado</a></th>
                  <th><a href="" onclick="favoritos.active2(this); favoritos.orden = 'fecha_guardado'; favoritos.query(); return false;" class="here">Guardado</a></th>
                  <th><a href="" onclick="favoritos.active2(this); favoritos.orden = 'puntos'; favoritos.query(); return false;">Puntos</a></th>
                  
                  <th><a href="" onclick="favoritos.active2(this); favoritos.orden = 'comentarios'; favoritos.query(); return false;">Comentarios</a></th>
                  <th></th>
               </tr>
            </thead>
         <tbody></tbody>
      </table>
   </div>
</div>
{/if}
</div>
<div style="clear: both;"></div>

{include file='sections/main_footer.tpl'}