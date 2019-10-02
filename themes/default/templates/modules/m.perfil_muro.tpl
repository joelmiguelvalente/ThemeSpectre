<div id="perfil_wall" status="activo">
   <script type="text/javascript">
   muro.stream.total = {$tsMuro.total};
   </script>
   {if $tsGeneral.fotos_total > 0}
   <div id="perfil-foto-bar">
      <ul>
         {foreach from=$tsGeneral.fotos item=f key=i}
            {if $f.foto_id}
            <li>
               <a href="{$tsConfig.url}/fotos/{$tsInfo.nick}/{$f.foto_id}/{$f.f_title|seo}.html" title="{$f.f_title}">
                  <img src="{$f.f_url}"/>
               </a>
            </li>
            {/if}
          {/foreach}
      </ul>
   </div>
   {/if}
   <div id="perfil-form" class="widget">
      {if $tsPrivacidad.mf.v == true}
      {include file='modules/m.perfil_muro_form.tpl'}
      {else}
      <div class="emptyData" style="border-top:none">{$tsPrivacidad.mf.m}</div>
      {/if}
   </div>
   <div class="widget clearfix" id="perfil-wall">
      <div id="wall-content">
         {include file='modules/m.perfil_muro_story.tpl'}
      </div>
      <!-- more -->
      {if $tsMuro.total >= 10}
      <div class="more-pubs">
         <div class="content">
            <a href="#" onclick="muro.stream.loadMore('wall'); return false;" class="a_blue">Publicaciones m&aacute;s antiguas</a>
            <span><span class="loading loading-lg"></span></span>
         </div>
      </div>
      {elseif $tsMuro.total == 0 && $tsUser->is_member}
      <div class="emptyData">Este usuario no tiene comentarios, se el primero.</div>
      {/if}
   </div>
</div>