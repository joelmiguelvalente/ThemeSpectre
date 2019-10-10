{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/borradores.js?{$smarty.now}"></script>
<div id="borradores">
   <script type="text/javascript">
      var borradores_data = [{$tsDrafts}];
   </script>
   <div class="columns">
      <div class="column col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 col-3">
         <div class="boxy">
            <h3 class="box-header">Filtrar</h3>
               <div class="boxy-content">
                  <h4>Mostrar</h4>
                  
                  <ul class="nav" id="borradores-filtros">
                     <li id="todos" class="nav-item active"><span class="cat-title"><a href="" onclick="borradores.active(this); borradores.filtro = 'todos'; borradores.query(); return false;">Todos</a></span> <span class="count float-right label label-error"></span></li>
                     <li id="borradores" class="nav-item"><span class="cat-title"><a href="" onclick="borradores.active(this); borradores.filtro = 'borradores'; borradores.query(); return false;">Borradores</a></span> <span class="count float-right label label-error"></span></li>
                     <li id="eliminados" class="nav-item"><span class="cat-title"><a href="" onclick="borradores.active(this); borradores.filtro = 'eliminados'; borradores.query(); return false;">Eliminados</a></span> <span class="count float-right label label-error"></span></li>
                  </ul>
                  <h4>Ordenar por</h4>
                  
                  <ul id="borradores-orden" class="nav">
                     <li  class="nav-item active"><span><a href="" onclick="borradores.active(this); borradores.orden = 'fecha_guardado'; borradores.query(); return false;">Fecha guardado</a></span></li>
                     <li class="nav-item"><span><a href="" onclick="borradores.active(this); borradores.orden = 'titulo'; borradores.query(); return false;">T&iacute;tulo</a></span></li>
                     <li class="nav-item"><span><a href="" onclick="borradores.active(this); borradores.orden = 'categoria'; borradores.query(); return false;">Categor&iacute;a</a></span></li>
                  </ul>
                  <h4>Categorias</h4>
                  
                  <ul class="nav" id="borradores-categorias">
                     <li id="todas"  class="nav-item active"><span class="cat-title active"><a href="" onclick="borradores.active(this); borradores.categoria = 'todas'; borradores.query(); return false;">Ver todas</a></span> <span class="count float-right label label-error"></span></li>
                  </ul>
                  </div><!-- boxy-content -->
               </div>
            </div>
            <div class="column col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-9 col-9">
               <div class="boxy">
                  <div class="boxytitle ">
                     <h3>Posts</h3>
                     <div class="form-group">
                        <input type="text" class="form-input" placeholder="Buscar" id="borradores-search" value="" onKeyUp="borradores.search(this.value, event)" onFocus="borradores.search_focus()" onBlur="borradores.search_blur()" autocomplete="off" />
                     </div>
                  </div>
                  <div id="res" class="boxy-content">
                  {if $tsDrafts}<ul id="resultados-borradores"></ul>{else}
                  <div class="emptyData">No tienes ning&uacute;n borrador ni post eliminado.</div>{/if}
               </div>
            </div>
            <div id="template-result-borrador" style="display:none">
               <li id="borrador_id___id__" class="borrador-res">
                  <a title="__categoria_name__" class="categoriaPost __categoria__ __tipo__" href="__url__" onclick="__onclick__"><img src="{$tsConfig.images}/icons/cat/__imagen__">__titulo__</a>
                  <span class="causa">Causa: __causa__</span>
                  <span class="gray">&Uacute;ltima vez guardado el __fecha_guardado__</span> 
                  <a class="borrar" href="" onclick="borradores.eliminar(__borrador_id__, true); return false;" title="Eliminar Borrador"><i class="lni-trash"></i></a>
                  
               </li>
            </div>
         </div>
      </div>
   </div>
{include file='sections/main_footer.tpl'}