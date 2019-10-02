<div>
	<h3>últimas fotos</h3>
	<div class="columns">
		{foreach from=$tsLastFotos.data item=f}
			<div class="column col-3">
				<div class="pic">
					<time class="label label-success">{$f.f_date|date_format:"%d %b %Y"|replace:".":","}</time>
				  	<div class="pic-image"{if $f.f_status != 0 || $f.user_activo == 0 || $f.user_baneado == 1} alt="{if $f.f_status == 2}Imagen eliminada{elseif $f.f_status == 1}Imagen oculta por acumulaci&oacute;n de denuncias{elseif $f.user_activo == 0}La cuenta del usuario est&aacute; desactivada{elseif $f.user_baneado == 1}La cuenta del usuario est&aacute; suspendida{/if}" style="border: 1px solid {if $f.f_status == 2}rosyBrown{elseif $f.f_status == 1}coral{elseif $f.user_activo == 0}brown{elseif $f.user_baneado == 1}orange{/if};opacity: 0.5;filter: alpha(opacity=50);"{/if}>
				    	<img src="{$f.f_url}" class="img-responsive" onclick="location.href='{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html'">
				  	</div>
				  	<div class="pic-header">
				    	<div class="pic-title h5"><a href="{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html">{$f.f_title|truncate:22}</a></div>
				    	<div class="pic-subtitle text-gray">Por <a href="{$tsConfig.url}/perfil/{$f.user_name}">{$f.user_name}</a></div>
				  	</div>
				</div>
			</div>
		{/foreach}
	</div>
	{if $tsLastFotos.data > 10}P&aacute;ginas: {$tsLastFotos.pages}{/if}
</div>