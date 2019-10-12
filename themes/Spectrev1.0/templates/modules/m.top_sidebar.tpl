<div class="boxy">
   <ul class="tab">
      <li class="tab-item active"><a href="#">Filtrar</a></li>
   </ul>
   <div class="boxy-content">
      <h4 >Categor&iacute;a</h4>
      <select class="form-select" onchange="location.href='{$tsConfig.url}/top/{$tsAction}/?fecha={$tsFecha}&cat='+$(this).val()">
         <option value="0">Todas</option>
         {foreach from=$tsConfig.categorias item=c}
         <option value="&cat={$c.cid}" {if $tsCat == $c.cid}selected="selected"{/if}>{$c.c_nombre}</option>
         {/foreach}
      </select>
      <br>
      <h4 style="margin: 0;">Per&iacute;odo</h4>
      <ul class="menu" style="box-shadow: none;">
         <li class="menu-item"><a href="{$tsConfig.url}/top/{$tsAction}/?fecha=2&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 2}class="selected"{/if}>Ayer</a></li>
         <li class="menu-item"><a href="{$tsConfig.url}/top/{$tsAction}/?fecha=1&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 1}class="selected"{/if}>Hoy</a></li>
         <li class="menu-item"><a href="{$tsConfig.url}/top/{$tsAction}/?fecha=3&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 3}class="selected"{/if}>&Uacute;ltimos 7 d&iacute;as</a></li>
         <li class="menu-item"><a href="{$tsConfig.url}/top/{$tsAction}/?fecha=4&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 4}class="selected"{/if}>Del mes</a></li>
         <li class="menu-item"><a href="{$tsConfig.url}/top/{$tsAction}/?fecha=5&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 5}class="selected"{/if}>Todos los tiempos</a></li>
      </ul>
   </div>
</div>