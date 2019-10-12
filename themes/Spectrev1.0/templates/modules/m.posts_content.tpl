<div class="post-contenedor">
	<div class="post-title">		
		<h1>{$tsPost.post_title}</h1>
		<div class="subtitle">
			<a href="{$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/" class="label label-primary">{$tsPost.categoria.c_nombre}</a> - <span class="text-capitalize">{$tsPost.post_date|date_format}</span>
		</div>
	</div>
	<div class="post-contenido">
		{if !$tsUser->is_member}{include file='modules/m.global_ads_728.tpl'}{/if}
		{if $tsPost.post_user == $tsUser->uid && $tsUser->is_admod == 0 && $tsUser->permisos.most == false && $tsUser->permisos.moayca == false && $tsUser->permisos.moo == false && $tsUser->permisos.moep ==  false && $tsUser->permisos.moedpo == false}
		<div class="btn-group btn-group-block">			
			<a title="Borrar Post" onclick="borrar_post(); return false;" href="" class="btn btn-sm btnActions">Borrar</a>			
			<a title="Editar Post" onclick="location.href='{$tsConfig.url}/posts/editar/{$tsPost.post_id}'; return false" href="" class="btn btn-sm btnActions">Editar</a>
		</div>
		{elseif ($tsUser->is_admod && $tsPost.post_status == 0) || $tsUser->permisos.most || $tsUser->permisos.moayca || $tsUser->permisos.moop || $tsUser->permisos.moep || $tsUser->permisos.moedpo}
		<div class="btn-group btn-group-block">
			{if $tsUser->is_admod || $tsUser->permisos.most}<a href="#" onclick="mod.reboot({$tsPost.post_id}, 'posts', 'sticky', false); if($(this).text() == 'Poner Sticky') $(this).text('Quitar Sticky'); else $(this).text('Poner Sticky'); return false;" class="btn btn-sm sticky">{if $tsPost.post_sticky == 1}Quitar{else}Poner{/if} Sticky</a>{/if}
			{if $tsUser->is_admod || $tsUser->permisos.moayca}<a href="#" onclick="mod.reboot({$tsPost.post_id}, 'posts', 'openclosed', false); if($(this).text() == 'Cerrar Post') $(this).text('Abrir Post'); else $(this).text('Cerrar Post'); return false;" class="btn btn-sm openclosed">{if $tsPost.post_block_comments == 1}Abrir{else}Cerrar{/if} Post</a>{/if}
			{if $tsUser->is_admod || $tsUser->permisos.moop}<a id="desaprobar" href="#" onclick="$('#desapprove').slideToggle(); $(this).fadeOut().remove();" class="btn btn-sm des_approve">Ocultar Post</a>{/if}
			{if $tsUser->is_admod || $tsUser->permisos.moedpo || $tsAutor.user_id == $tsUser->uid}<a href="{$tsConfig.url}/posts/editar/{$tsPost.post_id}" class="btn btn-sm edit">Editar</a>{/if}
			{if $tsUser->is_admod || $tsUser->permisos.moep || $tsAutor.user_id == $tsUser->uid}<a href="#" onclick="{if $tsAutor.user_id != $tsUser->uid}mod.posts.borrar({$tsPost.post_id}, 'posts', null);{else}borrar_post();{/if} return false;" class="btn btn-sm delete">Borrar</a>{/if}
		</div>
		<div id="desapprove" style="display:none;">
			<span style="display:none;" class="text-error errormsg"></span>
			<div class="input-group">
				<input type="text" id="d_razon" name="d_razon" maxlength="150" size="60" class="form-input" placeholder="Raz&oacute;n de la revisi&oacute;n" / required>
				<input type="button" class="btn btn-primary input-group-btn btnDelete" name="desapprove" value="Continuar" href="#" onclick="mod.posts.ocultar('{$tsPost.post_id}'); return false;"/>
			</div>
		</div>	
		{/if}
		<span class="p-2">{$tsPost.post_body}</span>
		
		{if $tsPost.user_firma && $tsConfig.c_allow_firma}
		
		<hr class="divider" />
		
		<span>
			
			{$tsPost.user_firma}
			
		</span>
		
		{/if}
		
		<div class="spectre-social">
	      {* COMPARTIR EN FACEBOOK *}
	      <a class="social-btn facebook" onclick="RedSocial('https://www.facebook.com/sharer/sharer.php?u={$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/{$tsPost.post_id}/{$tsPost.post_title|seo}.html');" alt="Facebook"></a>
	      {* COMPARTIR EN TWITTER *}
	      <a class="social-btn twitter" onclick="RedSocial('https://twitter.com/intent/tweet?url={$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/{$tsPost.post_id}/{$tsPost.post_title|seo}.html&text=Te invito a ver este post');" alt="Twitter"></a>
	      {* COMPARTIR A MIS SEGUIDORES *}
	      <a class="social-btn lni-share-alt"{if $tsUser->is_member}onclick="notifica.sharePost({$tsPost.post_id});"{else}href="{$tsConfig.url}/registro/"{/if}><!-- <span>{$tsPost.post_shared}</span> --></a>
	   </div>
		<center>
			{include file='modules/m.global_ads_728.tpl'}
		</center>
		
	</div>
	
	{include file='modules/m.posts_metadata.tpl'}
	
