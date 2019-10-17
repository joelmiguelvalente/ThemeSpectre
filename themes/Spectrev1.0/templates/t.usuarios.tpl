{include file='sections/main_header.tpl'}
<link rel="stylesheet" href="{$tsConfig.css}/usuarios.css?{$smarty.now}">
<div id="resultados" class="columns">
   <div class="column col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-12">
      <div class="floatL xResults">
         Mostrando <strong>{$tsTotal}</strong> resultados de <strong>{$tsPages.total}</strong>
      </div>
   </div>
   <div class="column col-xs-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 col-3 filterFull">
      <div class="block floatL" style="line-height:25px">
         <form action="" method="get" class="">
            <ul class="menu">
               <li class="menu-item{if $tsFiltro.online == 'true'} active{/if}">
                 <label class="form-checkbox">
                   <input type="checkbox" name="online" value="true"{if $tsFiltro.online == 'true'} checked="true"{/if}><i class="form-icon"></i> En linea
                 </label>
               </li>
               <li class="menu-item{if $tsFiltro.avatar == 'true'} active{/if}">
                 <label class="form-checkbox">
                   <input type="checkbox" name="avatar" value="true"{if $tsFiltro.avatar == 'true'} checked="true"{/if}><i class="form-icon"></i> Con foto
                 </label>
               </li>
               <li class="menu-item{if $tsFiltro.sex == 'm'} active{/if}">
                 <label class="form-radio">
                   <input type="radio" name="sexo" value="m"{if $tsFiltro.sex == 'm'} checked="true"{/if}><i class="form-icon"></i> Hombre
                 </label>
               </li>
               <li class="menu-item{if $tsFiltro.sex == 'f'} active{/if}">
                 <label class="form-radio">
                   <input type="radio" name="sexo" value="f"{if $tsFiltro.sex == 'f'} checked="true"{/if}><i class="form-icon"></i> Mujer
                 </label>
               </li>
               <li class="menu-item{if $tsFiltro.sex == ''} active{/if}">
                 <label class="form-radio">
                   <input type="radio" name="sexo" value=""{if $tsFiltro.sex == ''} checked="true"{/if}><i class="form-icon"></i> Ambos
                 </label>
               </li>
               <li class="menu-item form-group{if $tsFiltro.pais} active{/if}">
                 <select class="form-select" name="pais" id="pais">
                   <option value="">Todos los Pa&iacute;ses...</option>
                   {foreach from=$tsPaises key=code item=pais}
                     <option value="{$code}" {if $tsFiltro.pais == $code}selected="true"{/if}>{$pais}</option>
                  {/foreach}
                 </select>
               </li>
               <li class="menu-item form-group{if $tsFiltro.rango} active{/if}">
                 <select class="form-select" name="rango" id="rango">
                   <option value="">Todos los Rangos...</option>
                   {foreach from=$tsRangos item=r}
                     <option value="{$r.rango_id}" {if $tsFiltro.rango == $r.rango_id}selected="true"{/if}>{$r.r_name}</option>
                  {/foreach}
                 </select>
               </li>
               <li class="menu-item">
                  <input type="submit" class="btn btn-success" value="Filtrar" />
               </li>
            </ul>
         </form>
      </div>
   </div>
   <div id="showResult" class="column col-xs-12 col-sm-12 col-md-12 col-lg-9 col-xl-9 col-9 resultFull">
      {if $tsUsers}
         <div class="columns">
         {foreach from=$tsUsers item=u}
            <div class="resultBox column col-xl-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 col-3">
               <div class="card usuarios">
                  <figure class="avatar avatar-xl" onclick="loaction.href='{$tsConfig.url}/perfil/{$u.user_name}'">
                     <img src="{$tsConfig.url}/files/avatar/{$u.user_id}_120.jpg">
                     <i class="avatar-presence{if $u.status.t == 'Online'} online{else} {/if}"></i>
                  </figure>
                 <div class="card-header">
                   <div class="card-title h5" style="color:#{$u.rango.color}">{$u.user_name}</div>
                   <div class="card-subtitle text-gray"><img src="{$tsConfig.images}/icons/ran/{$u.rango.image}" class="float-right" alt="{$u.rango.title}">{$u.rango.title} {if $u.user_sexo == 0} - Mujer{else} - Hombre{/if} {$tsPaises[$u.user_pais]}</div>
                 </div>
                  <div class="card-body">
                     {if $u.p_mensaje}<div class="mensajes_user">{$u.p_mensaje}</div>{/if}
                     <div class="stats">
                        <span>Posts: <strong>{$u.user_posts}</strong></span>
                        <span>Puntos: <strong>{$u.user_puntos}</strong></span>
                        <span>Comentarios: <strong>{$u.user_comentarios}</strong></span>
                     </div>              
                     {if $u.user_id != $tsUser->uid}
                       <div class="card-footer">
                         <a class="btn btn-primary" href="#" onclick="{if !$tsUser->is_member}registro_load_form();{else}mensaje.nuevo('{$u.user_name}','','','');{/if}return false">Enviar Mensaje</a>
                       </div>
                     {/if}
                  </div>
               </div>
            </div>
         {/foreach}
         </div>
      {else}
         <div class="emptyData">No se encontraro usuarios con los filtros seleccionados.</div>
      {/if}
      
      <div class="paginador">
         {if $tsPages.prev != 0}<div style="text-align:left" class="floatL"><a href="{$tsConfig.url}/usuarios/?page={$tsPages.prev}{if $tsFiltro.online == 'true'}&online=true{/if}{if $tsFiltro.avatar == 'true'}&avatar=true{/if}{if $tsFiltro.sex}&sex={$tsFiltro.sex }{/if}{if $tsFiltro.pais}&pais={$tsFiltro.pais}{/if}{if $tsFiltro.rango}&rango={$tsFiltro.rango}{/if}">&laquo; Anterior</a></div>{/if}
         {if $tsPages.next != 0}<div style="text-align:right" class="floatR"><a href="{$tsConfig.url}/usuarios/?page={$tsPages.next}{if $tsFiltro.online == 'true'}&online=true{/if}{if $tsFiltro.avatar == 'true'}&avatar=true{/if}{if $tsFiltro.sex}&sex={$tsFiltro.sex }{/if}{if $tsFiltro.pais}&pais={$tsFiltro.pais}{/if}{if $tsFiltro.rango}&rango={$tsFiltro.rango}{/if}">Siguiente &raquo;</a></div>{/if}
         <div style="clear:both"></div>
      </div>
   </div>
   <div class="floatL" style="margin-left: 5px; width: 180px; margin-top: 25px;">
      <center>{$tsConfig.ads_160}</center>
   </div>
</div>
{include file='sections/main_footer.tpl'}