<div class="boxy-title">
	<h3>Administrar Fotos</h3>
</div>
<div id="res" class="boxy-content" style="position:relative">
	{if $tsAct == ''}
	{if !$tsAdminFotos.data}
	<div class="phpostAlfa">No hay fotos.</div>
	{else}
	<table class="table">
		<thead>
			<th>ID</th>
			<th>T&iacute;tulo</th>
			<th>Autor</th>
			<th>Fecha</th>
			<th>IP</th>
			<th>Comentarios</th>
			<th>Estado</th>
			<th>Acciones</th>
		</thead>
		<tbody>
			{foreach from=$tsAdminFotos.data item=f}
			<tr id="foto_{$f.foto_id}">
				<td>{$f.foto_id}</td>
				<td><a href="{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html" target="_blank">{$f.f_title|truncate:30}</a></td>
				<td><a href="{$tsConfig.url}/perfil/{$f.user_name}" class="hovercard" uid="{$f.user_id}">{$f.user_name}</a></td>
				<td>{$f.f_date|hace:true}</td>
				<td><a href="{$tsConfig.url}/moderacion/buscador/1/1/{$f.f_ip}" class="geoip" target="_blank">{$f.f_ip}</a></td>
				<td id="comments_foto_{$f.foto_id}">{if $f.f_closed == 1}<font color="red">Cerrados</font>{else}<font color="green">Abiertos</font>{/if}</td>
				<td id="status_foto_{$f.foto_id}">{if $f.f_status == 1}<font color="purple">Oculta</font>{elseif $f.f_status == 0}<font color="green">Visible</font>{else}<font color="red">Eliminada</font>{/if}</td>
				<td class="admin_actions">
					<a href="{$tsConfig.url}/fotos/editar.php?id={$f.foto_id}" target="_blank" title="Editar Foto"><i class="lni-pencil"></i></a>
					<a id="icocomm_foto_{$f.foto_id}" {if $f.f_status != 2}onclick="admin.fotos.setOpenClosed({$f.foto_id}); return false;"{/if} title="{if $f.f_status == 2}No disponible{else}Abrir/Cerrar Comentarios{/if}"><i class="lni-{if $f.f_closed == 1}support{else}comment{/if}"></i></a>
					<a id="icolock_foto_{$f.foto_id}" {if $f.f_status != 2}onclick="admin.fotos.setShowHide({$f.foto_id}); return false;"{/if} title="{if $f.f_status == 2}No disponible{else}Mostrar/Ocultar Foto{/if}"><i class="lni-{if $f.f_status != 1}un{/if}lock"></i></a>
					<a href="#" onclick="admin.fotos.borrar({$f.foto_id}); return false;" title="Borrar Foto"><i class="lni-trash"></i></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
		<tfoot>
		<td colspan="9">P&aacute;ginas: {$tsAdminFotos.pages}</td>
		</tfoot>
	</table>
	{/if}
	{/if}
</div>