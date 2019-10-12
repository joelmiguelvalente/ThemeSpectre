{include file='sections/main_header.tpl'}
<link rel="stylesheet" href="{$tsConfig.css}/moderacion.css?{$smarty.now}">
<script type="text/javascript" src="{$tsConfig.js}/moderacion.js?{$smarty.now}"></script>
<div id="borradores" class="columns">
   <div class="column col-3">
      <div class="boxy-content" id="admin_menu">
         {include file='admin_mods/m.mod_sidemenu.tpl'}
      </div><!-- boxy-content -->
      {if $tsAction == 'buscador' && $tsAct == 'search'}
         {include file='admin_mods/m.mod_buscador_stats.tpl'}
      {/if}
   </div>
   <div class="column col-9">
      <div class="boxy" id="admin_panel">
         {* Q WEBA PERO NO HAY DE OTRA xD*}
         {if $tsAction == ''}
         {include file='admin_mods/m.mod_welcome.tpl'}
         {elseif $tsAction == 'posts'}
         {include file='admin_mods/m.mod_report_posts.tpl'}
         {elseif $tsAction == 'fotos'}
         {include file='admin_mods/m.mod_report_fotos.tpl'}
         {elseif $tsAction == 'mps'}
         {include file='admin_mods/m.mod_report_mps.tpl'}
         {elseif $tsAction == 'users'}
         {include file='admin_mods/m.mod_report_users.tpl'}
         {elseif $tsAction == 'banusers'}
         {if $tsUser->is_admod || $tsUser->permisos.movub}{include file='admin_mods/m.mod_ban_users.tpl'}{/if}
         {elseif $tsAction == 'pospelera'}
         {if $tsUser->is_admod || $tsUser->permisos.morp}{include file='admin_mods/m.mod_papelera_posts.tpl'}{/if}
         {elseif $tsAction == 'fopelera'}
         {if $tsUser->is_admod || $tsUser->permisos.morf}{include file='admin_mods/m.mod_papelera_fotos.tpl'}{/if}
         {elseif $tsAction == 'buscador'}
         {if $tsUser->is_admod || $tsUser->permisos.moub}{include file='admin_mods/m.mod_buscador.tpl'}{/if}
         {elseif $tsAction == 'comentarios'}
         {if $tsUser->is_admod || $tsUser->permisos.mocc}{include file='admin_mods/m.mod_revision_comentarios.tpl'}{/if}
         {elseif $tsAction == 'revposts'}
         {if $tsUser->is_admod || $tsUser->permisos.mocp}{include file='admin_mods/m.mod_revision_posts.tpl'}{/if}
         {/if}
      </div>
   </div>
</div>
{include file='sections/main_footer.tpl'}