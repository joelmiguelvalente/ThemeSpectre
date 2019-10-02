{include file='sections/main_header.tpl'}
<link rel="stylesheet" href="{$tsConfig.css}/perfil.css?{$smarty.now}">
<script type="text/javascript" src="{$tsConfig.js}/perfil.js?{$smarty.now}"></script>

<div class="perfil-main columns {$tsGeneral.stats.user_rango.1}">
   <div class="perfil-content general column col-8">
      <div id="info" pid="{$tsInfo.uid}"></div>
      <div id="perfil_content">
         {if $tsPrivacidad.m.v == false}
         <div id="perfil_wall" status="activo" class="widget">
            <div class="emptyData">{$tsPrivacidad.m.m}</div>
            <script type="text/javascript">
            perfil.load_tab('info', $('#informacion'));
            </script>
         </div>
         {elseif $tsType == 'story'}
         {include file='modules/m.perfil_story.tpl' nocache}
         {elseif $tsType == 'news'}
         {include file='modules/m.perfil_noticias.tpl'}
         {else}
         {include file='modules/m.perfil_muro.tpl' nocache}
         {/if}
      </div>
      <div style="width:100%;text-align:center;display:none" id="perfil_load"><div class="loading"></div></div>
   </div>
   <div class=" column col-4">
      {include file='modules/m.perfil_sidebar.tpl'}
   </div>
</div>

{include file='sections/main_footer.tpl'}