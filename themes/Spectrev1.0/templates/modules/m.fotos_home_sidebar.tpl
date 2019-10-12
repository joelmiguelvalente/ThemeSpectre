<div>
   <h3>Últimos comentarios</h3>
   {foreach from=$tsLastComments item=c}
   <div class="tile tile-centered">
      <div class="tile-icon">
         <div class="purple-tile-icon">
            <i class="lni-comment"></i>
         </div>
      </div>
      <div class="tile-content">
         <div class="tile-title"><a href="{$tsConfig.url}/fotos/{$c.user_name}/{$c.foto_id}/{$c.f_title|seo}.html#div_cmnt_{$c.cid}">{$c.f_title}</a></div>
         <small class="tile-subtitle text-gray">{if $tsUser->is_admod && $tsConfig.c_see_mod == 1 && $tsFoto.f_status != 0 || $tsFoto.user_activo == 0}<span style="color: {if $c.user_activo == 0} brown {elseif $c.f_status == 1} purple {elseif $c.f_status == 2} red{/if};" class="qtip" title="{if $c.user_activo == 0}El autor del comentario tiene la cuenta desactivada {elseif $c.f_status == 1} La foto se encuentra oculta {elseif $c.f_status == 2} La foto se encuentra eliminada{/if}">{/if}{$tsUser->getUsername($c.c_user)}{if $c.user_activo == 0 || $c.f_status != 0 && $tsUser->is_admod}</span>{/if}</small>
      </div>
   </div>
   {/foreach}
</div>

{include 'modules/m.global_ads_300.tpl'}

<div>
   <h3>Estad&iacute;sticas</h3>
   <ul class="picstats">
      <li><b>{$tsStats.stats_miembros|kmg}</b>Miembros</li>
      <li><b>{$tsStats.stats_fotos|kmg}</b>Fotos</li>
      <li><b>{$tsStats.stats_foto_comments|kmg}</b>Comentarios</li>
   </ul>
</div>