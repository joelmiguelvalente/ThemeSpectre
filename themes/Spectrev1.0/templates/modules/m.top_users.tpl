<!--PUNTOS-->
<div class="column col-4">
   <ul class="tab">
      <li class="tab-item active"><a href="#">Top usuario con m&aacute;s puntos</a></li>
   </ul>
   <div class="boxy-content">
      {if !$tsTops.puntos}<div class="emptyData">Nada por aqui</div>
      {else}
      {foreach from=$tsTops.puntos item=u}
      <div class="tile tile-centered">
         <div class="tile-icon">
            <figure class="avatar avatar-sm">
               <img src="{$tsConfig.url}/files/avatar/{$u.user_id}_120.jpg">
            </figure>
         </div>
         <div class="tile-content">
            <div class="tile-title"><a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a></div>
            <small class="tile-subtitle text-gray">Puntos: {$u.total}</small>
         </div>
      </div>
      {/foreach}
      {/if}
   </div>
</div>
<!--SEGUIDORES-->
<div class="column col-4">
   <ul class="tab">
      <li class="tab-item active"><a href="#">Top usuario con m&aacute;s seguidores</a></li>
   </ul>
   <div class="boxy-content">
      {if !$tsTops.seguidores}<div class="emptyData">Nada por aqui</div>
      {else}
      {foreach from=$tsTops.seguidores item=u}
      <div class="tile tile-centered">
         <div class="tile-icon">
            <figure class="avatar avatar-sm">
               <img src="{$tsConfig.url}/files/avatar/{$u.user_id}_120.jpg">
            </figure>
         </div>
         <div class="tile-content">
            <div class="tile-title"><a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a></div>
            <small class="tile-subtitle text-gray">Seguidores: {$u.total}</small>
         </div>
      </div>
      {/foreach}
      {/if}
   </div>
</div>
<!--MEDALLAS-->
<div class="column col-4">
   <ul class="tab">
      <li class="tab-item active"><a href="#">Top usuario con m&aacute;s medallas</a></li>
   </ul>
   <div class="boxy-content">
      {if !$tsTops.medallas}<div class="emptyData">Nada por aqui</div>
      {else}
      {foreach from=$tsTops.medallas item=u}
      <div class="tile tile-centered">
         <div class="tile-icon">
            <figure class="avatar avatar-sm">
               <img src="{$tsConfig.url}/files/avatar/{$u.user_id}_120.jpg">
            </figure>
         </div>
         <div class="tile-content">
            <div class="tile-title"><a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a></div>
            <small class="tile-subtitle text-gray">Medallas: {$u.total}</small>
         </div>
      </div>
      {/foreach}
      {/if}
   </div>
</div>