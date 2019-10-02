{include file='sections/main_header.tpl'}
<link rel="stylesheet" href="{$tsConfig.css}/fotos.css">
<script type="text/javascript" src="{$tsConfig.js}/fotos.js?{$smarty.now}"></script>
<div class="columns">
	{if $tsAction == ''}
		<div class="column col-8">{include file='modules/m.fotos_home_content.tpl'}</div>
		<div class="column col-4">{include file='modules/m.fotos_home_sidebar.tpl'}</div>
	{elseif $tsAction == 'agregar' || $tsAction == 'editar'}
		<div class="column col-9">{include file='modules/m.fotos_add_form.tpl'}</div>
		<div class="column col-3">{include file='modules/m.fotos_add_sidebar.tpl'}</div>
	{elseif $tsAction == 'ver'}
		<div class="column col-3">{include file='modules/m.fotos_ver_left.tpl'}</div>
		<div class="column col-6">{include file='modules/m.fotos_ver_content.tpl'}</div>
		<div class="column col-3">{include file='modules/m.fotos_ver_right.tpl'}</div>
	{elseif $tsAction == 'album'}
		<div class="column col">{include file='modules/m.fotos_album.tpl'}</div>
	{elseif $tsAction == 'favoritas'}
		<div class="emptyData">En construcci&oacute;n</div>
	{/if}
</div>
{include file='sections/main_footer.tpl'}