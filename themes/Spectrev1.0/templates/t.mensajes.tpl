{include file='sections/main_header.tpl'}
<link rel="stylesheet" href="{$tsConfig.css}/mensajes.css">
<div class="columns">
   {include file='modules/m.mensajes_menu.tpl'}
   <div class="column col-9">
      <div style="display: none;" id="m-mensaje"></div>
      <ul class="tab">
         <li class="tab-item active">
            <a href="#">Mensajes</a>
         </li>
         <li class="tab-item tab-action">
            <form class="input-group input-inline" method="get" action="{$tsConfig.url}/mensajes/search/">
               <input class="form-input input-sm" type="text" name="qm" placeholder="Buscar en Mensajes" title="Buscar en Mensajes" value="{$tsMensajes.texto}">
               <button class="btn btn-primary btn-sm input-group-btn"><i class="icon icon-search"></i></button>
            </form>
         </li>
      </ul>
      <div class="boxy">
         <div class="boxy-content" id="mensajes">
            {if $tsAction == '' || $tsAction == 'enviados' || $tsAction == 'respondidos' || $tsAction == 'search'}
               {include file='modules/m.mensajes_list.tpl'}
            {elseif $tsAction == 'leer'}
               {include file='modules/m.mensajes_leer.tpl'}
            {elseif $tsAction == 'avisos'}
               {include file='modules/m.mensajes_avisos.tpl'}
            {/if}
         </div>
      </div>
   </div>
</div>
{include file='sections/main_footer.tpl'}