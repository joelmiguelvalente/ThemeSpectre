<div class="box">
   <ul class="tab">
      <li class="tab-item active"><a href="#">Afiliados<span onclick="afiliado.nuevo(); return false" title="Afiliate a {$tsConfig.titulo}" class="click icon icon-plus"></span></a></li>
   </ul>
   <div class="box_cuerpo">
      {if $tsAfiliados}
      <ul class="afiliados">
         {foreach from=$tsAfiliados item=af}
         <li><a href="#" onclick="afiliado.detalles({$af.aid}); return false;" title="{$af.a_titulo}">
            <img src="{$af.a_banner}" class="img-responsive img-fit-contain" />
         </a></li>
         {/foreach}
      </ul>
      {else}
      <div class="emptyData">Sin afiliados</div>
      {/if}
   </div>
</div>