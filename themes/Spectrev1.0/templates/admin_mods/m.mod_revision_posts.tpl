<div class="boxy-title">
	<h3>Posts desaprobados</h3>
</div>
<div id="res" class="boxy-content" style="position:relative">
	{if !$tsPosts.datos}
	<div class="phpostAlfa">No hay posts esperando aprobaci&oacute;n</div>
	{else}
	<table class="table">
		<thead>
			<th>ID</th>
			<th>Post</th>
			<th>Moderador</th>
			<th>Raz&oacute;n</th>
			<th>Fecha</th>
			<th>IP</th>
			<th>Acciones</th>
		</thead>
		<tbody>
			{foreach from=$tsPosts.datos item=p}
			<tr id="report_{$p.post_id}">
				<td>{$p.post_id}</td>
				<td><a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html#pp_{$p.cid}" target="_blank">{$p.post_title|truncate:30}</a></td>
				<td><a href="{$tsConfig.url}/perfil/{$p.user_name}" class="hovercard" uid="{$p.user_id}">{$p.user_name}</a></td>
				<td>{$p.reason}</td>
				<td>{$p.date|hace:true}</td>
				<td>{$p.mod_ip}</td>
				<td class="admin_actions">
					<a href="#" onclick="mod.posts.view({$p.post_id}); return false;" title="Ver Post"><i class="lni-eye"></i></a>
					<a href="#" onclick="mod.reboot({$p.post_id}, 'posts', 'reboot', false); return false;" title="Reactivar Post"><i class="lni-reload"></i></a>
					<a href="{$tsConfig.url}/posts/editar/{$p.post_id}" target="_blank" title="Editar Post"><i class="lni-pencil"></i></a>
					<a href="#" onclick="mod.posts.borrar({$p.post_id}, false); return false" title="Borrar Post"><i class="lni-trash"></i></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
		<tfoot>
		<td colspan="8">P&aacute;ginas: {$tsPosts.pages}</td>
		</tfoot>
	</table>
	{/if}
</div>