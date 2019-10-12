<script type="text/javascript">
// {literal}
$(function(){
   $('#cat_img').change(function(){
      var cssi = $("#cat_img option:selected").css('background');
      $('#c_icon').css({"background" : cssi});
   });
});
// {/literal}
</script>
<div class="boxy-title">
   <h3>Administrar Rangos de Usuarios</h3>
</div>
<div id="res" class="boxy-content" style="position:relative">
   {if $tsSave}<div class="mensajes ok">Tus cambios han sido guardados.</div>{/if}
   {if $tsError}<div class="mensajes error">{$tsError}</div>{/if}
   {if $tsAct == ''}
   <div>
      <h3 style="margin:0">Rangos Especiales</h3><hr style="margin:4px 0" />
      <table class="table">
         <thead>
            <th>Rango</th>
            <th>Usuarios</th>
            <th>Puntos para dar</th>
            <th>Puntos por post</th>
            <th>Imagen</th>
            <th>Acciones</th>
         </thead>
         <tbody>
            {foreach from=$tsRangos.regular item=r}
            <tr>
               <td><a href="?act=list&rid={$r.id}&t=r" style="color:#{$r.color}">{$r.name}</a></td>
               <td>{$r.num_members}</td>
               <td>{$r.user_puntos}</td>
               <td>{$r.max_points}</td>
               <td><img src="{$tsConfig.images}/icons/ran/{$r.imagen}"/></td>
               <td class="admin_actions">
                  <a href="?act=editar&rid={$r.id}&t=s" title="Editar Rango"><i class="lni-pencil"></i></a>
                  {if $r.id > 3}<a href="?act=borrar&rid={$r.id}" title="Borrar Rango"><i class="lni-trash"></i></a>{/if}{if $tsConfig.c_reg_rango == $r.id}<a href="#" title="Rango Predeterminado al registro"><i class="lni-pin-alt"></i></a>{else}<a id="f_2" onclick="location.href = '{$tsConfig.url}/admin/rangos/?act=setdefault&rid={$r.id}'; $('#f_2').style.cursor=wait"  style="cursor:pointer;" title="Establecer Predeterminado"><i class="lni-pin"></i></a>{/if}
               </td>
            </tr>
            {/foreach}
         </tbody>
         <tfoot>
         <td colspan="6" style="text-align:right"><a class="btn btn-success" href="?act=nuevo&t=s">Agregar nuevo rango &raquo;</a></td>
         </tfoot>
      </table>
   </div>
   <div class="edit_user">
      <div class="divider-vert" data-content="Rangos"></div>
   </div>
   <div>
      <h3 style="margin:0">Rangos basados en el conteo de puntos y posts</h3>
      <table class="table">
         <thead>
            <th width="150">Rango</th>
            <th>Usuarios</th>
            <th>Tipo</th>
            <th>Cantidad requerida</th>
            <th>Puntos para dar</th>
            <th>Puntos por post</th>
            <th>Imagen</th>
            <th>Acciones</th>
         </thead>
         <tbody>
            {foreach from=$tsRangos.post item=r}
            <tr>
               <td><a href="?act=list&rid={$r.id}&t=p" style="color:#{$r.color}">{$r.name}</a></td>
               <td>{$r.num_members}</td>
               <td>{if $r.type == 1}Puntos{elseif $r.type == 2}Posts{elseif $r.type == 3}Fotos{elseif $r.type == 4}Comentarios{/if}</td>
               <td>{$r.cant}</td>
               <td>{$r.user_puntos}</td>
               <td>{$r.max_points}</td>
               <td><img src="{$tsConfig.images}/icons/ran/{$r.imagen}" /></td>
               <td class="admin_actions">
                  <a href="?act=editar&rid={$r.id}&t=p" title="Editar Rango"><i class="lni-pencil"></i></a>
                  {if $r.id > 3}<a href="?act=borrar&rid={$r.id}" title="Borrar Rango"><i class="lni-trash"></i></a>{/if}
                  
               </td>
            </tr>
            {/foreach}
         </tbody>
         <tfoot>
         <td colspan="8" style="text-align:right"><a class="btn btn-success" href="?act=nuevo">Agregar nuevo rango &raquo;</a></td>
         </tfoot>
      </table>
   </div>
   {elseif $tsAct == 'list'}
   {if !$tsMembers.data}
   <div class="mensajes error">Aun no hay usuarios en este rango.</div>
   {else}
   <table cellpadding="0" cellspacing="0" border="0" class="table" width="550" align="center">
      <thead>
         <th>Usuario</th>
         <th>Email</th>
         <th>&Uacute;ltima vez activo</th>
         <th>Fecha de registro</th>
         <th>Acciones</th>
      </thead>
      <tbody>
         {foreach from=$tsMembers.data item=m}
         <tr>
            <td align="left"><a href="{$tsConfig.url}/perfil/{$m.user_name}" class="hovercard" uid="{$m.user_id}" style="color:#{$m.r_color};">{$m.user_name}</a></td>
            <td>{$m.user_email}</td>
            <td>{$m.user_lastlogin|hace:true}</td>
            <td>{$m.user_registro|date_format:"%d/%m/%Y"}</td>
            <td class="admin_actions"><a href="{$tsConfig.url}/admin/users?act=show&uid={$m.user_id}&t=7"><img src="{$tsConfig.images}/icons/editar.png" title="Editar rango" /></a></td>
         </tr>
         {/foreach}
      </tbody>
      <tfoot>
      <td colspan="6">P&aacute;ginas: {$tsMembers.pages}</td>
      </tfoot>
   </table>
   {/if}
   {elseif $tsAct == 'nuevo' || $tsAct == 'editar'}
   <script type="text/javascript" src="{$tsConfig.js}/jquery.color.js"></script>
   <form action="" method="post">
      <fieldset>
         <legend>Nuevo Rango</legend>
         <ul class="tab tab-block">
            <li class="tab-item">
               <a id="b1" onclick="$('#tab1').fadeIn('slow'); $('#tab2').hide('slow'); $(this).css('border','1px solid #4D90FE'); $('#b2').css('border','0px');">B&aacute;sico</a>
            </li>
            <li class="tab-item">
               <a id="b2" onclick="$('#tab2').show('slow'); $('#tab1').hide('slow'); $(this).css('border','1px solid #4D90FE'); $('#b1').css('border','0px');">Permisos</a>
            </li>
         </ul>
         <div id="tab1">
            
            <dl>
               <dt><label class="form-label" for="rName">T&iacute;tulo:</label></dt>
               <dd><input type="text" id="rName" class="form-input" name="rName" value="{$tsRango.r_name}" style="width:30%"/></dd>
            </dl>
            <dl>
               <dt><label class="form-label" for="rColor">Color:<span>Color (<a href="http://es.wikipedia.org/wiki/Colores_HTML" target="_blank">hexadecimal</a>) del rango.</span></label></dt>
               <dd><input type="text" id="rColor" class="form-input jscolor" name="rColor" value="{$tsRango.r_color}" style="color:#{$tsRango.r_color}; font-weight:bold;width:30%"/></dd>
            </dl>
            <dl>
               <dt><label class="form-label" for="gopfd">Puntos por d&iacute;a:<span>Puntos que puede otorgar este rango a otros usuarios al d&iacute;.</span></label></dt>
               <dd><input type="text" id="gopfd" class="form-input" name="global-pointsforday" value="{$tsRango.permisos.gopfd}" style="width:30%"/></dd>
            </dl>
            <dl>
               <dt><label class="form-label" for="gopfp">Puntos por post<span>Puntos que puede dar en cada post.</span></label></dt>
               <dd><input type="text" id="gopfp" class="form-input" name="global-pointsforposts" value="{$tsRango.permisos.gopfp}" style="width:30%"/></dd>
            </dl>
            <dl>
               <dt><label class="form-label" for="goaf">Anti-flood<span>Tiempo que deben esperar entre acci&oacute;n.</span></label></dt>
               <dd><input type="text" id="goaf" class="form-input" name="global-antiflood" value="{$tsRango.permisos.goaf}" style="width:30%"/></dd>
            </dl>
            <dl>
               <dt>
                  <label class="form-label" for="gocpr">Condici&oacute;n especial:<span>Cantidad requerida para obtener el rango. Elija especial si s&oacute;lo es asignado por un administrador.</label></span>
               </dt>
               <dd>
                  <div class="form-group">
                    <label class="form-radio form-inline" onclick="$('#gocpr').slideDown();" title="Del usuario">
                      <input type="radio" name="global-type" id="ai_type" value="1" {if $tsRango.r_type == 1} checked{/if}><i class="form-icon"></i> Puntos
                    </label>
                    <label class="form-radio form-inline" onclick="$('#gocpr').slideDown();">
                      <input type="radio" name="global-type" id="ay_type" value="2" {if $tsRango.r_type == 2} checked{/if}><i class="form-icon"></i> Posts
                    </label>
                    <label class="form-radio form-inline" onclick="$('#gocpr').slideDown();">
                      <input type="radio" name="global-type" id="ay_type" value="3" {if $tsRango.r_type == 3} checked{/if}><i class="form-icon"></i> Fotos
                    </label>
                    <label class="form-radio form-inline" onclick="$('#gocpr').slideDown();" title="De posts y fotos">
                      <input type="radio" name="global-type" id="ay_type" value="4" {if $tsRango.r_type == 4} checked{/if}><i class="form-icon"></i> Comentarios
                    </label>
                    <label class="form-radio form-inline" onclick="$('#gocpr').slideUp();">
                      <input type="radio" name="global-type" id="ay_type" value="0" {if $tsRango.r_type == 0} checked{/if}><i class="form-icon"></i> Especial
                    </label>
                  </div>
                  <input type="text" id="gocpr" class="form-input" name="global-cantidadrequerida" style="width:12%{if $tsRango.r_type == 0};display:none;{/if}" maxlength="5" value="{$tsRango.r_cant}" />               
               </dd>
            </dl>
            <dl>
               <dt><label class="form-label" for="cat_img">Icono del rango:</label></dt>
               <dd class="form-group">
               <img src="{$tsConfig.images}/space.gif" style="background:url({$tsConfig.images}/icons/ran/{if $tsRango.r_image}{$tsRango.r_image}{else}{$tsIcons.0}{/if}) no-repeat left center;" width="32" height="32" id="c_icon"/>
               <select name="r_img" class="form-input" id="cat_img" style="width:164px">
                  {foreach from=$tsIcons key=i item=img}
                  <option value="{$img}" style="padding:2px 20px 0; background:#FFF url({$tsConfig.images}/icons/ran/{$img}) no-repeat left center;" {if $tsRango.r_image == $img}selected="selected"{/if}>{$img}</option>
                  {/foreach}
               </select>
               </dd>
            </dl>
            <hr />
            <input type="button" onclick="$('#tab2').show('slow'); $('#tab1').hide('slow'); $('#b2').css('border','1px solid #4D90FE'); $('#b1').css('border','0px');" value="Continuar" style="width:100px;cursor:default;" class="btn btn-primary"/>
         </div>
         <div id="tab2" class="edit_user" style="display:none;">
            
            <fieldset>
               <legend>Super Moderaci&oacute;n</legend>
               <div class="form-group">
                  <label class="form-checkbox" for="suad">
                     <input type="checkbox" id="suad" name="superadmin"{if $tsRango.permisos.suad} checked{/if}>
                     <i class="form-icon"></i> Super Admin <small>Si marca esto, los permisos p&uacute;blicos, de administraci&oacute;n y de moderaci&oacute;n estar&aacute;n inclu&iacute;dos.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="sumo">
                     <input type="checkbox" id="sumo" name="supermod"{if $tsRango.permisos.sumo} checked{/if}>
                     <i class="form-icon"></i> Super Moderador <small>Si marca esto, todos los permisos p&uacute;blicos y de moderaci&oacute;n estar&aacute;n inclu&iacute;dos.</small>
                  </label>
               </div>
            </fieldset>
            <fieldset>
               <legend>Global</legend>
               <div class="form-group">
                  <label class="form-checkbox" for="godp">
                     <input type="checkbox" id="godp" name="global-darpuntos"{if $tsRango.permisos.godp} checked{/if}>
                     <i class="form-icon"></i> Puntuar Posts <small>Podr&aacute;n puntuar posts.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="gopp">
                     <input type="checkbox" id="gopp" name="global-publicarposts"{if $tsRango.permisos.gopp} checked{/if}>
                     <i class="form-icon"></i> Publicar Posts <small>Podr&aacute;n publicar posts.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="gopcp">
                     <input type="checkbox" id="gopcp" name="global-publicarcomposts"{if $tsRango.permisos.gopcp} checked{/if}>
                     <i class="form-icon"></i> Publicar Comentarios en Posts <small>Podr&aacute;n publicar comentarios posts.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="govpp">
                     <input type="checkbox" id="govpp" name="global-votarposipost"{if $tsRango.permisos.govpp} checked{/if}>
                     <i class="form-icon"></i> Votar postivo <small>Podr&aacute;n votar positivamente comentarios de posts.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="govpn">
                     <input type="checkbox" id="govpn" name="global-votarnegapost"{if $tsRango.permisos.govpn} checked{/if}>
                     <i class="form-icon"></i> Votar negativo <small>Podr&aacute;n votar negativamente comentarios de posts.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="goepc">
                     <input type="checkbox" id="goepc" name="global-editarpropioscomentarios"{if $tsRango.permisos.goepc} checked{/if}>
                     <i class="form-icon"></i> Editar comentarios propios <small>Podr&aacute;n editar los comentarios que ellos hacen.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="godpc">
                     <input type="checkbox" id="godpc" name="global-eliminarpropioscomentarios"{if $tsRango.permisos.godpc} checked{/if}>
                     <i class="form-icon"></i> Eliminar comentarios propios <small>Podr&aacute;n eliminar los comentarios que ellos hacen.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="gopf">
                     <input type="checkbox" id="gopf" name="global-publicarfotos"{if $tsRango.permisos.gopf} checked{/if}>
                     <i class="form-icon"></i> Publicar Fotos <small>Podr&aacute;n publicar fotos.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="gopcf">
                     <input type="checkbox" id="gopcf" name="global-publicarcomfotos"{if $tsRango.permisos.gopcf} checked{/if}>
                     <i class="form-icon"></i> Publicar Comentarios en Fotos <small>Podr&aacute;n publicar comentarios en fotos.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="gorpap">
                     <input type="checkbox" id="gorpap" name="global-revisarposts"{if $tsRango.permisos.gorpap} checked{/if}>
                     <i class="form-icon"></i> Revisar Posts <small>Si marca esto, cuando publiquen un post, antes de ser p&uacute;blico ser&aacute;n revisados.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="govwm">
                     <input type="checkbox" id="govwm" name="global-vermantenimiento"{if $tsRango.permisos.govwm} checked{/if}>
                     <i class="form-icon"></i> Acceso en mantenimiento <small>Podr&aacute;n navegar normalmente mientras la web est&aacute; en mantenimiento.</small>
                  </label>
               </div>
            </fieldset>
            <fieldset>
               <legend>Panel de Moderaci&oacute;n</legend>
               <div class="form-group">
                  <label class="form-checkbox" for="moacp">
                     <input type="checkbox" id="moacp" name="mod-accesopanel"{if $tsRango.permisos.moacp} checked{/if}>
                     <i class="form-icon"></i> Acceso al Panel de Moderaci&oacute;n <small>Podr&aacute;n entrar al panel de moderaci&oacute;n y ver posts y fotos denunciadas.</small>
                  </label>
               </div>
               <fieldset>
                  <legend>Denuncias</legend>
                  <div class="form-group">
                     <label class="form-checkbox" for="mocdu">
                        <input type="checkbox" id="mocdu" name="mod-cancelardenunciasusuarios"{if $tsRango.permisos.mocdu} checked{/if}>
                        <i class="form-icon"></i> Cancelar denuncias de usuarios <small>Podr&aacute;n ver y cancelar reportes de usuarios.</small>
                     </label>
                  </div>
                  <div class="divider-vert" data-content="Rangos"></div>
                  <div class="form-group">
                     <label class="form-checkbox" for="mocdf">
                        <input type="checkbox" id="mocdf" name="mod-cancelardenunciasfotos"{if $tsRango.permisos.mocdf} checked{/if}>
                        <i class="form-icon"></i> Cancelar denuncias de fotos <small>Podr&aacute;n rechazar reportes de fotos.</small>
                     </label>
                  </div>
                  <div class="divider-vert" data-content="Rangos"></div>
                  <div class="form-group">
                     <label class="form-checkbox" for="mocdp">
                        <input type="checkbox" id="mocdp" name="mod-cancelardenunciasposts"{if $tsRango.permisos.mocdp} checked{/if}>
                        <i class="form-icon"></i> Cancelar denuncias de posts <small>Podr&aacute;n rechazar reportes de posts.</small>
                     </label>
                  </div>
                  <div class="divider-vert" data-content="Rangos"></div>
                  <div class="form-group">
                     <label class="form-checkbox" for="moadm">
                        <input type="checkbox" id="moadm" name="mod-aceptardenunciasmensajes"{if $tsRango.permisos.moadm} checked{/if}>
                        <i class="form-icon"></i> Aceptar denuncias de mensajes <small>Podr&aacute;n aceptar reportes de mensajes.</small>
                     </label>
                  </div>
                  <div class="divider-vert" data-content="Rangos"></div>
                  <div class="form-group">
                     <label class="form-checkbox" for="mocdm">
                        <input type="checkbox" id="mocdm" name="mod-cancelardenunciasmensajes"{if $tsRango.permisos.mocdm} checked{/if}>
                        <i class="form-icon"></i> Cancelar denuncias de mensajes <small>Podr&aacute;n rechazar reportes de mensajes.</small>
                     </label>
                  </div>
               </fieldset>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="movub">
                     <input type="checkbox" id="movub" name="mod-verusuariosbaneados"{if $tsRango.permisos.movub} checked{/if}>
                     <i class="form-icon"></i> Usuarios baneados <small>Podr&aacute;n ver usuarios baneados.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moub">
                     <input type="checkbox" id="moub" name="mod-usarbuscador"{if $tsRango.permisos.moub} checked{/if}>
                     <i class="form-icon"></i> Usar el buscador <small>Podr&aacute;n usar el buscador de contenidos.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="morp">
                     <input type="checkbox" id="morp" name="mod-reciclajeposts"{if $tsRango.permisos.morp} checked{/if}>
                     <i class="form-icon"></i> Papelera de posts <small>Podr&aacute;n ver la papelera de reciclaje de posts y los posts eliminados.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="morf">
                     <input type="checkbox" id="morf" name="mod-reficlajefotos"{if $tsRango.permisos.morf} checked{/if}>
                     <i class="form-icon"></i> Papelera de fotos <small>Podr&aacute;n ver la papelera de reciclaje de fotos y los fotos eliminadas.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="mocp">
                     <input type="checkbox" id="mocp" name="mod-contenidoposts"{if $tsRango.permisos.mocp} checked{/if}>
                     <i class="form-icon"></i> Posts desaprobados <small>Podr&aacute;n ver la secci&oacute;n y los posts ocultos.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="mocc">
                     <input type="checkbox" id="mocc" name="mod-contenidocomentarios"{if $tsRango.permisos.mocc} checked{/if}>
                     <i class="form-icon"></i> Comentarios desaprobados <small>Podr&aacute;n ver los comentarios ocultos.</small>
                  </label>
               </div>
            </fieldset>
            <fieldset>
               <legend>Moderaci&oacute;n Parcial</legend>
               <div class="form-group">
                  <label class="form-checkbox" for="most">
                     <input type="checkbox" id="most" name="mod-sticky"{if $tsRango.permisos.most} checked{/if}>
                     <i class="form-icon"></i> Fijar Posts <small>Podr&aacute;n poner/quitar posts en sticky desde el formulario y el mismo post.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moayca">
                     <input type="checkbox" id="moayca" name="mod-abrirycerrarajax"{if $tsRango.permisos.moayca} checked{/if}>
                     <i class="form-icon"></i> Abrir/Cerrar Posts Ajax <small>Podr&aacute;n abrir/cerrar posts r&aacute;pidamente desde el post.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="movcud">
                     <input type="checkbox" id="movcud" name="mod-vercuentasdesactivadas"{if $tsRango.permisos.movcud} checked{/if}>
                     <i class="form-icon"></i> Ver cuentas desactivadas <small>Podr&aacute;n ver cuentas de usuarios desactivadas.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="movcus">
                     <input type="checkbox" id="movcus" name="mod-vercuentassuspendidas"{if $tsRango.permisos.movcus} checked{/if}>
                     <i class="form-icon"></i> Ver cuentas baneadas <small>Podr&aacute;n ver cuentas de usuarios baneados.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="mosu">
                     <input type="checkbox" id="mosu" name="mod-suspenderusuarios"{if $tsRango.permisos.mosu} checked{/if}>
                     <i class="form-icon"></i> Suspender Usuarios <small>Podr&aacute;n suspender usuarios desde formulario modal.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="modu">
                     <input type="checkbox" id="modu" name="mod-desbanearusuarios"{if $tsRango.permisos.modu} checked{/if}>
                     <i class="form-icon"></i> Desbanear Usuarios <small>Podr&aacute;n desbanear usuarios.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moep">
                     <input type="checkbox" id="moep" name="mod-eliminarposts"{if $tsRango.permisos.moep} checked{/if}>
                     <i class="form-icon"></i> Eliminar Posts <small>Podr&aacute;n eliminar posts de otros usuarios.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moedpo">
                     <input type="checkbox" id="moedpo" name="mod-editarposts"{if $tsRango.permisos.moedpo} checked{/if}>
                     <i class="form-icon"></i> Editar Posts <small>Podr&aacute;n editar posts de otros usuarios (requiere permiso publicar post).</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moop">
                     <input type="checkbox" id="moop" name="mod-ocultarposts"{if $tsRango.permisos.moop} checked{/if}>
                     <i class="form-icon"></i> Ocultar Posts <small>Podr&aacute;n ocultar posts de otros usuarios.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="mocepc">
                     <input type="checkbox" id="mocepc" name="mod-comentarpostcerrado"{if $tsRango.permisos.mocepc} checked{/if}>
                     <i class="form-icon"></i> Comentarios en Post Cerrado <small>Podr&aacute;n comentar en posts cerrados.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moedcopo">
                     <input type="checkbox" id="moedcopo" name="mod-editarcomposts"{if $tsRango.permisos.moedcopo} checked{/if}>
                     <i class="form-icon"></i> Editar Comentarios de Posts <small>Podr&aacute;n editar comentarios de posts de otros usuarios.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moaydcp">
                     <input type="checkbox" id="moaydcp" name="mod-desyaprobarcomposts"{if $tsRango.permisos.moaydcp} checked{/if}>
                     <i class="form-icon"></i> Acciones de revisi&oacute;n <small>Aprobar/desaprobar comentarios en los posts y en la revisi&oacute;n de comentarios.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moecp">
                     <input type="checkbox" id="moecp" name="mod-eliminarcomposts"{if $tsRango.permisos.moecp} checked{/if}>
                     <i class="form-icon"></i> Eliminar Comentarios de Posts <small>Podr&aacute;n eliminar comentarios en posts de otros usuarios.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moef">
                     <input type="checkbox" id="moef" name="mod-eliminarfotos"{if $tsRango.permisos.moef} checked{/if}>
                     <i class="form-icon"></i> Eliminar Fotos <small>Podr&aacute;n eliminar fotos de otros usuarios.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moedfo">
                     <input type="checkbox" id="moedfo" name="mod-editarfotos"{if $tsRango.permisos.moedfo} checked{/if}>
                     <i class="form-icon"></i> Editar Fotos <small>Podr&aacute;n editar fotos de otros usuarios (requiere publicar foto).</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moecf">
                     <input type="checkbox" id="moecf" name="mod-eliminarcomfotos"{if $tsRango.permisos.moecf} checked{/if}>
                     <i class="form-icon"></i> Eliminar Comentarios de Fotos <small>Podr&aacute;n eliminar comentarios en fotos de otros usuarios.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moepm">
                     <input type="checkbox" id="moepm" name="mod-eliminarpubmuro"{if $tsRango.permisos.moepm} checked{/if}>
                     <i class="form-icon"></i> Eliminar Publicaciones de Muros <small>Podr&aacute;n eliminar publicaciones en muros de otros usuarios.</small>
                  </label>
               </div>
               <div class="divider-vert" data-content="Rangos"></div>
               <div class="form-group">
                  <label class="form-checkbox" for="moecm">
                     <input type="checkbox" id="moecm" name="mod-eliminarcommuro"{if $tsRango.permisos.moecm} checked{/if}>
                     <i class="form-icon"></i> Eliminar Comentarios de Muros <small>Podr&aacute;n eliminar comentarios en muros de otros usuarios.</small>
                  </label>
               </div>
            </fieldset>
            
            <input type="hidden" name="sp" value="{if $tsType == 's'}1{else}0{/if}" />
            <p><input type="submit" name="save" value="Guardar Cambios" class="btn btn-primary"/></p>
         </div>
      </fieldset>
   </form>
   {elseif $tsAct == 'borrar'}
   <form action="" method="post" id="admin_form">
      <div class="mensajes error">Si borras este rango todos los usuarios que est&eacute;n en &eacute;l, ser&aacute;n asignados al rango
         
         <select name="new_rango" class="form-select">{foreach from=$tsRangos item=r}<option value="{$r.rango_id}" style="color:#{$r.r_color}; padding:2px 20px 0;" {if $r.rango_id == 3}selected{/if}>{$r.r_name}</option>{/foreach}</select> <br /> &iquest;Realmente deseas borrar este rango?</div>
         
         <label>&nbsp;</label> <input type="submit" name="save" value="S&iacute;, Continuar &raquo;" class="btn btn-error">
      </form>
      {/if}
   </div>