<div class="column col-3">
   <ul class="tab">
      <li class="tab-item active">
         <a href="#">Men&uacute;</a>
      </li>
   </ul>
   <div class="boxy">
      <div class="boxy-content" id="admin_menu">
         <ul id="mp-menu" class="cat-list">
            <li class="mp_inbox{if $tsAction == ''} active{/if}"><a href="{$tsConfig.url}/mensajes/">Mensajes Recibidos</a></li>
            <li class="mp_send{if $tsAction == 'enviados'} active{/if}"><a href="{$tsConfig.url}/mensajes/enviados/">Mensajes Enviados</a></li>
            <li class="mp_return{if $tsAction == 'respondidos'} active{/if}"><a href="{$tsConfig.url}/mensajes/respondidos/">Mensajes Respondidos</a></li>
            <li class="divider"></li>
            {if $tsAction == 'search'}<li class="mp_search active"><a href="#">Resultados de b&uacute;squeda</a></li>{/if}
            <li class="mp_new"><a href="#" onclick="mensaje.nuevo('','','',''); return false;">Escribir Nuevo Mensaje</a></li>
            <li class="divider"></li>
            <li class="mp_avisos{if $tsAction == 'avisos'} active{/if}"><a href="{$tsConfig.url}/mensajes/avisos/">Avisos/Alertas</a></li>
         </ul>
      </div><!-- boxy-content -->
   </div>
   {if $tsMensajes}
   <br />
      <center>
         {$tsConfig.ads_160}
      </center>
   {/if}
</div>