<div class="box">
   <div class="box-title">
      <h2 class="h4">&Uacute;ltimas {$tsData.total} notificaciones</h2>
   </div>
   {if $tsData.data}
      <ul class="notification-detail listado-content">
         {foreach from=$tsData.data item=noti}
         <li{if $noti.unread > 0} class="unread"{/if}>
            <div class="avatar-box" style="z-index: 99;">
               <a href="{$tsConfig.url}/perfil/{$noti.user}">
                  <img src="{$tsConfig.url}/files/avatar/{$noti.avatar}"/>
               </a>
            </div>
            <div class="notification-info">
               <span>{if $noti.total == 1}<a href="{$tsConfig.url}/perfil/{$noti.user}">{$noti.user}</a>{/if} <i title="{$noti.date|fecha}" class="time">{$noti.date|fecha}</i>
               </span>
               <span class="action">
                  <span class="monac_icons ma_{$noti.style}"></span>{$noti.text}
                  <a href="{$noti.link}">{$noti.ltext}</a>
               </span>
            </div>
         </li>
         {/foreach}
      </ul>
   {else}
   <div class="empty">
      <p class="empty-title h5">No tienes notificaciones</p>
   </div>
   {/if}
</div>