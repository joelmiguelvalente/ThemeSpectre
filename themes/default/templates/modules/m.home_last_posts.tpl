{if $tsPostsStickys}
   <ul class="tab">
      <li class="tab-item active"><a href="#">Staff</a></li>
   </ul>
   <div class="columns posts">
      {foreach from=$tsPostsStickys item=p}
      <div class="column col-6">
         <div class="card"{if $p.post_status == 3} style="background-color:#f1f1f1;"{elseif $p.post_status == 1} style="background-color:coral;"{elseif $p.post_status == 2}style="background-color:rosyBrown;"{elseif $p.user_activo == 0} style="background-color:burlyWood;"{elseif $p.user_baneado == 1} style="background-color:orange;"{/if}>
            <div class="card-header">
               <div class="card-title h5" {if $p.post_status == 3}class="tooltip" title="El post est&aacute; en revisi&oacute;n"{elseif $p.post_status == 1}class="tooltip" title="El post se encuentra en revisi&oacute;n por acumulaci&oacute;n de denuncias"{elseif $p.post_status == 2}class="tooltip" title="El post est&aacute; eliminado"{elseif $p.user_activo == 0}class="tooltip" title="La cuenta del usuario est&aacute; desactivada"{/if}>{if $p.post_sponsored == 1}<i class="lni-target-audience"></i> {/if}{$p.post_title}</div>
               <div class="card-subtitle text-gray">{$p.user_name}</div>
            </div>
            <div class="chip">
               <figure class="avatar avatar-sm" data-initial="{$p.c_nombre|truncate:1:''}" style="background-color: #57{if $p.cid < 9}0{/if}{$p.cid}d9;"></figure>{$p.c_nombre}
            </div>
            <div class="card-body">{$p.post_body|nobbcode|truncate:90}</div>
            <div class="card-footer">
               <a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html" class="btn btn-primary btn-sm">Leer post</a>
            </div>
         </div>
      </div>
      {/foreach}
</div>
{/if}
{if $tsPosts}
   <ul class="tab">
      <li class="tab-item active"><a href="#">Posts</a></li>
   </ul>
   <div class="columns posts">
      {foreach from=$tsPosts item=p}
      <div class="column col-6">
         <div class="card" style="{if $p.post_status == 3} background-color:#f1f1f1; {elseif $p.post_status == 1}background-color:coral;{elseif $p.post_status == 2} background-color:rosyBrown;{elseif $p.user_activo == 0} background-color:burlyWood;{elseif $p.user_baneado == 1} background-color:orange;{/if}">
            <div class="card-header">
               <div class="card-title h5" {if $p.post_status == 3}class="tooltip" title="El post est&aacute; en revisi&oacute;n"{elseif $p.post_status == 1}class="tooltip" title="El post se encuentra en revisi&oacute;n por acumulaci&oacute;n de denuncias"{elseif $p.post_status == 2}class="tooltip" title="El post est&aacute; eliminado"{elseif $p.user_activo == 0}class="tooltip" title="La cuenta del usuario est&aacute; desactivada"{elseif $p.user_baneado == 1}class="tooltip" title="La cuenta del usuario est&aacute; suspendida"{/if} >{if $p.post_sponsored == 1}<i class="lni-target-audience"></i> {/if}{$p.post_title}</div>
               <span class="card-subtitle text-gray">{$p.user_name} · <i class="lni-bubble"></i> {$p.post_comments} · <i class="lni-producthunt"></i> {$p.post_puntos} · {$p.post_date|date_format:"%e %b, %Y"|replace:".":""}</span> 
            </div>
            <div class="chip">
               <figure class="avatar avatar-sm c{$p.cid}" data-initial="{$p.c_nombre|truncate:1:''}"></figure><span>{$p.c_nombre}</span>
            </div>
            <div class="card-body">{$p.post_body|nobbcode|truncate:90}</div>
            <div class="card-footer">
               <a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html" class="btn btn-primary btn-sm">Leer post</a>
            </div>
         </div>
      </div>
      {/foreach}
   </div>
   {else}
   <div class="emptyData">No hay posts aqu&iacute;</div>
{/if}


<ul class="pagination">
   {if $smarty.get.cat}
   {if $tsPages.prev > 0 && $tsPages.max == false}
   <li class="page-item"><a class="page-link" href="pagina{$tsPages.prev}">&laquo; Ant.</a></li>
   {/if}{if $tsPages.next <= $tsPages.pages}
   <li class="page-item"><a class="page-link" href="pagina{$tsPages.next}">Sig. &raquo;</a></li>
   {elseif $tsPages.max == true}
   <li class="page-item"><a class="page-link" href="pagina2">Sig. &raquo;</a></li>
   {/if}
   {else}
   {php}
   function mpaginacion(){
   //Variables principales
   $c_max_posts = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c_max_posts FROM w_configuracion'));
   $datos = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT stats_posts FROM w_stats'));
   $num_rows = $datos['stats_posts'];//Consultamos cuantos post hay
   $post_pp = $c_max_posts['c_max_posts'];//Consultamos cuantos post hay
   $lastpage = ceil($num_rows / $post_pp);//Calculamos cuantos ennlaces habra
   //Obtenemos el valor de la pagina actual
   if(!$_GET["page"]){
   $page=1;
   }else{
   $page = $_GET["page"];
   }
   //Creamos el array de la paginación
   for($i=0;$i<=$lastpage;$i++){
      $mpag[$i]=$i;
   }
   //Calculamos cuantas pestañas mostrar
   $v = $page + 9;
   for($c=9;$v>$lastpage; $c--){
   $v=$page+$c;
   }
   //Enlace a pagina anterior
   if($page>1){
   $anterior = $page - 1;
   echo "<li class='page-item'><a class='page-link' href=\"pagina".$anterior."\" alt=\"Página anterior\">&laquo; Ant.</a></li>";
   }
   //Mostramos los enlaces de la paginación
   for($i=$page; $i<=$v; $i++){
   echo "<li class='page-item'><a class='page-link' href=\"pagina".$mpag[$i]."\">".$mpag[$i]."</a>";
   }
   //Enlace a pagina siguiente
   if($page< $lastpage){
   $siguiente = $page + 1;
   echo "<li class='page-item'><a class='page-link' href=\"pagina".$siguiente."\" alt=\"Página siguiente\">Sig. &raquo;</a></li>";
   }
   }
   
   //Mostramos la paginacion
   if(!$_GET["cat"]){
   mpaginacion();
   }
   {/php}
   {/if}
</ul>