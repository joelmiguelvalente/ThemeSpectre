<header class="navbar bgc">
	<section class="navbar-section">
		<a href="{$tsConfig.url}" class="navbar-brand ml-2 mr-2">{$tsConfig.titulo}</a>
		{if $tsConfig.c_allow_portal && $tsUser->is_member == true}
		<a class="btn btn-link{if $tsPage != 'home' && $tsPage != 'posts' && $tsPage != 'tops' && $tsPage != 'admin' && $tsPage != 'fotos'} text-warning{/if}" href="{$tsConfig.url}/mi/">Portal</a>
		{/if}
		<a href="{$tsConfig.url}/posts/" class="btn btn-link{if $tsPage == 'posts' || $tsPage == 'home'} text-warning{/if}">Posts</a>
		{if $tsConfig.c_fotos_private == '1' && !$tsUser->is_member}{else}								
	      <a class="btn btn-link{if $tsPage == 'fotos'} text-warning{/if}" href="{$tsConfig.url}/fotos/">Fotos</a>
	   {/if}
	   <a class="btn btn-link{if $tsPage == 'top'} text-warning{/if}" href="{$tsConfig.url}/top/">TOPs</a>
	</section>
	<section class="navbar-section userInfoLogin">
		{if !$tsUser->is_member}
		<a title="Registrate!" style="margin-right:4px;" class="btn btn-success btn-sm" onclick="registro_load_form(); return false" href="">Registrate!</a>
		<a title="Identificarme" href="javascript:open_login_box()" class="btn btn-primary btn-sm">Identificarme</a>
		{else}
		<!-- NOTIFICACIONES -->
		<item class="menu-nav monitor">
			<a class="btn btn-link{if $tsNots} badge" data-badge="{$tsNots}"{else}"{/if} onclick="notifica.last(); return false" name="Monitor"><span class="lni-alarm size"></span></a>
			<div class="menu" id="mon_list" style="display:none">
				<li class="menu-item">
					<div class="tile" onclick="location.href='{$tsConfig.url}/monitor/'">
						<div class="tile-content">Notificaciones</div>
					</div>
				</li>
	         <ul></ul>
	         <a href="{$tsConfig.url}/monitor/" class="ver-mas">Ver m&aacute;s notificaciones</a>
	      </div>
		</item>
		<!-- MENSAJES -->
		<item class="menu-nav mensajes">
			<a class="btn btn-link{if $tsMPs} badge" data-badge="{$tsMPs}"{else}"{/if} onclick="mensaje.last(); return false" name="Mensajes"><span class="lni-envelope size"></span></a>
			<div class="menu" id="mp_list" style="display:none">
				<li class="menu-item">
					<div class="tile" onclick="location.href='{$tsConfig.url}/mensajes/'">
						<div class="tile-content">Mensajes</div>
					</div>
				</li>
				<ul id="boxMail"></ul>
	         <a href="{$tsConfig.url}/mensajes/" class="ver-mas">Ver todos los mensajes</a>
	      </div>
		</item>
		{if $tsUser->is_admod == 1}
		<item class="menu-nav">
	      <a class="btn btn-link{if $tsPage == 'admin'} text-warning{/if}" href="{$tsConfig.url}/admin/"><span class="lni-dashboard size"></span></a>
	   </item>
	   {/if}
		<!-- MENU USUARIO -->
		<item class="menu-nav menu_usuario">
			<a href="#" class="btn btn-link" onclick="menu.last(); return false" name="Menu_usuario">
				<span>
				<figure class="avatar avatar-sm{if $tsAvisos} badge" data-badge="{$tsAvisos}"{else}"{/if}>
				  <img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg" alt="{$tsUser->nick}">
				</figure></span>
			</a>
			<ul class="menu" id="menu_list" style="display:none">
				<li class="menu-item">
					<div class="tile tile-centered">
						<div class="tile-icon"><img class="avatar" src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg" alt="Avatar"></div>
						<div class="tile-content">{$tsUser->nick}</div>
					</div>
				</li>
				<li class="divider"></li>
				<li class="menu-item"><a class="active" href="{$tsConfig.url}/perfil/{$tsUser->info.user_name}">Mi perfil</a></li>
				<li class="menu-item"><a href="{$tsConfig.url}/favoritos.php">Favoritos</a></li>
				<li class="menu-item"><a href="{$tsConfig.url}/borradores.php">Borradores</a></li>
				{if $tsAvisos}
				<li class="menu-item"><a href="{$tsConfig.url}/mensajes/avisos/">Alertas</a>
					<div class="menu-badge">
						<label class="label label-primary">{$tsAvisos}</label>
					</div>
				</li>
				{/if}
				<li class="menu-item"><a href="{$tsConfig.url}/cuenta/">Cuenta</a></li>
				<li class="menu-item"><a href="{$tsConfig.url}/login-salir.php">Salir</a></li>
			</ul>
		</item>
	{/if}
	</section>
</header>
<div class="modal active" id="login_box" style="display: none">
  <a onclick="close_login_box();" class="modal-overlay" aria-label="Close"></a>
  <div class="modal-container">
    <div class="modal-header">
      <a href="#close" class="btn btn-clear float-right" onclick="close_login_box();" aria-label="Close"></a>
      <div class="modal-title h5">Iniciar sesión</div>
    </div>
    <div class="modal-body login_cuerpo">
	      <div class="loading loading-lg gif_cargando" id="login_cargando" style="display: none;"></div>
    	   <div id="login_error" style="display: none; padding:3px 0;"></div>
      <div class="content">
        <form action="javascript:login_ajax()" method="post">
        		<div class="form-group">
	            <label class="form-label">Usuario</label>
	            <input type="text" class="form-input" id="nickname" name="nick" maxlength="64">
	         </div>
            <div class="form-group">
	            <label class="form-label">Contraseña</label>
	            <input type="password" class="form-input" id="password" name="pass" maxlength="64">
	         </div>
            <div class="form-group">
				  	<label class="form-switch" for="rem">
				    	<input type="checkbox" id="rem" name="rem" value="true" checked="checked">
				    	<i class="form-icon"></i> Recordar usuario
				  	</label>
				</div>
	        	<input type="submit" title="Entrar" value="Entrar" class="btn btn-primary">
         </form>
      </div>
    </div>
    <div class="modal-footer">
	   <a href="#" class="btn btn-error btn-sm" onclick="remind_password();">&#191;Olvidaste tu contrase&#241;a?</a>
	  	<a href="#" class="btn btn-primary btn-sm" onclick="resend_validation();">&#191;No lleg&oacute; el correo de validaci&oacute;n?</a>
	  	<a href="#" class="btn btn-success btn-sm" onclick="close_login_box(); registro_load_form(); return false">Crear cuenta!</a>
    </div>
  </div>
</div>