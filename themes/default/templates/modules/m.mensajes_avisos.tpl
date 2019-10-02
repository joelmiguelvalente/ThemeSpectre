{if $tsMensajes}
<div id="mpList">
   {foreach from=$tsMensajes item=av}
   <div class="off-message{if $av.av_read == 0} unread{/if}" id="av_{$av.av_id}">
      <div class="off-canvas-sidebar">
         <img src="{$tsConfig.images}/icons/avtype_{$av.av_type}.png" />
      </div>
      <div class="off-canvas-content">
         <div class="content">
            <h4>{$av.av_subject}</h4>
            <small>{$tsConfig.titulo} - {$av.av_date|hace}</small>
            <p>{$av.av_body|truncate:70}</p>
            <div class="action">
               <a href="{$tsConfig.url}/mensajes/avisos/?aid={$av.av_id}" class="btn btn-primary btn-sm">Ver aviso</a>
               <a href="{$tsConfig.url}/mensajes/avisos/?did={$av.av_id}" class="btn btn-delete btn-sm" title="Eliminar">Eliminar</a>
            </div>
         </div>
      </div>
   </div>
   {/foreach}
</div>
{elseif $tsMensaje.av_id > 0}
<div class="columns">
<div class="mpRContent column col-8">
   <div class="mpHeader">
      <h2>{$tsMensaje.av_subject}</h2>
   </div>
   <div class="mpUser">
      <span class="info"><a href="{$tsConfig.url}">{$tsConfig.titulo}</a> <span class="floatR">{$tsMensaje.av_date|hace}</span></span>
   </div>
   <ul class="mpHistory" id="historial">
      <li>
         <div class="main clearBoth" style="border:0;">
            <div class="autor-image"><img src="{$tsConfig.images}/icons/avtype_{$tsMensaje.av_type}.png" /></div>
            <div class="mensaje">
               <div><a href="{$tsConfig.url}/perfil/{$mp.user_name}" class="autor-name">{$mp.user_name}</a> </div>
               <div>{$tsMensaje.av_body|nl2br}</div>
            </div>
         </div>
      </li>
   </ul>
   <div class="mpForm">
      <div class="form">
         <span>&nbsp;</span>
      </div>
   </div>
</div>
<div class="mpOptions column col-4">
   <ul class="tab">
      <li class="tab-item active">
         <a href="#">Acciones</a>
      </li>
   </ul>
   <ul class="actions-list">
      <li><a href="{$tsConfig.url}/mensajes/avisos/?did={$tsMensaje.av_id}">Eliminar</a></li>
      <li class="div"></li>
      <li><a href="{$tsConfig.url}/mensajes/avisos/">&laquo; Volver a avisos</a></li>
   </ul>
</div>
</div>
{else}
<div class="vacio">{if $tsMensaje}{$tsMensaje}{else}No hay avisos o alertas{/if}</div>
{/if}