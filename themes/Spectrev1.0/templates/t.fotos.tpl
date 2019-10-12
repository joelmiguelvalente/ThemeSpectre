{include file='sections/main_header.tpl'}
<link rel="stylesheet" href="{$tsConfig.css}/fotos.css?{$smarty.now}">
<script type="text/javascript" src="{$tsConfig.js}/fotos.js?{$smarty.now}"></script>
<div class="columns">
	{if $tsAction == ''}
		<div class="column col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-8 col-8">{include file='modules/m.fotos_home_content.tpl'}</div>
		<div class="column col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 col-4">{include file='modules/m.fotos_home_sidebar.tpl'}</div>
	{elseif $tsAction == 'agregar' || $tsAction == 'editar'}
		<div class="column col-xs-12 col-sm-12 col-md-12 col-lg-9 col-xl-9 col-9">{include file='modules/m.fotos_add_form.tpl'}</div>
		<div class="column col-xs-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 col-3">{include file='modules/m.fotos_add_sidebar.tpl'}</div>
	{elseif $tsAction == 'ver'}
		<div class="column col-xs-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 col-3">{include file='modules/m.fotos_ver_left.tpl'}</div>
		<div class="column column col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 col-6">{include file='modules/m.fotos_ver_content.tpl'}</div>
		<div class="column col-xs-12 col-sm-12 col-md-12 col-lg-3 col-xl-3 col-3">{include file='modules/m.fotos_ver_right.tpl'}</div>
	{elseif $tsAction == 'album'}
		<div class="column col">{include file='modules/m.fotos_album.tpl'}</div>
	{elseif $tsAction == 'favoritas'}
		<div class="emptyData">En construcci&oacute;n</div>
	{/if}
</div>
{include file='sections/main_footer.tpl'}