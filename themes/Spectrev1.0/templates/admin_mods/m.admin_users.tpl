<div class="boxy-title">
	<h3>Administrar Usuarios</h3>
</div>
<div id="res" class="boxy-content" style="position:relative">
	{if !$tsAct}
	{if !$tsMembers.data}
	<div class="phpostAlfa">No hay usuarios registrados.</div>
	{else}
	<table class="table">
		<thead>
			<th>Rango</th>
			<th>Usuario</th>
			<th><a title="Ordenar por email ascendente" href="{$tsConfig.url}/admin/users?o=c&m=a"><</a> Email <a title="Ordenar por email descendente" href="{$tsConfig.url}/admin/users?o=c&m=d">></a></th>
			<th><a title="Ordenar por &uacute;ltima vez activo ascendente" href="{$tsConfig.url}/admin/users?o=u&m=a"><</a> &Uacute;ltima actividad <a title="Ordenar por &uacute;ltima vez activo desccendente" href="{$tsConfig.url}/admin/users?o=u&m=d">></a></th>
			<th>Registro</th>
			<th><a title="Ordenar por IP ascendente" href="{$tsConfig.url}/admin/users?o=i&m=a"><</a> IP <a title="Ordenar por IP descendente" href="{$tsConfig.url}/admin/users?o=i&m=d">></a> </th>
			<th><a title="Ordenar por estado ascendente" href="{$tsConfig.url}/admin/users?o=e&m=a"><</a> Estado <a title="Ordenar por estado descendente" href="{$tsConfig.url}/admin/users?o=e&m=d">></a></th>
			<th>Acciones</th>
		</thead>
		<tbody>
			{foreach from=$tsMembers.data item=m}
			<tr>
				<td><img src="{$tsConfig.images}/icons/ran/{$m.r_image}" /></td>
				<td align="left"><a href="{$tsConfig.url}/perfil/{$m.user_name}" class="hovercard" uid="{$m.user_id}" style="color:#{$m.r_color};">{$m.user_name}</a></td>
				<td>{$m.user_email}</td>
				<td>{if $m.user_lastactive == 0} Nunca{else}{$m.user_lastactive|hace:true}{/if}</td>
				<td>{$m.user_registro|date_format:"%d/%m/%Y"}</td>
				<td><a href="{$tsConfig.url}/moderacion/buscador/1/1/{$m.user_last_ip}" class="geoip" target="_blank">{$m.user_last_ip}</a></td>
				<td id="status_user_{$m.user_id}">{if $m.user_baneado == 1}<font color="red">Suspendido</font>{elseif $m.user_activo == 0}<font color="purple">Inactivo</font>{else}<font color="green">Activo</font>{/if}</td>
				<td class="admin_actions">
					<a href="{$tsConfig.url}/admin/users?act=show&uid={$m.user_id}" title="Editar Usuario"><i class="lni-pencil"></i></a>
					<a onclick="admin.users.setInActive({$m.user_id}); return false;" title="Activar/Desactivar Usuario"><i class="lni-reload"></i></a>
					<a href="#" onclick="mod.users.action({$m.user_id}, 'aviso', false); return false;" title="Enviar Alerta"><i class="lni-warning"></i></a>
					<a href="#" class="{if $m.user_baneado == 1}Reactivar{else}Suspender{/if}" onclick="mod.{if $m.user_baneado == 1}reboot({$m.user_id}, 'users', 'unban', false){else}users.action({$m.user_id}, 'ban', false){/if}; return false;" title="{if $m.user_baneado == 1}Reactivar{else}Suspender{/if} Usuario"><i class="lni-power-switch"></i></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
		<tfoot>
		<td colspan="8">P&aacute;ginas: {$tsMembers.pages}</td>
		</tfoot>
	</table>
	{/if}
	{elseif $tsAct == 'show'}
	<div class="admin_header">
		<h1>Administrar: <strong>{$tsUsername}</strong></h1>
	</div>
	<ul class="tab tab-block">
		<li class="tab-item{if $tsType == 1} active{/if}">
		  	<a href="{$tsConfig.url}/admin/users?act=show&uid={$tsUserID}&t=1">Vista general</a>
		</li>
		<li class="tab-item{if $tsType == 5} active{/if}">
		  	<a href="{$tsConfig.url}/admin/users?act=show&uid={$tsUserID}&t=5">Preferencias</a>
		</li>
		<li class="tab-item{if $tsType == 6} active{/if}">
		  	<a href="{$tsConfig.url}/admin/users?act=show&uid={$tsUserID}&t=6">Borrar Contenido</a>
		</li>
		<li class="tab-item{if $tsType == 7} active{/if}">
		  	<a href="{$tsConfig.url}/admin/users?act=show&uid={$tsUserID}&t=7">Rango</a>
		</li>
		<li class="tab-item{if $tsType == 8} active{/if}">
		  	<a href="{$tsConfig.url}/admin/users?act=show&uid={$tsUserID}&t=8">Firma</a>
		</li>
	</ul>
	{if $tsSave}<div class="mensajes ok">Tus cambios han sido guardados.</div>{/if}
	{if $tsError}<div class="mensajes error">{$tsError}</div>{/if}
	<form action="" method="post" class="edit_user">
		<fieldset>
			{if !$tsType || $tsType == 1}
			<legend>Vista general</legend>
			<dl>
				<dt><label class="form-label" for="user">Nombre de Usuario:</label></dt>
				<dd><input type="text" class="form-input" name="nick" id="user" value="{$tsUserD.user_name}" title="El nick s&oacute;lo se cambiar&aacute; si escribe una nueva contrase&ntilde;a" /></dd>
			</dl>
			<dl>
				<dt><label class="form-label" for="user">Rango:</label></dt>
				<dd><strong style="color:#{$tsUserD.r_color}">{$tsUserD.r_name}</strong></dd>
			</dl>
			<dl>
				<dt><label class="form-label" for="registro">Registrado:</label></dt>
				<dd><strong>{$tsUserD.user_registro|date_format:"%d/%m/%Y a las %H:%M"} <i>({$tsUserD.user_registro|hace})</i></strong></dd>
			</dl>
			<dl>
				<dt><label>&Uacute;ltima vez activo:</label></dt>
				<dd><strong>{$tsUserD.user_lastactive|hace}</strong></dd>
			</dl>
			<dl>
				<dt><label>Puntos:</label></dt>
				<dd><input type="text" class="form-input" name="points" id="points" value="{$tsUserD.user_puntos}" style="width:12%" /></dd>
			</dl>
			<dl>
				<dt><label>Puntos para dar:</label></dt>
				<dd><input type="text" class="form-input" name="pointsxdar" id="pointsxdar" value="{$tsUserD.user_puntosxdar}" style="width:12%" /></dd>
			</dl>
			<dl>
				<dt><label>Cambios de nick disponibles:</label></dt>
				<dd><input type="text" class="form-input" name="changenicks" id="changenicks" value="{$tsUserD.user_name_changes}" style="width:12%" /></dd>
			</dl>
			<hr />
			<dl>
				<dt><label class="form-label" for="email">E-mail:</label></dt>
				<dd><input type="text" class="form-input" name="email" id="email" value="{$tsUserD.user_email}" /></dd>
			</dl>
			<dl>
				<dt><label class="form-label" for="pwd">Nueva contrase&ntilde;a:<span>Debe tener entre 5 y 35 caracteres.</span></label></dt>
				<dd><input type="password" class="form-input" name="pwd" id="pwd" onkeypress="if($('#cpwd').val() != '') $('#sendata').fadeIn();"/></dd>
			</dl>
			<dl>
				<dt><label class="form-label" for="cpwd">Confirmar contrase&ntilde;a:<span>Necesita confirmar su contrase&ntilde;a s&oacute;lo si la ha cambiado arriba.</span></label></dt>
				<dd><input type="password" class="form-input" name="cpwd" id="cpwd" onkeypress="if($('#pwd').val() != '') $('#sendata').fadeIn();"/></dd>
			</dl>
			<dl id="sendata" style="display:none;">
				<dt><label class="form-label" for="sendata">Informar al usuario<span>Marque esta casilla si quiere enviar un e-mail al usuario con los nuevos datos</span></label></dt>
				<dd><div class="form-group">
					  <label class="form-switch">
					    <input type="checkbox" name="sendata">
					    <i class="form-icon"></i> 
					  </label>
					</div>
				</dd>
			</dl>
			{elseif $tsType == 5}
			<legend>Modificar privacidad del usuario</legend>
			<h2 class="active">&iquest;Qui&eacute;n puede...</h2>
			<div class="field">
				<dl>
					<dt><label>ver su muro?</label></dt>
					<dd>
					<select name="muro" class="form-select" style="width:270px;">
						{foreach from=$tsPrivacidad item=p key=i}
						<option value="{$i}"{if $tsPerfil.p_configs.m == $i} selected="true"{/if}>{$p}</option>
						{/foreach}
					</select>
					</dd>
				</dl>
			</div>
			{$tsPerfil.p_configs.muro}
			<div class="field">
				<dl>
					<dt><label>firmar su muro?</label></dt>
					<dd>
					<select name="muro_firm" class="form-select" style="width:270px;">
						{foreach from=$tsPrivacidad item=p key=i}
						{if $i != 6}<option value="{$i}"{if $tsPerfil.p_configs.mf == $i}selected{/if}>{$p}</option>{/if}
						{/foreach}
					</select>
					</dd>
				</dl>
			</div>
			<div class="field">
				<dl>
					<dt><label>ver visitantes recientes?</label></dt>
					<dd>
					<select name="last_hits" class="form-select" style="width:270px;">
						{foreach from=$tsPrivacidad item=p key=i}
						{if $i != 1 && $i != 2}<option value="{$i}"{if $tsPerfil.p_configs.hits == $i}selected{/if}>{$p}</option>{/if}
						{/foreach}
					</select>
					</dd>
				</dl>
			</div>
			<div class="field">
				<dl>
					<dt><label>enviarles mensajes privados?<span>Esta opci&oacute;n no se aplica a moderadores y administradores.</span></label></dt>
					<dd>
					<select name="rec_mps" class="form-select" style="width:270px;">
						{foreach from=$tsPrivacidad item=p key=i}
						{if $i != 6}<option value="{$i}"{if $tsPerfil.p_configs.rmp == $i}selected{/if}>{$p}</option>{/if}
						{/foreach}
						<option value="8"{if $tsPerfil.p_configs.rmp == 8}selected{/if}>Deshabilitar mensajer&iacute;a (opci&oacute;n administrativa)</option>
					</select>
					</dd>
				</dl>
			</div>
			{elseif $tsType == 6}
			<legend>Eliminaci&oacute;n de contenidos</legend>
			<div class="form-group">
			  	<label class="form-checkbox" for="bocuenta">
			    	<input type="checkbox" id="bocuenta" name="bocuenta" onclick="$('#ext').slideToggle();">
			    	<i class="form-icon"></i> Cuenta Completa <small>Se eliminar&aacute; la cuenta y todo el contenido relacionado a {$tsUsername}.</small>
			  	</label>
			</div>
			<div id="ext">
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="boposts">
				    	<input type="checkbox" id="boposts" name="boposts">
				    	<i class="form-icon"></i> Posts <small>Se eliminar&aacute;n todos sus posts y sus comentarios.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bofotos">
				    	<input type="checkbox" id="bofotos" name="bofotos">
				    	<i class="form-icon"></i> Fotos <small>Se eliminar&aacute;n todas sus fotos publicadas y sus comentarios.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="boestados">
				    	<input type="checkbox" id="boestados" name="boestados">
				    	<i class="form-icon"></i> Estados <small>Se eliminar&aacute;n todas sus publicaciones de muros.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bocomposts">
				    	<input type="checkbox" id="bocomposts" name="bocomposts">
				    	<i class="form-icon"></i> Comentarios de Posts <small>Se eliminar&aacute;n todos sus comentarios en posts.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bocomfotos">
				    	<input type="checkbox" id="bocomfotos" name="bocomfotos">
				    	<i class="form-icon"></i> Comentarios de Fotos <small>Se eliminar&aacute;n todos sus comentarios en fotos.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bocomestados">
				    	<input type="checkbox" id="bocomestados" name="bocomestados">
				    	<i class="form-icon"></i> Comentarios en Estados <small>Se eliminar&aacute;n todos sus comentarios en estados.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bolike">
				    	<input type="checkbox" id="bolike" name="bolike">
				    	<i class="form-icon"></i> Like <small>Se eliminar&aacute;n sus likes en estados y comentarios en estados.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="boseguidores">
				    	<input type="checkbox" id="boseguidores" name="boseguidores">
				    	<i class="form-icon"></i> Seguidores <small>Se eliminar&aacute; la lista de todos sus seguidores.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bosiguiendo">
				    	<input type="checkbox" id="bosiguiendo" name="bosiguiendo">
				    	<i class="form-icon"></i> Siguiendo <small>Se eliminar&aacute; la lista de todos a los que sigue.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bofavoritos">
				    	<input type="checkbox" id="bofavoritos" name="bofavoritos">
				    	<i class="form-icon"></i> Favoritos <small>Se eliminar&aacute; la lista de favoritos que haya agregado.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bovotosposts">
				    	<input type="checkbox" id="bovotosposts" name="bovotosposts">
				    	<i class="form-icon"></i> Votos en Posts <small>Se eliminar&aacute;n los votos de puntos que haya dejado en posts.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bovotosfotos">
				    	<input type="checkbox" id="bovotosfotos" name="bovotosfotos">
				    	<i class="form-icon"></i> Votos en Fotos <small>Se eliminar&aacute;n los votos positivos y negativos que haya dejado en fotos.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="boactividad">
				    	<input type="checkbox" id="boactividad" name="boactividad">
				    	<i class="form-icon"></i> Actividad <small>Se eliminar&aacute; toda su actividad.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="boavisos">
				    	<input type="checkbox" id="boavisos" name="boavisos">
				    	<i class="form-icon"></i> Avisos <small>Se eliminar&aacute;n todos los avisos que ha recibido.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bobloqueos">
				    	<input type="checkbox" id="bobloqueos" name="bobloqueos">
				    	<i class="form-icon"></i> Bloqueos <small>Se eliminar&aacute;n todos los bloqueos que ha recibido.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bomensajes">
				    	<input type="checkbox" id="bomensajes" name="bomensajes">
				    	<i class="form-icon"></i> Mensajes Privados <small>Se eliminar&aacute;n todos los mensajes que ha enviado y recibido.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bosesiones">
				    	<input type="checkbox" id="bosesiones" name="bosesiones">
				    	<i class="form-icon"></i> Sesiones <small>Se eliminar&aacute;n todas las sesiones.</small>
				  	</label>
				</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
				<div class="form-group">
				  	<label class="form-checkbox" for="bovisitas">
				    	<input type="checkbox" id="bovisitas" name="bovisitas">
				    	<i class="form-icon"></i> Visitas <small>Se eliminar&aacute;n todo rastro de visitas de este usuario en perfiles, posts y fotos.</small>
				  	</label>
				</div>
			</div>
				<div class="divider-vert" data-content="{$tsUsername}"></div>
			Introduzca su contrase&ntilde;a para continuar: <input type="password" class="form-input" name="password"/>
			
			{elseif $tsType == 7}
			<legend>Modificar rango de usuario</legend>
			<dl>
				<dt><label>Rango actual:</label></dt>
				<dd><strong style="color:#{$tsUserR.user.r_color}">{$tsUserR.user.r_name}</strong></dd>
			</dl>
			<dl>
				<dt><label class="form-label" for="user">Nuevo rango:</label></dt>
				<dd><select class="form-select" name="new_rango">
					{foreach from=$tsUserR.rangos item=r}
					<option value="{$r.rango_id}" style="color:#{$r.r_color}" {if $r.rango_id == $tsUserR.user.rango_id}selected="selected"{/if}>{$r.r_name}</option>
					{/foreach}
				</select></dd>
			</dl>
			{elseif $tsType == 8}
			<legend>Modificar firma de usuario</legend>
			<textarea name="firma" class="form-input" rows="3" cols="50">{$tsUserF.user_firma}</textarea>
			{else}
			<div class="phpostAlfa">Pendiente</div>
			{/if}
			<p><input type="submit" name="save" value="Enviar Cambios" class="btn btn-primary"/></p>
		</fieldset>
	</form>
	{/if}
</div>