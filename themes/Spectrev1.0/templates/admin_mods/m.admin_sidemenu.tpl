<script type="text/javascript">
var action_menu = '{$tsAction}';
//{literal} <-- no borrar
$(function(){
   if(action_menu != '') $('#' + action_menu).addClass('active');
   else $('#main').addClass('active');
});
</script>
{/literal}
<ul class="nav">
   <li class="nav-item">
      <a href="#">General</a>
      <ul class="nav">
         <li class="nav-item" id="main"><a href="{$tsConfig.url}/admin/">Centro de Administraci&oacute;n</a></li>
         <li class="nav-item" id="creditos"><a href="{$tsConfig.url}/admin/creditos">Soporte y Cr&eacute;ditos</a></li>
      </ul>
   </li>
   <li class="nav-item">
      <a href="#">Configuraci&oacute;n de PHPost</a>
      <ul class="nav">
         <li class="nav-item" id="configs"><a href="{$tsConfig.url}/admin/configs">Configuraci&oacute;n</a></li>
         <li class="nav-item" id="temas"><a href="{$tsConfig.url}/admin/temas">Temas y apariencia</a></li>
         <li class="nav-item" id="news"><a href="{$tsConfig.url}/admin/news">Noticias</a></li>
         <li class="nav-item" id="ads"><a href="{$tsConfig.url}/admin/ads">Publicidad</a></li>
      </ul>
   </li>
   <li class="nav-item">
      <a href="#">Control de PHPost</a>
      <ul class="nav">
         <li class="nav-item" id="medals"><a href="{$tsConfig.url}/admin/medals">Medallas</a></li>
         <li class="nav-item" id="afs"><a href="{$tsConfig.url}/admin/afs">Afiliados</a></li>
         <li class="nav-item" id="stats"><a href="{$tsConfig.url}/admin/stats">Estad&iacute;sticas</a></li>
         <li class="nav-item" id="blacklist"><a href="{$tsConfig.url}/admin/blacklist">Bloqueos</a></li>
         <li class="nav-item" id="badwords"><a href="{$tsConfig.url}/admin/badwords">Censuras</a></li>
      </ul>
   </li>
   <li class="nav-item">
      <a href="#">Control de Contenido</a>
      <ul class="nav">
         <li class="nav-item" id="posts"><a href="{$tsConfig.url}/admin/posts">Todos los Posts</a></li>
         <li class="nav-item" id="fotos"><a href="{$tsConfig.url}/admin/fotos">Todas las Fotos</a></li>
         <li class="nav-item" id="cats"><a href="{$tsConfig.url}/admin/cats">Categor&iacute;as</a></li>
         <li class="nav-item" id="emoticones"><a href="{$tsConfig.url}/admin/emoticones">Emoticones</a></li>
      </ul>
   </li>
   <li class="nav-item">
      <a href="#">Control de Usuarios</a>
      <ul class="nav">
         <li class="nav-item" id="users"><a href="{$tsConfig.url}/admin/users">Todos los Usuarios</a></li>
         <li class="nav-item" id="sesiones"><a href="{$tsConfig.url}/admin/sesiones">Sesiones</a></li>
         <li class="nav-item" id="nicks"><a href="{$tsConfig.url}/admin/nicks">Cambios de Nicks</a></li>
         <li class="nav-item" id="rangos"><a href="{$tsConfig.url}/admin/rangos">Rangos de Usuarios</a></li>
      </ul>
   </li>
</ul>