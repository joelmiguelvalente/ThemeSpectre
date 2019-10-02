<section class="navbar-section">
   {if $tsPage == '' || $tsPage == 'home' || $tsPage == 'posts' || $tsPage == 'admin'}
      <a class="btn btn-link{if $tsPage == 'home' || $tsPage == 'portal'} text-success{/if}" title="Inicio" href="{$tsConfig.url}/{if $tsPage == 'home' || $tsPage == 'posts'}posts/{/if}">Inicio</a>
      <a class="btn btn-link{if $tsPage == 'buscador'} text-success{/if}" title="Buscador" href="{$tsConfig.url}/buscador/">Buscador</a>
      {if $tsUser->is_member}
         {if $tsUser->is_admod || $tsUser->permisos.gopp}
            <a class="btn btn-link{if $tsSubmenu == 'agregar'} text-success{/if}" title="Agregar Post" href="{$tsConfig.url}/agregar/">Agregar Post</a>
         {/if}
         <a class="btn btn-link{if $tsPage == 'mod-history'} text-success{/if}" title="Historial de Moderaci&oacute;n" href="{$tsConfig.url}/mod-history/">Historial</a>
         {if $tsUser->is_admod || $tsUser->permisos.moacp}
            <a class="btn btn-link{if $tsPage == 'moderacion'} text-success{/if}" title="Panel de Moderador" href="{$tsConfig.url}/moderacion/">Moderaci&oacute;n {if $tsConfig.c_see_mod && $tsConfig.novemods.total}<span class="cadGe cadGe_{if $tsConfig.novemods.total < 10}green{elseif $tsConfig.novemods.total < 30}purple{else}red{/if}" style="position:relative;">{$tsConfig.novemods.total}</span>{/if}</a>
         {/if}
      {/if}
   {elseif $tsPage == 'fotos'}
      <a class="btn btn-link{if $tsAction == '' && $tsAction != 'agregar' && $tsAction != 'album' && $tsAction != 'favoritas' || $tsAction == 'ver'} text-success{/if}" href="{$tsConfig.url}/fotos/">Inicio</a>
      {if $tsAction == 'album' && $tsFUser.0 != $tsUser->uid}
         <a class="btn btn-link text-success" href="{$tsConfig.url}/fotos/{$tsFUser.1}">&Aacute;lbum de {$tsFUser.1}</a>
      {/if}
      {if $tsUser->is_admod || $tsUser->permisos.gopf}
         <a class="btn btn-link{if $tsAction == 'agregar'} text-success{/if}" href="{$tsConfig.url}/fotos/agregar.php">Agregar Foto</a>
      {/if}
         <a class="btn btn-link{if $tsAction == 'album' && $tsFUser.0 == $tsUser->uid} text-success{/if}" href="{$tsConfig.url}/fotos/{$tsUser->nick}">Mis Fotos</a>
   {elseif $tsPage == 'tops'}
      <a class="btn btn-link{if $tsAction == 'posts'} text-success{/if}" href="{$tsConfig.url}/top/posts/">Posts</a>
      <a class="btn btn-link{if $tsAction == 'usuarios'} text-success{/if}" href="{$tsConfig.url}/top/usuarios/">Usuarios</a>
      <a class="btn btn-link{if $tsAction == 'fotos'} text-success{/if}" href="{$tsConfig.url}/top/fotos/">Fotos</a>
   {/if}
</section>
{if !$tsPage == 'agregar'}
<section class="navbar-section">
   {include 'sections/head_categorias.tpl' nocache}
</section>
{/if}