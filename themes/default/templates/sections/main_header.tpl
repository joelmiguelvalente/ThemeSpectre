<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es" xml:lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>{$tsTitle}</title>
{foreach from=Spectre item=s}
<link rel="stylesheet" href="{$s}" />
{/foreach}
<link href="{$tsConfig.tema.t_url}/global.css?{$smarty.now}" rel="stylesheet" type="text/css" />
<link href="{$tsConfig.tema.t_url}/wysibb/wysibb.css" rel="stylesheet" type="text/css" />

<meta property="og:title" content="{if $tsPage == 'posts'}{$tsPost.post_title}{elseif $tsPage == 'fotos'}{else}{$tsConfig.titulo}{/if}" />
<meta property="og:type" content="{if $tsPage == 'posts'}website{else}article{/if}" />
<meta property="og:url" content="{$tsConfig.url}{if $tsPage == 'posts'}/posts/{$tsPost.categoria.c_seo}/{$tsPost.post_id}/{$tsPost.post_title|seo}.htm{elseif $tsPage == 'fotos'}{/if}" />
<meta property="og:locale" content="es_ES" />
<meta property="og:locale:alternate" content="es_ES" />
<meta property="og:description" content="{if $tsPage == 'posts'}{$tsPost.post_body|strip_tags|regex_replace:"/[\r\t\n]/":" "|truncate:160|strip:' '}{elseif $tsPage == 'fotos'}{else}{$tsConfig.slogan}{/if}">
<meta property="og:image" content="{if $tsPage == 'posts'}{$tsConfig.url}/files/avatar/{$tsAutor.user_id}_120.jpg{elseif $tsPage == 'fotos'}{else}Miguel92{/if}" />
<meta name="article:author" content="{if $tsPage == 'posts'}{$tsAutor.user_name}{elseif $tsPage == 'fotos'}{else}Miguel92{/if}">
<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="@{$tsConfig.titulo|replace:' ':'_'}">
<meta name="twitter:creator" content="@Miguel92">
<link rel="shortcut icon" href="{LogoIco}">
<link rel="icon" href="{LogoPng}">

{if $tsUser->is_admod && $tsConfig.c_see_mod && $tsConfig.novemods.total}
<!-- AGREGAMOS ESTILO DE MODERACIÓN SI HAY CONTENIDO PARA REVISAR -->
<link href="{$tsConfig.tema.t_url}/css/moderacion.css" rel="stylesheet" type="text/css" />
<div id="stickymsg" onmouseover="$('#brandday').css('opacity',0.5);" onmouseout="$('#brandday').css('opacity',1);" onclick="location.href = '{$tsConfig.url}/moderacion/'" style="cursor:default;">Hay {$tsConfig.novemods.total} contenido{if $tsConfig.novemods.total != 1}s{/if} esperando revisi&oacute;n</div>
{/if}
<script src="{$tsConfig.js}/jquery.min.js" type="text/javascript"></script>
<script src="{$tsConfig.js}/jquery.plugins.js?{$smarty.now}" type="text/javascript"></script>
<script src="{$tsConfig.js}/acciones.js?{$smarty.now}" type="text/javascript"></script>
<script src="{$tsConfig.js}/funciones.js?{$smarty.now}" type="text/javascript"></script>
<script src="{$tsConfig.tema.t_url}/wysibb/wysibb.js?{$smarty.now}" type="text/javascript"></script>
{if $tsUser->is_admod || $tsUser->permisos.moacp || $tsUser->permisos.most || $tsUser->permisos.moayca || $tsUser->permisos.mosu || $tsUser->permisos.modu || $tsUser->permisos.moep || $tsUser->permisos.moop || $tsUser->permisos.moedcopo || $tsUser->permisos.moaydcp || $tsUser->permisos.moecp}
<script src="{$tsConfig.js}/moderacion.js" type="text/javascript"></script>
{/if}
{if $tsConfig.c_allow_live}
<link href="{$tsConfig.css}/live.css" rel="stylesheet" type="text/css" />
<script src="{$tsConfig.js}/live.js?{$smarty.now}" type="text/javascript"></script>
{/if}
<script type="text/javascript">
// {literal}
var global_data={
// {/literal}
	user_key:'{$tsUser->uid}',
	postid:'{$tsPost.post_id}',
	fotoid:'{$tsFoto.foto_id}',
	img:'{$tsConfig.tema.t_url}/',
	url:'{$tsConfig.url}',
	domain:'{$tsConfig.domain}',
  s_title: '{$tsConfig.titulo}',
  s_slogan: '{$tsConfig.slogan}',
  active: '{$tsConfig.c_recaptcha}'
// {literal}
};
// {/literal} {literal}
$(document).ready(function(){
// {/literal}
    {if $tsNots > 0} 
	notifica.popup({$tsNots});
    {/if}
    {if $tsMPs > 0 &&  $tsAction != 'leer'}
    mensaje.popup({$tsMPs});
    {/if}
    {if $tsNots + $tsMPs}
    // {literal}
      var favicon = new Favico({
         animation:'pop'
      });
     // {/literal}
      favicon.badge({$tsNots + $tsMPs});
    {/if}
// {literal}
});
//	{/literal}
</script>
{if !$tsUser->is_member && $tsConfig.c_recaptcha == 1}
<script src="https://www.google.com/recaptcha/api.js?render={RC_PUK}"></script>
{/if}
</head>

<body>
{if $tsUser->is_admod == 1}{$tsConfig.install}{/if}
<!--JAVASCRIPT-->

<div id="loading" style="display:none"></div>
<div id="swf"></div>
<div id="js" style="display:none"></div>
<div id="mask"></div>
<div id="mydialog"></div>
<div class="UIBeeper" id="BeeperBox"></div>
<div id="brandday">
   
   {include 'sections/head_menu.tpl' nocache}
   <div class="hero header">
      <div class="hero-body">
         <h1>{$tsConfig.titulo}</h1>
         <p>{$tsConfig.slogan}</p>
      </div>
   </div>
   <div class="container" id="container">
     <nav class="navbar">
        {include 'sections/head_submenu.tpl' nocache}
     </nav>

