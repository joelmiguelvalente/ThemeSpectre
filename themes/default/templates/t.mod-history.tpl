{include file='sections/main_header.tpl'}

<div class="btn-group btn-group-block">
  <button class="btn btn-{if $tsAction == ''}success{else}primary{/if}" onclick="location.href = '{$tsConfig.url}/mod-history/'">Posts</button>
  <button class="btn btn-{if $tsAction == 'fotos'}success{else}primary{/if}" onclick="location.href = '{$tsConfig.url}/mod-history/fotos/'">Fotos</button>
</div> 

<div id="resultados">
   {if !$tsAction || $tsAction == 'posts'}
   <table class="table">
      <thead>
         <tr>
            <th>Post</th>
            <th>Acci&oacute;n</th>
            <th>Moderador</th>
            <th>Causa</th>
         </tr>
      </thead>
      <tbody>
         {foreach from=$tsHistory item=h}
         <tr>
            <td style="text-align: left;">
               {$h.post_title}<br/>
               Por <a href="{$tsConfig.url}/perfil/{$h.user_name}">{$h.user_name}</a>
            </td>
            <td>
               {if $h.action == 1}
               <span class="color_green">Editado</span>
               {elseif $h.action == 2}
               <span class="color_red">Eliminado</span>
               {else}
               <span style="color:purple;">Revisi&oacute;n</span>
               {/if}
            </td>
            <td>
               <a href="{$tsConfig.url}/perfil/{$h.mod_name}">{$h.mod_name}</a>
            </td>
            <td>{if $h.reason == 'undefined'}Indefinida{else}{$h.reason}{/if}</td>
         </tr>
         {/foreach}
      </tbody>
   </table>
   {elseif $tsAction == 'fotos'}
   <table class="table">
      <thead>
         <tr>
            <th>Foto</th>
            <th>Acci&oacute;n</th>
            <th>Moderador</th>
            <th>Causa</th>
         </tr>
      </thead>
      <tbody>
         {foreach from=$tsHistory item=h}
         <tr>
            <td style="text-align: left;">
               {$h.f_title}<br/>
               Por <a href="{$tsConfig.url}/perfil/{$h.user_name}">{$h.user_name}</a>
            </td>
            <td>
               {if $h.action == 1}
               <span class="color_green">Editada</span>
               {else}
               <span class="color_red">Eliminada</span>
               {/if}
            </td>
            <td>
               <a href="{$tsConfig.url}/perfil/{$h.mod_name}">{$h.mod_name}</a>
            </td>
            <td>{if $h.reason == 'undefined'}Indefinida{else}{$h.reason}{/if}</td>
         </tr>
         {/foreach}
      </tbody>
   </table>
   {/if}
</div>
<div style="clear:both"></div>
{include file='sections/main_footer.tpl'}