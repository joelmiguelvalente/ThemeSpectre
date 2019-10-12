<div class="boxy-title">
   <h3>Censurar palabras</h3>
</div>
<div id="res" class="boxy-content">
   {if $tsSave}<div style="display: block;" class="mensajes ok">Tus cambios han sido guardados.</div>{/if}
   {if $tsError}<div class="mensajes error">{$tsError}</div>{/if}
   {if !$tsAct}
   {if !$tsBadWords.data}
   <div class="phpostAlfa">No hay filtros de palabras</div>
   {else}
   <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center" class="table">
      <thead>
         <th>ID</th>
         <th>M&eacute;todo</th>
         <th>Tipo</th>
         <th>Antes</th>
         <th>Despu&eacute;s</th>
         <th>Raz&oacute;n</th>
         <th>Autor</th>
         <th>Fecha</th>
         <th>Acciones</th>
      </thead>
      <tbody>{foreach from=$tsBadWords.data item=b}
         <tr id="wid_{$b.wid}">
            <td>{$b.wid}</td>
            <td>{if $b.method == 1}Exacto{else}Parcial{/if}</td>
            <td>{if $b.type == 1}Smiley{else}Texto{/if}</td>
            <td>{$b.word}</td>
            <td>{if $b.type == 1}<img src="{$b.swop}" style="max-width:32px; max-height:32px;"/>{else}{$b.swop}{/if}</td>
            <td>{$b.reason}</td>
            <td><a href="{$tsConfig.url}/perfil/{$b.user_name}" class="hovercard" uid="{$b.user_id}">{$b.user_name}</a></td>
            <td>{$b.date|hace}</td>
            <td class="admin_actions">
               <a href="{$tsConfig.url}/admin/badwords?act=editar&id={$b.wid}" title="Editar"><i class="lni-pencil"></i></a>
               <a href="#" onclick="admin.badwords.borrar({$b.wid}); return false" title="Eliminar"><i class="lni-trash"></i></a>
            </td>
         </tr>{/foreach}
      </tbody>
      <tfoot>
      <td colspan="9">P&aacute;ginas: {$tsBadWords.pages}</td>
      </tfoot>
   </table>
   {/if}
   <br />
   <input type="button"  onclick="location.href = '{$tsConfig.url}/admin/badwords?act=nuevo'" value="Agregar nuevo filtro" class="btn btn-success"/>
   {elseif $tsAct == 'editar' || $tsAct == 'nuevo'}
   <form action="" method="post" autocomplete="off">
      <fieldset>
         <legend>{if $tsAct == 'editar'}Editar{else}Agregar{/if} filtro de palabra</legend>
         <span>El m&eacute;todo exacto filtra s&oacute;lo palabras completas, mientras que el parcial filtra todas las coincidencias, aunque forme parte de una palabra. Si opta por usar un smiley, introduzca el enlace directo hacia la imagen.</span>
         <dl>
            <dt><label class="form-label" for="bw_before">Antes:</label></dt>
            <dd><input type="text" id="bw_before"  class="form-input" name="before" value="{$tsBW.word}" /></dd>
         </dl>
         <dl>
            <dt><label class="form-label" for="bw_after">Despu&eacute;s:</label></dt>
            <dd><input type="text" id="bw_after"  class="form-input" name="after" value="{$tsBW.swop}" /></dd>
         </dl>
         <dl>
            <dl>
               <dt><label class="form-label" for="bw_method">M&eacute;todo:</label></dt>
               <dd>
                  <div class="form-group">
                    <label class="form-radio">
                      <input type="radio" name="method" id="bw_method" value="0" {if $tsBW.method == 0}checked="checked"{/if}>
                      <i class="form-icon"></i> Parcial
                    </label>
                    <label class="form-radio">
                      <input type="radio" name="method" id="bw_method" value="1" {if $tsBW.method == 1}checked="checked"{/if}>
                      <i class="form-icon"></i> Exacto
                    </label>
                  </div>
               </dd>
            </dl>
         </dl>
         <dl>
            <dl>
               <dt><label class="form-label" for="bw_type">Tipo:</label></dt>
               <dd>
                  <div class="form-group">
                    <label class="form-radio form-inline">
                      <input type="radio" name="type" id="bw_type" value="0" {if $tsBW.type == 0}checked{/if}><i class="form-icon"></i> Texto
                    </label>
                    <label class="form-radio form-inline">
                      <input type="radio" name="type" id="bw_type" value="1" {if $tsBW.type == 1}checked{/if}><i class="form-icon"></i> Smiley
                    </label>
                  </div>
               </dd>
            </dl>
         </dl>
         {if $tsAct == 'nuevo'}
         <dl>
            <dt><label class="form-label" for="bw_reason">Raz&oacute;n:<span>Indica el motivo por el cual quiere agregar este filtro.</span></label></dt>
            <dd><textarea name="reason" id="bw_reason" class="form-input" rows="3" cols="40">{$tsBW.reason}</textarea></dd>
         </dl>
         {/if}
         <hr />
         <p><input type="submit" name="{if $tsAct == 'editar'}edit{else}new{/if}" value="{if $tsAct == 'editar'}Guardar{else}Agregar{/if}" class="btn btn-primary"/>
      </fieldset>
   </form>
   {/if}
</div>