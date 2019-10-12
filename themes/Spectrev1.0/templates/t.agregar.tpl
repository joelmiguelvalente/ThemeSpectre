{include file='sections/main_header.tpl'}
<style>
	.wysibb-text-editor.wysibb-body {
		width: 100% !important;
	}
</style>
<div style="display:none" id="preview"></div>
{include file='modules/m.agregar_javascript.tpl'}
{if $tsUser->is_admod || $tsUser->permisos.gopp}
	<form action="{$tsConfig.url}/agregar.php{if $tsAction == 'editar'}?action=editar&pid={$tsPid}{/if}" method="post" name="newpost" autocomplete="off">
		<div id="form_div" class="columns">
			<div class="column col-8">{include file='modules/m.agregar_form.tpl'}</div>
			<div class="column col-4">{include file='modules/m.agregar_sidebar.tpl'}</div>	
		</div>
	</form>
{else}
	<div class="emptyData clearfix">
	   Lo sentimos, pero no puedes publicar un nuevo post.
	</div>
{/if}
{include file='sections/main_footer.tpl'}