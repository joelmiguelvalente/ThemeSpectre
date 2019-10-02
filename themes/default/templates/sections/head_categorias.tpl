<div class="categorias">
   <a class="btn btn-success btn-sm" onclick="cat('cats'); return false">Seleccionar categoría <i class="lni-angle-double-down"></i></a>
   <div id="cats" style="display:none;">
      {foreach from=$tsConfig.categorias item=c}
         <a href="{$tsConfig.url}/posts/{$c.c_seo}/">{$c.c_nombre}</a>
      {/foreach}
   </div>
</div>