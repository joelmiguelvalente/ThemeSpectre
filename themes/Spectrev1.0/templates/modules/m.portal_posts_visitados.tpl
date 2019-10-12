<div class="box">
   <ul class="tab">
      <li class="tab-item active"><a href="#">&Uacute;ltimos posts visitados</a></li>
   </ul>
   <div class="box_cuerpo">
      <ul>
      {if $tsLastPostsVisited}
         {foreach from=$tsLastPostsVisited item=p}
            {if $p.post_title}
               <div class="tile tile-centered" onclick="location.href='{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html'" style="cursor:pointer;">
                  <div class="tile-icon">
                     <div class="random-tile-icon">
                        {$p.c_nombre|truncate:1:''}
                     </div>
                  </div>
                  <div class="tile-content">
                     <div class="tile-title{if $p.post_private} privado{/if}">{$p.post_title|truncate:40}</div>
                     <small class="tile-subtitle text-gray">{$p.post_date|date_format:"%e %b, %Y"|replace:".":""}</small>
                  </div>
               </div>
            {/if}
         {/foreach}
      {else}
         <li class="emptyData">No has visitado posts recientemente.</li>
      {/if}
      </ul>
   </div>
</div>