<ul class="pagination">
   <li class="page-item{if !$tsPages.prev > 0} disabled{/if}"><a href="#ver-comentarios" {if $tsPages.prev > 0}onclick="comentario.cargar({$tsPages.post_id}, {$tsPages.prev}, {$tsPages.autor});"{/if}><b>&laquo; Anterior</b></a></li>
   {section name=page start=1 loop=$tsPages.section}
      <li class="page-item{if $tsPages.current == $smarty.section.page.index} active{/if}"><a href="#ver-comentarios" {if $tsPages.current != $smarty.section.page.index}onclick="comentario.cargar({$tsPages.post_id}, {$smarty.section.page.index}, {$tsPages.autor});"{/if}>{$smarty.section.page.index}</a></li>
   {/section}
   <li class="page-item{if $tsPages.next > $tsPages.pages} disabled{/if}"><a href="#ver-comentarios" {if $tsPages.next <= $tsPages.pages}onclick="comentario.cargar({$tsPages.post_id}, {$tsPages.next}, {$tsPages.autor});"{/if}><b>Siguiente &raquo;</b></a></li>
</ul>
