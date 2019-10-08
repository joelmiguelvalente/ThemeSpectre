<div id="portal_posts" class="showHide lastPosts" status="" style="display:none">
   <div class="header">
      <div class="box_txt ultimos_posts">&Uacute;ltimos posts de tu inter&eacute;s <a onclick="$('#config_posts').slideDown();" title="Configurar"><i class="icon icon-apps"></i></a></div>
   </div>
   <div id="config_posts" style="display:none">
      <div class="emptyData">Elige las categor&iacute;as que quieras filtrar en los &uacute;ltimos posts.</div>
      <div class="clearbeta" id="config_inputs">
         {foreach from=$tsCategories item=c}
         <div class="form-group">
           <label class="form-checkbox" for="{$c.c_nombre}">
             <input type="checkbox" id="{$c.c_nombre}" value="{$c.cid}" {if $c.check == 1}checked="true"{/if}>
             <i class="form-icon"></i> <img src="{$tsConfig.images}/icons/cat/{$c.c_img}" alt="{$c.c_nombre}"> {$c.c_nombre}
           </label>
         </div>
         {/foreach}
      </div>
      <a onclick="portal.save_configs();" class="btn btn-primary next">Guardar cambios &raquo;</a>
      <div class="clearBoth"></div>
   </div>
   <div id="portal_posts_content"></div>
</div>