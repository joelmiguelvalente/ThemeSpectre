<div class="boxy-title">
   <h3>Administrar Temas</h3>
</div>
<div id="res" class="boxy-content">
   {if $tsSave}<div style="display: block;" class="mensajes ok">Tus cambios han sido guardados.</div>{/if}
   {if $tsAct == ''}
   <table class="table">
      <thead>
         <th>Vista previa</th>
         <th>Nombre</th>
         <th>Opciones</th>
      </thead>
      <tbody>{foreach from=$tsTemas item=tema}
         <tr>
            <td width="150"><img src="{$tema.t_url}/screenshot.png" width="150" height="100" /></td>
            <td><b><u>{$tema.t_name}</u></b></td>
            <td class="admin_actions">
               <a href="?act=editar&tid={$tema.tid}" title="Editar este tema"><i class="lni-pencil"></i></a>
               {if $tsConfig.tema_id == $tema.tid}
               <a onclick="return false;" title="Este tema est&aacute; en uso"><i class="lni-color-pallet"></i></a>
               {else}
               <a href="?act=usar&tid={$tema.tid}&tt={$tema.t_name}" title="Usar este tema" ><i class="lni-display-alt"></i></a>
               {if $tema.tid != 1}<a href="?act=borrar&tid={$tema.tid}&tt={$tema.t_name}" title="Borrar este tema" ><i class="lni-trash"></i></a>{/if}
               {/if}
            </td>
         </tr>{/foreach}
      </tbody>
   </table>
   <br>
   <input type="button"  onclick="location.href = '{$tsConfig.url}/admin/temas?act=nuevo'"value="Instalar nuevo tema" class="btn btn-success">
   {elseif $tsAct == 'editar'}
   <form action="" method="post" id="admin_form" autocomplete="off">
      <div class="form-group">
         <label class="form-label" for="ai_name">Nombre del tema:</label> 
         <input type="text" id="ai_name" class="form-input" name="name" value="{$tsTema.t_name}" size="30" disabled/> <small style="font-style: italic;">Por copyright no se pude modificar.</small>
      </div>
      <div class="form-group">
         <label class="form-label" for="ai_url">Url completa del tema:</label> 
         <input type="text" id="ai_url" name="url" class="form-input" value="{$tsTema.t_url}" size="30" />
      </div>
      <div class="form-group">
         <label class="form-label" for="ai_path">Nombre de la carpeta donde esta el tema:</label> 
         <div class="input-group">
            <span class="input-group-addon">{$tsConfig.url}/themes/</span>
            <input e="text" id="ai_path" class="form-input" name="path" value="{$tsTema.t_path}" size="30">
         </div>
      </div>
      <br>
      <input type="submit" value="Guardar tema" name="save" class="btn btn-success">
   </form>
   {elseif $tsAct == 'usar' || $tsAct == 'borrar'}
   <form action="" method="post" id="admin_form" autocomplete="off">
      <h3 align="center">{$tt}</h3>
      {if $tsAct == 'borrar'}
      <p class="mensajes error">Te recordamos que debes borrar la carpeta del Tema manualmente en el servidor.</p>
      <br>
      {/if}
      <input type="submit" name="confirm" value="{if $tsAct == 'usar'}Confirmar el cambio de{else}Continuar borrando este{/if} tema &raquo;" class="btn btn-{if $tsAct == 'usar'}primary{else}error{/if}">
   </form>
   {elseif $tsAct == 'nuevo'}
   {if $tsError}<div style="display: block;" class="mensajes error">{$tsError}</div>{/if}
   <form action="" method="post" id="admin_form" autocomplete="off">
      <div class="form-group">
         <label class="form-label" for="ai_path">Nombre de la carpeta donde esta el tema a instalar:</label>
         <div class="input-group">
            <span class="input-group-addon">{$tsConfig.url}/themes/</span>
            <input e="text" id="ai_path" class="form-input" name="path" size="30">
         </div>
      </div>
      <br>
      <input type="submit" value="Instalar tema" class="btn btn-success">
   </form>
   {/if}
</div>