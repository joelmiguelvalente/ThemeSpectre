<div class="box">
   <div class="categoriaList">
      <h6>Fotos de {$tsFoto.user_name}</h6>
      <div id="v_album" class="columns">
         {foreach from=$tsUFotos item=f}
         <div class="column col-6">
            <a href="{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html">
               <img src="{$f.f_url}" title="{$f.f_title}" />
               <span class="label label-error">{$f.f_date|date_format:"%d/%m/%Y"}</span>
            </a>
         </div>
         {/foreach}
      </div>
      <a href="{$tsConfig.url}/fotos/{$tsFoto.user_name}" class="fb_foot">Ver todas</a>
   </div>
   <center>{$tsConfig.ads_160}</center>
</div>