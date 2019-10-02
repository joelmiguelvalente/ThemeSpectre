   <!--PUNTOS-->
   <div class="column col-6">
      <ul class="tab">
         <li class="tab-item active"><a href="#">Top fotos con m&aacute;s  votos positivos</a></li>
      </ul>
      <div class="body">
         {if !$tsTops.votos_pos}<div class="emptyData">Nada por aqui</div>
         {else}
            {foreach from=$tsTops.votos_pos item=f}
            <div class="tile tile-centered">
               <div class="tile-icon">
                  <figure class="avatar avatar-sm">
                    <img src="{$f.f_url}" alt="{$f.f_title}">
                  </figure>
               </div>
               <div class="tile-content">
                  <div class="tile-title"><a href="{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html">{$f.f_title}</a></div>
                  <small class="tile-subtitle text-gray">Votos positivos: {$f.total|kmg}</small>
               </div>
            </div>
            {/foreach}
         {/if}
      </div>
   </div>
   <div class="column col-6">
      <ul class="tab">
         <li class="tab-item active"><a href="#">Top fotos con m&aacute;s  votos negativos</a></li>
      </ul>
      <div class="body">
         {if !$tsTops.votos_neg}<div class="emptyData">Nada por aqui</div>
         {else}
            {foreach from=$tsTops.votos_neg item=f}
            <div class="tile tile-centered">
               <div class="tile-icon">
                  <figure class="avatar avatar-sm">
                    <img src="{$f.f_url}" alt="{$f.f_title}">
                  </figure>
               </div>
               <div class="tile-content">
                  <div class="tile-title"><a href="{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html">{$f.f_title}</a></div>
                  <small class="tile-subtitle text-gray">Votos negativos: {$f.total|kmg}</small>
               </div>
            </div>
            {/foreach}
         {/if}
      </div>
   </div>
   <!--VISITAS-->
   <div class="column col-6">
      <ul class="tab">
         <li class="tab-item active"><a href="#">Top fotos con m&aacute;s visitas</a></li>
      </ul>
      <div class="body">
         {if !$tsTops.visitas}<div class="emptyData">Nada por aqui</div>
         {else}
            {foreach from=$tsTops.visitas item=f}
            <div class="tile tile-centered">
               <div class="tile-icon">
                  <figure class="avatar avatar-sm">
                    <img src="{$f.f_url}" alt="{$f.f_title}">
                  </figure>
               </div>
               <div class="tile-content">
                  <div class="tile-title"><a href="{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html">{$f.f_title}</a></div>
                  <small class="tile-subtitle text-gray">Visitas: {$f.total|kmg}</small>
               </div>
            </div>
            {/foreach}
         {/if}
      </div>
   </div>
   <!--MEDALLAS-->
   <div class="column col-6">
      <ul class="tab">
         <li class="tab-item active"><a href="#">Top fotos con m&aacute;s medallas</a></li>
      </ul>
      <div class="body">
         {if !$tsTops.medallas}<div class="emptyData">Nada por aqui</div>
         {else}
            {foreach from=$tsTops.medallas item=f}
               <div class="tile tile-centered">
                  <div class="tile-icon">
                     <figure class="avatar avatar-sm">
                       <img src="{$f.f_url}" alt="{$f.f_title}">
                     </figure>
                  </div>
                  <div class="tile-content">
                     <div class="tile-title"><a href="{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html">{$f.f_title}</a></div>
                     <small class="tile-subtitle text-gray">Medallas: {$f.total|kmg}</small>
                  </div>
               </div>
            {/foreach}
         {/if}
      </div>
   </div>