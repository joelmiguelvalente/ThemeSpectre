<!--PUNTOS-->
<div class="column col-6">
      <ul class="tab">
         <li class="tab-item active"><a href="#">Top post con m&aacute;s puntos</a></li>
      </ul>
   <div class="boxy-content">
      {if !$tsTops.puntos}<div class="emptyData">Nada por aqui</div>
      {else}
         {foreach from=$tsTops.puntos item=p}
         <div class="tile tile-centered">
            <div class="tile-icon tooltip" title="{$p.c_nombre}">
               <div class="random-tile-icon">
                  {$p.c_nombre|truncate:2:''}
               </div>
            </div>
            <div class="tile-content">
               <div class="tile-title"><a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:45}</a></div>
               <small class="tile-subtitle text-gray">Puntos: {$p.post_puntos}</small>
            </div>
         </div>
         {/foreach}
      {/if}
   </div>
</div>
<!--SEGUIDORES-->
<div class="column col-6">
      <ul class="tab">
         <li class="tab-item active"><a href="#">Top post m&aacute;s favoritos</a></li>
      </ul>
   <div class="boxy-content">
      {if !$tsTops.favoritos}<div class="emptyData">Nada por aqui</div>
      {else}
         {foreach from=$tsTops.favoritos item=p}
         <div class="tile tile-centered">
            <div class="tile-icon tooltip" title="{$p.c_nombre}">
               <div class="random-tile-icon">
                  {$p.c_nombre|truncate:2:''}
               </div>
            </div>
            <div class="tile-content">
               <div class="tile-title"><a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:45}</a></div>
               <small class="tile-subtitle text-gray">Favoritos: {$p.post_favoritos}</small>
            </div>
         </div>
         {/foreach}
      {/if}
   </div>
</div>
<!--COMENTARIOS-->
<div class="column col-6">
      <ul class="tab">
         <li class="tab-item active"><a href="#">Top post m&aacute;s comentado</a></li>
      </ul>
   <div class="boxy-content">
      {if !$tsTops.comments}<div class="emptyData">Nada por aqui</div>
      {else}
         {foreach from=$tsTops.comments item=p}
         <div class="tile tile-centered">
            <div class="tile-icon tooltip" title="{$p.c_nombre}">
               <div class="random-tile-icon">
                  {$p.c_nombre|truncate:2:''}
               </div>
            </div>
            <div class="tile-content">
               <div class="tile-title"><a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:45}</a></div>
               <small class="tile-subtitle text-gray">Comentarios: {$p.post_comments}</small>
            </div>
         </div>
         {/foreach}
      {/if}
   </div>
</div>

<!--SEGUIDORES-->
<div class="column col-6">
      <ul class="tab">
         <li class="tab-item active"><a href="#">Top post con m&aacute;s seguidores</a></li>
      </ul>
   <div class="boxy-content">
      {if !$tsTops.seguidores}<div class="emptyData">Nada por aqui</div>
      {else}
         {foreach from=$tsTops.seguidores item=p}
         <div class="tile tile-centered">
            <div class="tile-icon tooltip" title="{$p.c_nombre}">
               <div class="random-tile-icon">
                  {$p.c_nombre|truncate:2:''}
               </div>
            </div>
            <div class="tile-content">
               <div class="tile-title"><a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:45}</a></div>
               <small class="tile-subtitle text-gray">Seguidores: {$p.post_seguidores}</small>
            </div>
         </div>
         {/foreach}
      {/if}
   </div>
</div>