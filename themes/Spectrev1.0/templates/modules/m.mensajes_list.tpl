{if $tsMensajes.data}
<div id="mpList">
   {foreach from=$tsMensajes.data item=mp}
   <div class="off-message{if $mp.mp_read_to == 0} unread{/if}" id="mp_{$mp.mp_id}">
      <div class="off-canvas-sidebar">
         <img src="{$tsConfig.url}/files/avatar/{$mp.mp_from}_120.jpg" />
      </div>
      <div class="off-canvas-content">
         <div class="content">
            <h4>{$mp.mp_subject}</h4>
            <small>{$mp.user_name} - {$mp.mp_date|hace}</small>
            <p>{if $mp.mp_type == 1}<i class="lni-pointer-right"></i> {/if}{$mp.mp_preview}</p>
            <a href="{$tsConfig.url}/mensajes/leer/{$mp.mp_id}" class="btn btn-primary btn-sm">Leer Mensaje</a>
            <a href="#" class="btn btn-success btn-sm read" title="Marcar como le&iacute;do" onclick="mensaje.marcar('{$mp.mp_id}:{$mp.mp_type}', 0, 1, this); return false;" {if $mp.mp_read_to == 1}style="display:none"{/if}>Marcar como le&iacute;do</a>
            <a href="#" class="btn btn-error btn-sm unread" title="Marcar como no le&iacute;do" onclick="mensaje.marcar('{$mp.mp_id}:{$mp.mp_type}', 1, 1, this); return false;" {if $mp.mp_read_to == 0}style="display:none"{/if}>Marcar como no le&iacute;do</a>
            <a href="#" class="btn btn-delete btn-sm" title="Eliminar" onclick="mensaje.eliminar('{$mp.mp_id}:{$mp.mp_type}',1); return false;">Eliminar</a>
         </div>
      </div>
   </div>
   {/foreach}
</div>
{else}
<div class="vacio">No hay mensajes</div>
{/if}
<div class="mpFooter">
   <div class="actions">
      {if $tsAction == ''}
         <a class="btn btn-success btn-sm" href="{$tsConfig.url}/mensajes/{if $tsQT == ''}?qt=unread{/if}">{if $tsQT == ''}No le&iacute;dos{else}Todos los mensajes{/if}</a>
      {/if}
   </div>
</div>
<ul class="pagination">
   {if $tsMensajes.pages.prev != 0}
   <li class="page-item page-prev">
      <a href="{$tsConfig.url}/mensajes/{if $tsAction}{$tsAction}/{/if}?page={$tsMensajes.pages.prev}{if $tsQT != ''}&qt=unread{/if}">&laquo; Anterior</a>
   </li>
   {/if}{if $tsMensajes.pages.next != 0}
   <li class="page-item page-next">
      <a href="{$tsConfig.url}/mensajes/{if $tsAction}{$tsAction}/{/if}?page={$tsMensajes.pages.next}{if $tsQT != ''}&qt=unread{/if}">Siguiente &raquo;</a>
   </li>
   {/if}
</ul>