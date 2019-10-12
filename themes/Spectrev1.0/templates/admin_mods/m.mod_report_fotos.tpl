<div class="boxy-title">
   <h3>Moderaci&oacute;n de fotos</h3>
</div>
<div id="res" class="boxy-content">
   {if $tsSave}<div style="display: block;" class="mensajes ok">Tus cambios han sido guardados.</div>{/if}
   {if $tsAct == ''}
   Recuerda leer el protocolo para poder moderar las fotos que han sido denunciadas por otros usuarios, si te es posible y se puede editar una foto, no la borres, <b>Ed&iacute;tala!</b>
   <div class="divider"></div>
   <table class="table">
      <thead>
         <th>Denuncias</th>
         <th>Foto</th>
         <th>Fecha</th>
         <th>Raz&oacute;n</th>
         <th>Acciones</th>
      </thead>
      <tbody>
         {if $tsReports}{foreach from=$tsReports item=r}
         <tr id="report_{$r.foto_id}">
            <td>{$r.total}</td>
            <td><a href="{$tsConfig.url}/fotos/{$r.user_name}/{$r.foto_id}/{$r.f_title|seo}.html" target="_blank">{$r.f_title|truncate:30}</a></td>
            <td>{$r.d_date|hace:true}</td>
            <td>{$tsDenuncias[$r.d_razon]}</td>
            <td class="admin_actions">
               <a href="{$tsConfig.url}/moderacion/fotos?act=info&obj={$r.foto_id}" title="Ver Detalles"><i class="lni-paperclip"></i></a>
               {if $tsUser->is_admod || $tsUser->permisos.mocdf}<a href="#" onclick="mod.reboot({$r.foto_id}, 'fotos', 'reboot', false); return false;" title="{if $r.f_status == 1}Reactivar Foto{else}Desechar denuncias{/if}"><i class="lni-reload"></i></a>{/if}
               {if $tsUser->is_admod || $tsUser->permisos.moedfo}<a href="{$tsConfig.url}/fotos/editar.php?id={$r.foto_id}" target="_blank" title="Editar Foto"><i class="lni-pencil"></i></a>{/if}
               {if $tsUser->is_admod || $tsUser->permisos.moef}<a href="#" onclick="mod.fotos.borrar({$r.foto_id}); return false" title="Borrar Foto"><i class="lni-trash"></i></a>{/if}
            </td>
         </tr>
         {/foreach}{else}
         <tr>
            <td colspan="5"><div class="emptyData">No hay fotos denunciadas hasta el momento.</div></td>
         </tr>
         {/if}
      </tbody>
      <tfoot>
      <th colspan="5">&nbsp;</th>
      </tfoot>
   </table>
   {elseif $tsAct == 'info'}
   <h2 class="detalles-mod">
   <a href="{$tsConfig.url}/fotos/{$r.user_name}/{$r.foto_id}/{$r.f_title|seo}.html" target="_blank">{$r.f_title}</a>{$tsDenuncia.data.f_title}</a> de <a href="{$tsConfig.url}/perfil/{$tsDenuncia.data.user_name}">{$tsDenuncia.data.user_name}</a>
   <span class="floatR admin_actions">
      {if $tsUser->is_admod || $tsUser->permisos.mocdf}<a href="#" onclick="mod.reboot({$tsDenuncia.data.foto_id}, 'fotos', 'reboot', true); return false" title="{if $tsDenuncia.data.f_status == 1}Reactivar Fotos{else}Desechar denuncias{/if}"><i class="lni-reload"></i></a>{/if}
      {if $tsUser->is_admod || $tsUser->permisos.moedfo}<a href="{$tsConfig.url}/fotos/editar.php?id={$tsDenuncia.data.foto_id}" target="_blank" title="Editar Fotos"><i class="lni-pencil"></i></a>{/if}
      {if $tsUser->is_admod || $tsUser->permisos.moef}<a href="#" onclick="mod.fotos.borrar({$tsDenuncia.data.foto_id}); return false" title="Borrar Foto"><i class="lni-trash"></i></a>{/if}
   </span>
   </h2>
   <table cellpadding="0" cellspacing="0" border="0" class="table" width="100%" align="center">
      <thead>
         <th>Denunciante</th>
         <th>Raz&oacute;n</th>
         <th>Informaci&oacute;n extra</th>
         <th>Fecha</th>
      </thead>
      <tbody>
         {foreach from=$tsDenuncia.denun item=d}
         <tr>
            <td><a href="{$tsConfig.url}/perfil/{$d.user_name}">{$d.user_name}</a></td>
            <td>{$tsDenuncias[$d.d_razon]}</td>
            <td>{if $d.d_extra}{$d.d_extra}{else}No hay informaci&oacute;n{/if}</td>
            <td>{$d.d_date|hace:true}</td>
         </tr>
         {/foreach}
      </tbody>
      <tfoot>
      <th colspan="5">&nbsp;</th>
      </tfoot>
   </table>
   {/if}
</div>