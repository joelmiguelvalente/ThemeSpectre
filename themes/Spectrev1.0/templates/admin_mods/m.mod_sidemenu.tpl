<script type="text/javascript">
var action_menu = '{$tsAction}';
//{literal} <-- no borrar
$(function(){
	if(action_menu != '') $('#a_' + action_menu).addClass('active');
	else $('#a_main').addClass('active');
});
// {/literal}
</script>
<ul class="nav">
   <li class="nav-item">
      <a href="#">Principal</a>
      <ul class="nav">
         <li class="nav-item" id="a_main"><a href="{$tsConfig.url}/moderacion/">Centro de Moderaci&oacute;n</a></li>
      </ul>
	</li>
   <li class="nav-item">
      <a href="#">Denuncias</a>
      <ul class="nav">
         <li class="nav-item" id="a_posts"><a href="{$tsConfig.url}/moderacion/posts">Post <span class="label label-{if $tsConfig.novemods.repposts > 15}red{elseif $tsConfig.novemods.repposts > 5}purple{else}green{/if}">{$tsConfig.novemods.repposts}</span></a></li>
      </ul>
      <ul class="nav">
         <li class="nav-item" id="a_fotos"><a href="{$tsConfig.url}/moderacion/fotos">Fotos <span class="label label-{if $tsConfig.novemods.repfotos > 15}red{elseif $tsConfig.novemods.repfotos > 5}purple{else}green{/if}">{$tsConfig.novemods.repfotos}</span></a></li>
      </ul>
      <ul class="nav">
         <li class="nav-item" id="a_mps"><a href="{$tsConfig.url}/moderacion/mps">Mensajes <span class="label label-{if $tsConfig.novemods.repmps > 15}red{elseif $tsConfig.novemods.repmps > 5}purple{else}green{/if}">{$tsConfig.novemods.repmps}</span></a></li>
      </ul>
      <ul class="nav">
         <li class="nav-item" id="a_users"><a href="{$tsConfig.url}/moderacion/users">Usuarios <span class="label label-{if $tsConfig.novemods.repusers > 15}red{elseif $tsConfig.novemods.repusers > 5}purple{else}green{/if}">{$tsConfig.novemods.repusers}</span></a></li>
      </ul>
	</li>
	{if $tsUser->is_admod || $tsUser->permisos.movub || $tsUser->permisos.moub}
   <li class="nav-item">
      <a href="#">Gesti&oacute;n</a>
      <ul class="nav">
      	{if $tsUser->is_admod || $tsUser->permisos.movub}
         	<li class="nav-item" id="a_banusers"><a href="{$tsConfig.url}/moderacion/banusers">Usuarios suspendidos <span class="label label-{if $tsConfig.novemods.supusers > 15}red{elseif $tsConfig.novemods.suspusers > 5}purple{else}green{/if}">{$tsConfig.novemods.suspusers}</span></a></span></a></li>
         {/if}{if $tsUser->is_admod || $tsUser->permisos.moub}
         	<li class="nav-item" id="a_buscador"><a href="{$tsConfig.url}/moderacion/buscador">Buscador de Contenido</a></span></a></li>
         {/if}
      </ul>
	</li>
	{/if}
	{if $tsUser->is_admod || $tsUser->permisos.morp || $tsUser->permisos.morf}
   <li class="nav-item">
      <a href="#">Papelera de Reciclaje</a>
      <ul class="nav">
      	{if $tsUser->is_admod || $tsUser->permisos.morp}
         	<li class="nav-item" id="a_pospelera"><a href="{$tsConfig.url}/moderacion/pospelera">Post eliminados <span class="label label-{if $tsConfig.novemods.pospelera > 15}red{elseif $tsConfig.novemods.pospelera > 5}purple{else}green{/if}">{$tsConfig.novemods.pospelera}</span></a></li>
         {/if}{if $tsUser->is_admod || $tsUser->permisos.morf}
         	<li class="nav-item" id="a_fopelera"><a href="{$tsConfig.url}/moderacion/fopelera">Fotos eliminadas <span class="label label-{if $tsConfig.novemods.fospelera > 15}red{elseif $tsConfig.novemods.fospelera > 5}purple{else}green{/if}">{$tsConfig.novemods.fospelera}</span></a></li>
         {/if}
      </ul>
	</li>
	{/if}
	{if $tsUser->is_admod || $tsUser->permisos.mocp || $tsUser->permisos.mocc}
   <li class="nav-item">
      <a href="#">Contenido desaprobado</a>
      <ul class="nav">
      	{if $tsUser->is_admod || $tsUser->permisos.mocp}
         	<li class="nav-item" id="a_revposts"><a href="{$tsConfig.url}/moderacion/revposts">Posts <span class="label label-{if $tsConfig.novemods.revposts > 15}red{elseif $tsConfig.novemods.revposts > 5}purple{else}green{/if}">{$tsConfig.novemods.revposts}</span></a></li>
         {/if}{if $tsUser->is_admod || $tsUser->permisos.mocc}
         	<li class="nav-item" id="a_comentarios"><a href="{$tsConfig.url}/moderacion/comentarios">Comentarios <span class="label label-{if $tsConfig.novemods.revcomentarios > 15}red{elseif $tsConfig.novemods.revcomentarios > 5}purple{else}green{/if}">{$tsConfig.novemods.revcomentarios}</span></a></li>
         {/if}
      </ul>
	</li>
	{/if}
</ul>