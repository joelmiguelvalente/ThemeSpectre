var proc = Array();
if(!lang) var lang = Array();
lang['error procesar'] = 'Error al intentar procesar lo solicitado';
lang['posts url categorias'] = 'posts';
lang['comunidades url'] = 'comunidades';
lang['html tema confirma borrar'] = "Seguro que deseas borrar este tema?";

/* Citar comentarios */
function citar_comment(id, nick){
	var textarea = $('#body_comm');
	textarea.focus();
	textarea.val(((textarea.val()!='') ? textarea.val() + '\n' : '') + '[quote=' + nick + ']' + htmlspecialchars_decode($('#citar_comm_'+id).html(), 'ENT_NOQUOTES') + '[/quote]\n');
}

/* Box login */
function open_login_box(action){
	if($('#login_box').css('display') == 'block' && action!='open')
		close_login_box();
	else{
		$('#login_error').css('display','none');
		$('#login_cargando').css('display','none');
		$('.opciones_usuario').addClass('here');
		$('#login_box').fadeIn('fast');
		$('#nickname').focus();
	}
}

function close_login_box(){
	$('.opciones_usuario').removeClass('here');
	$('#login_box').slideUp('fast');
}

function login_ajax(form, connect){
	var el = new Array(), params = '';
	if (form == 'registro-logueo' || form == 'logueo-form') {
		el['nick'] = $('.reg-login .login-panel #nickname');
		el['pass'] = $('.reg-login .login-panel #password');
		el['error'] = $('.reg-login .login-panel #login_error');
		el['cargando'] = $('.reg-login .login-panel #login_cargando');
		el['cuerpo'] = $('.reg-login .login-panel .login_cuerpo');
		el['button'] = $('.reg-login .login-panel input[type="submit"]');
	} else {
		el['nick'] = $('#login_box #nickname');
		el['pass'] = $('#login_box #password');
		el['error'] = $('#login_box #login_error');
		el['cargando'] = $('#login_box #login_cargando');
		el['cuerpo'] = $('#login_box .login_cuerpo');
		el['button'] = $('#login_box input[type="submit"]');
	}
	if (typeof connect != 'undefined') {
		params = 'connect=facebook';
	} else {
		if (empty($(el['nick']).val())) {
			$(el['nick']).focus();
			return;
		}
		if (empty($(el['pass']).val())) {
			$(el['pass']).focus();
			return;
		}
		$(el['error']).css('display', 'none');
		$(el['cargando']).css('display', 'block');
		$(el['button']).attr('disabled', 'disabled').addClass('disabled');
		var remember = ($('#rem').is(':checked')) ? 'true' : 'false';
		params = 'nick='+encodeURIComponent($(el['nick']).val())+'&pass='+encodeURIComponent($(el['pass']).val())+'&rem='+remember;
		if (form == 'logueo-form') {
			params += '&facebook=1';
		}
	}
    $('#loading').fadeIn(250);    
	$.ajax({
		type: 'post', url: global_data.url + '/login-user.php', cache: false, data: params,
		success: function (h) {
			switch(h.charAt(0)){
				case '0':
					$(el['error']).html(h.substring(3)).show();
					$(el['nick']).focus();
					$(el['button']).removeAttr('disabled').removeClass('disabled');
					break;
				case '1':
					if (form != 'registro-logueo') {
						close_login_box();
					}
					if (h.substring(3)=='Home') {
						location.href='/';
					} else if (h.substr(3) == 'Cuenta') {
						location.href = '/cuenta/';
					} else {
						location.reload();
					}
                    $('#loading').fadeOut(350);
					break;
				case '2':
					$(el['cuerpo']).css('text-align', 'center').css('line-height', '150%').html(h.substring(3));
					break;
				case '3':
					open_login_box();
					mydialog.class_aux = 'registro';
					mydialog.mask_close = false;
					mydialog.close_button = true;
					mydialog.show(true);
					mydialog.title('Ingresar');
					mydialog.body('<br /><br />', 305);
					mydialog.buttons(false);
					mydialog.procesando_inicio('Cargando...', 'Registro');
					mydialog.center();
					$.ajax({
						type: 'POST',
						url: global_data.url + '/login-form.php',
						data: '',
						success: function(h){
							mydialog.procesando_fin();
							switch(h.charAt(0)){
								case '0':
									mydialog.alert('Error', h.substring(3));
									break;
								case '1':
									mydialog.body(h.substring(3), 305);
							}
							mydialog.center();
						}
					});

			}
		},
		error: function() {
			$(el['error']).html(lang['error procesar']).show();
		},
		complete: function(){
			$(el['cargando']).css('display', 'none');
		}
	});
}

function actualizar_comentarios(cat, nov){
    $('#loading').fadeIn(250);
	$('#ult_comm, #ult_comm > ol').slideUp(150);
	$.ajax({
		type: 'GET',
		url: global_data.url + '/posts-last-comentarios.php',
		cache: false,
		data: 'cat='+cat+'&nov='+nov,
		success: function(h){
			$('#ult_comm').html(h);
			$('#ult_comm > ol').hide();
			$('#ult_comm, #ult_comm > ol:first').slideDown( 1500, 'easeInOutElastic');
         $('#loading').fadeOut(350);
		},
		error: function(){
			$('#ult_comm, #ult_comm > ol:first').slideDown({duration: 1000, easing: 'easeOutBounce'});
            $('#loading').fadeOut(350);
		}
	});
}











function error_avatar(obj, id, size){
	if (typeof id == 'undefined' || typeof size == 'undefined') obj.src = global_data.img + 'images/avatar.gif';
	else obj.src = global_data.img + 'images/a'+ size + '_' + (id % 10) + '.jpg';
}

function set_checked(obj){
	document.getElementById(obj).checked=true;
}
function is_checked(obj){
	return document.getElementById(obj) && document.getElementById(obj).checked;
}

/* Change Country */
function change_country(prefix){
	var site = global_data.ts_domain;
	document.cookie='site_prefix='+prefix+';expires=Thu, 26 Dec 2020 16:12:48 GMT;path=/;SameSite=None;domain=.'+site;
	if(prefix=='la')
		prefix = 'www';
	window.location = 'http://'+prefix+'.'+site;
}
/* FIN - Change Country */

//Imprimir editores
function print_editor(){
   //Editor de posts
   if($('#markItUp').length && !$('.wysibb-texarea').length || $('#wysibb').length && !$('.wysibb-texarea').length){
      $('#markItUp, #wysibb').removeAttr('onblur onfocus class').css('height', '400').addClass('required').wysibb();
   }
   //Editor de posts comentarios
   if($('#body_comm').length && !$('.wysibb-texarea').length){
      var wbbOpt = { buttons: "smilebox,|,bold,italic,underline,strike,sup,sub,|,img,video,link" }
      $('#body_comm').removeAttr('onblur onfocus class style title').css('height', '80').html('').wysibb(wbbOpt);
   }
   //Editor de respuesta de mensajes
   if($('#respuesta').length && !$('.wysibb-texarea').length){
      var wbbOpt = { buttons: "smilebox,|,bold,italic,underline,strike" }
      $('#respuesta').removeAttr('onblur onfocus class style title').css('height', '80').html('').wysibb(wbbOpt);
   }
}

var monitor_sections_here = 'Comentarios';
function monitor_sections(section, userid){
	if(!section) //Recargando por 500
		section = monitor_sections_here;
	else if(monitor_sections_here==section)
		return;
	$('.filterBy #'+monitor_sections_here).removeClass('here');
	monitor_sections_here = section;
	$('.filterBy #'+section).addClass('here');
	$('.gif_cargando').css('display', 'block');
    $('#loading').fadeIn(250);
	$.ajax({
		type: 'GET',
		url: global_data.url + '/monitor.php',
		data: 'section='+section+'&ajax=1'+(userid?'&id='+userid:''),
		success: function(h){
			switch(h.charAt(0)){
				case '0': //Error
					$('#showResult').html('<div class="warningData">'+$('#showResult').html(h.substring(3))+'</div>');
					break;
				case '1': //OK
					$('#showResult').html(h.substring(3));
					break;
			}
            $('#loading').fadeOut(350);
		},
		error: function(){
			$('#showResult').html('<div class="emptyData">'+lang['error procesar']+'. <a href="javascript:monitor_sections(\''+section+'\', \''+userid+'\')">Reintentar</a></div>');
            $('#loading').fadeOut(450);
        },
		complete: function(){
			$('.gif_cargando').css('display', 'none');
            $('#loading').fadeOut(450);
		}
	});
}

function gget(data, sin_amp){
	var r = data+'=';
	if(!sin_amp)
		r = '&'+r;
	switch(data){
		case 'key':
			if(global_data.user_key!='')
				return r+global_data.user_key;
			break;
		case 'postid':
			if(global_data.postid!='')
				return r+global_data.postid;
			break;
		case 'fotoid':
			if(global_data.fotoid!='')
				return r+global_data.fotoid;
			break;
		case 'temaid':
			if(global_data.temaid!='')
				return r+global_data.temaid;
			break;
	}
	return '';
}
function keypress_intro(e){
  tecla=(document.all)?e.keyCode:e.which;
  return (tecla==13);
}

function onfocus_input(o){
	if($(o).val()==$(o).attr('title')){
		$(o).val('');
		$(o).removeClass('onblur_effect');
	}
}
function onblur_input(o){
	if($(o).val()==$(o).attr('title') || $(o).val()==''){
		$(o).val($(o).attr('title'));
		$(o).addClass('onblur_effect');
	}
}
var form_ff = 0;
//Cargo el formulario
function registro_load_form(data){
	if (typeof data == 'undefined') {
		var data = '';
	}
	mydialog.class_aux = 'registro';
	mydialog.mask_close = false;
	mydialog.close_button = true;
	mydialog.show(true);
	mydialog.title('Registro');
	mydialog.body('<br /><br />', 305);
	mydialog.buttons(false);
	mydialog.procesando_inicio('Cargando...', 'Registro');
	mydialog.center();
    $('#loading').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: global_data.url + '/registro-form.php?ts=false',
		data: data,
		success: function(h){
			switch(h.charAt(0)){
				case '0': //Error
					mydialog.procesando_fin();
					mydialog.alert('Error', h.substring(3));
					break;
				case '1': //OK. Ya es miembro
					mydialog.body(h.substring(3), 305);
					// TUBE PROBLEMAS CON FIREFOX 4 Y ESTE ES EL HACK QUE LO SOLUCIONO :D
					if($.browser.mozilla && form_ff == 0) { registro_load_form(data); form_ff++;}
					break;
			}
            $('#loading').fadeOut(350);
			mydialog.center();
		},
		error: function(){
			mydialog.procesando_fin();
			mydialog.error_500("registro.load_form("+data+")");
            $('#loading').fadeOut(350);
		}
	});
}

//Calcula la edad a partir de la fecha de nacimiento
function edad(mes, dia, anio){
	//Calcular edad
	now = new Date()
	born = new Date(anio, mes*1-1, dia);
	years = Math.floor((now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
	return years;
}

function my_number_format(numero){
	return Number(numero).toLocaleString();
}
function bloquear(user, bloqueado, lugar, aceptar){
	if(!aceptar && bloqueado){
		mydialog.show();
		mydialog.title('Bloquear usuario');
		mydialog.body('&iquest;Realmente deseas bloquear a este usuario?');
		mydialog.buttons(true, true, 'SI', "bloquear('"+user+"', true, '"+lugar+"', true)", true, false, true, 'NO', 'close', true, true);
		mydialog.center();
		return;
	}
	if(bloqueado)
		mydialog.procesando_inicio('Procesando...', 'Bloquear usuario');
        $('#loading').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: global_data.url + '/bloqueos-cambiar.php',
		data: 'user='+user+(bloqueado ? '&bloquear=1' : '')+gget('key'),
		success: function(h){
			mydialog.alert('Bloquear Usuarios', h.substring(3));
            //
            if(h.charAt(0) == 1){
    			switch(lugar){
    				case 'perfil':
    					if(bloqueado)
    						$('#bloquear_cambiar').html('Desbloquear').removeClass('btn-success').addClass('btn-error').attr('href', "javascript:bloquear('"+user+"', false, '"+lugar+"')");
    					else
    						$('#bloquear_cambiar').html('Bloquear').removeClass('btn-error').addClass('btn-success').attr('href', "javascript:bloquear('"+user+"', true, '"+lugar+"')");
    					break;
    				case 'respuestas':
    				case 'comentarios':
    					if (bloqueado) {
    						$('li.desbloquear_'+user).show();
    						$('li.bloquear_'+user).hide();
    					}
    					else {
    						$('li.bloquear_'+user).show();
    						$('li.desbloquear_'+user).hide();
    					}
    					break;
    				case 'mis_bloqueados':
    					if(bloqueado)
    						$('.bloquear_usuario_'+user).attr('title', 'Desbloquear Usuario').removeClass('btn-success').addClass('btn-error').html('Desbloquear').attr('href', "javascript:bloquear('"+user+"', false, '"+lugar+"')");
    					else
    						$('.bloquear_usuario_'+user).attr('title', 'Bloquear Usuario').removeClass('btn-error').addClass('btn-success').html('Bloquear').attr('href', "javascript:bloquear('"+user+"', true, '"+lugar+"')");
    				break;
               case 'mensajes':
    					if(bloqueado)
    						$('#bloquear_cambiar').html('Desbloquear').attr('href', "javascript:bloquear('"+user+"', false, '"+lugar+"')");
    					else
    						$('#bloquear_cambiar').html('Bloquear').attr('href', "javascript:bloquear('"+user+"', true, '"+lugar+"')");
               break;
    			}
            }
            $('#loading').fadeOut(350);
		},
		error: function(){
			mydialog.error_500("bloquear('"+user+"', '"+bloqueado+"', '"+lugar+"', true)");
            $('#loading').fadeOut(350);
		},
		complete: function(){
			mydialog.procesando_fin();
            $('#loading').fadeOut(350);
		}
	});
}

function muro_add(userid){
	$('.muro #add #error').hide();
	if($('#muro-mensaje').val()==$('#muro-mensaje').attr('title')){
		$('#muro-mensaje').focus();
		return;
	}
    $('#loading').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: '/muro-agregar.php',
		data: 'userid='+userid+'&mensaje='+encodeURIComponent($('#muro-mensaje').val())+gget('key'),
		success: function(h){
			switch(h.charAt(0)){
				case '0': //Error
					$('.muro #add #error').html(h.substring(3)).show();
					break;
				case '1': //OK
					mydialog.alert('OK', h.substring(3));
					break;
			}
            $('#loading').fadeOut(350);
		},
		error: function(){	
			mydialog.error_500("muro_add('"+userid+"')");
            $('#loading').fadeOut(350);
		}
	});
}
function muro_status(msgid, userid, borrar){
    $('#loading').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: '/muro-status.php',
		data: 'msgid='+msgid + (userid ? '&userid='+userid : '') + gget('key') + (borrar ? '&borrar=1' : ''),
		success: function(h){
			switch(h.charAt(0)){
				case '0': //Error
					mydialog.alert('Error', h.substring(3));
					break;
				case '1': //OK
					mydialog.alert('OK', h.substring(3));
					break;
			}
            $('#loading').fadeOut(350);
		},
		error: function(){	
			mydialog.error_500("muro_status('"+msgid+"', '"+userid+"', '"+borrar+"')");
            $('#loading').fadeOut(350);
		}
	});
}

/* MyDialog */
var mydialog = {

is_show: false,
class_aux: '',
mask_close: true,
close_button: false,
show: function(class_aux){
	if(this.is_show)
		return;
	else
		this.is_show = true;
	if($('#mydialog').html() == '') //Primera vez
		$('#mydialog').html('<div class="modal active" id="dialog"><a href="#close" class="modal-overlay" aria-label="Close" onclick="mydialog.close()"></a><div class="modal-container"><div class="modal-header"><a href="#close" onclick="mydialog.close()" class="btn btn-clear float-right" aria-label="Close"></a><div class="modal-title h5" id="title"></div></div><div class="modal-body" id="cuerpo"><div id="procesando"><div id="mensaje"></div></div><div class="content" id="modalBody"></div></div><div class="modal-footer" id="buttons"></div></div></div>');

	if(class_aux==true)
		$('#mydialog').addClass(this.class_aux);
	else if(this.class_aux != ''){
		$('#mydialog').removeClass(this.class_aux);
		this.class_aux = '';
	}

	$('#mydialog #dialog').fadeIn('fast');
},
close: function(){
	//Vuelve todos los parametros por default
	this.class_aux = '';
	this.mask_close = true;
	this.is_show = false;
	$('#mask').css('display', 'none');
	$('#mydialog #dialog').fadeOut('fast', function(){ $(this).remove() });
	this.procesando_fin();
},
center: function(){},

title: function(title){
	$('#mydialog #title').html(title);
},
body: function(body, width, height){
	$('#mydialog #modalBody').html(body);
},
buttons: function(display_all, btn1_display, btn1_val, btn1_action, btn1_enabled, btn1_focus, btn2_display, btn2_val, btn2_action, btn2_enabled, btn2_focus){
	if(!display_all){
		$('#mydialog #buttons').css('display', 'none').html('');
		return;
	}

	if(btn1_action=='close')
		btn1_action='mydialog.close()';
	if(btn2_action=='close' || !btn2_val)
		btn2_action='mydialog.close()';
	if(!btn2_val){
		btn2_val = 'Cancelar';
		btn2_enabled = true;
	}

	var html = '';
	if(btn1_display)
		html += '<input type="button" class="btn btn-success'+(btn1_enabled?'':' disabled')+'" style="display:'+(btn1_display?'inline-block':'none')+'"'+(btn1_display?' value="'+btn1_val+'"':'')+(btn1_display?' onclick="'+btn1_action+'"':'')+(btn1_enabled?'':' disabled')+' />';
	if(btn2_display)
		html += ' <input type="button" class="btn btn-error'+(btn1_enabled?'':' disabled')+'" style="display:'+(btn2_display?'inline-block':'none')+'"'+(btn2_display?' value="'+btn2_val+'"':'')+(btn2_display?' onclick="'+btn2_action+'"':'')+(btn2_enabled?'':' disabled')+' />';
	$('#mydialog #buttons').html(html).css('display', 'inline-block');

	if(btn1_focus)
		$('#mydialog #buttons .btn.btn-success').focus();
	else if(btn2_focus)
		$('#mydialog #buttons .btn.btn-error').focus();
},
buttons_enabled: function(btn1_enabled, btn2_enabled){
	if($('#mydialog #buttons .btn.btn-success'))
		if(btn1_enabled)
			$('#mydialog #buttons .btn.btn-success').removeClass('disabled').removeAttr('disabled');
		else
			$('#mydialog #buttons .btn.btn-success').addClass('disabled').attr('disabled', 'disabled');

	if($('#mydialog #buttons .btn.btn-error'))
		if(btn2_enabled)
			$('#mydialog #buttons .btn.btn-error').removeClass('disabled').removeAttr('disabled');
		else
			$('#mydialog #buttons .btn.btn-error').addClass('disabled').attr('disabled', 'disabled');
},
alert: function(title, body, reload){
	this.show();
	this.title(title);
	this.body(body);
	this.buttons(true, true, 'Aceptar', 'mydialog.close();' + (reload ? 'location.reload();' : 'close'), true, true, false);
	this.center();
},
error_500: function(fun_reintentar){
	setTimeout(function(){
		mydialog.procesando_fin();
		mydialog.show();
		mydialog.title('Error');
		mydialog.body(lang['error procesar']);
		mydialog.buttons(true, true, 'Reintentar', 'mydialog.close();'+fun_reintentar, true, true, true, 'Cancelar', 'close', true, false);
		mydialog.center();
	}, 200);
},
procesando_inicio: function(value, title){
	if(!this.is_show){
		this.show();
		this.title(title);
		this.body('');
		this.buttons(false, false);
		this.center();
	}
	$('#mydialog #procesando #mensaje').html('<center><div class="loading loadin-lg"></div></center>');
	$('#mydialog #procesando').fadeIn('fast');
},
procesando_fin: function(){
	$('#mydialog #procesando').fadeOut('fast');
}

};


document.onkeydown = function(e){
	key = (e==null)?event.keyCode:e.which;
	if(key == 27) //escape, close mydialog
		mydialog.close();
};
/* FIN DEL MODAL */


$(document).ready(function(){
	$('body').click(function(e){ 
	   if ($('#mon_list').css('display') != 'none' && $(e.target).closest('#mon_list').length == 0 && $(e.target).closest('a[name=Monitor]').length == 0) notifica.last();
      if ($('#mp_list').css('display') != 'none' && $(e.target).closest('#mp_list').length == 0 && $(e.target).closest('a[name=Mensajes]').length == 0) mensaje.last(); 
   });
	print_editor();
});

// hoverIntent by Brian Cherne
(function($){$.fn.hoverIntent=function(f,g){var cfg={sensitivity:7,interval:100,timeout:0};cfg=$.extend(cfg,g?{over:f,out:g}:f);var cX,cY,pX,pY;var track=function(ev){cX=ev.pageX;cY=ev.pageY;};var compare=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);if((Math.abs(pX-cX)+Math.abs(pY-cY))<cfg.sensitivity){$(ob).off("mousemove",track);ob.hoverIntent_s=1;return cfg.over.apply(ob,[ev]);}else{pX=cX;pY=cY;ob.hoverIntent_t=setTimeout(function(){compare(ev,ob);},cfg.interval);}};var delay=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);ob.hoverIntent_s=0;return cfg.out.apply(ob,[ev]);};var handleHover=function(e){var p=(e.type=="mouseover"?e.fromElement:e.toElement)||e.relatedTarget;while(p&&p!=this){try{p=p.parentNode;}catch(e){p=this;}}if(p==this){return false;}var ev=jQuery.extend({},e);var ob=this;if(ob.hoverIntent_t){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);}if(e.type=="mouseover"){pX=ev.pageX;pY=ev.pageY;$(ob).on("mousemove",track);if(ob.hoverIntent_s!=1){ob.hoverIntent_t=setTimeout(function(){compare(ev,ob);},cfg.interval);}}else{$(ob).off("mousemove",track);if(ob.hoverIntent_s==1){ob.hoverIntent_t=setTimeout(function(){delay(ev,ob);},cfg.timeout);}}};return this.mouseover(handleHover).mouseout(handleHover);};})(jQuery);

var notifica = {

	cache: {},
	retry: Array(),
	userMenuPopup: function (obj) {
		var id = $(obj).attr('userid');
		var cache_id = 'following_'+id, list = $(obj).children('ul');
		$(list).children('li.check').slideUp();
		if (this.cache[cache_id] == 1) {
			$(list).children('li.follow').slideUp();
			$(list).children('li.unfollow').slideDown();
		}
		else {
			$(list).children('li.unfollow').slideUp();
			$(list).children('li.follow').slideDown();
		}
	},
    userInMencionHandle: function(r){
		var x = r.split('-');
		if (x.length == 3 && x[0] == 0) {
            var fid = x[1];
			$('a.mf_' + fid +', a.mf_' + fid).each(function(){
                $(this).toggle();
            });
			$('.mft_' + fid).html(number_format(parseInt(x[2])));
            vcard_cache['mf' + fid] = '';
		}
		else if (x.length == 4) mydialog.alert('Notificaciones', x[3]);  
    },
	userMenuHandle: function (r) {
		var x = r.split('-');
		if (x.length == 3 && x[0] == 0) {
			var cache_id = 'following_'+x[1];
			notifica.cache[cache_id] = parseInt(x[0]);
			$('div.avatar-box').children('ul').hide();
		}
		else if (x.length == 4) mydialog.alert('Notificaciones', x[4]);
	},
	userInPostHandle: function (r) {
		var x = r.split('-');
		if (x.length == 3 && x[0] == 0) {
			$('a.follow_user_post, a.unfollow_user_post').toggle();
			$('div.metadata-usuario > span.nData.user_follow_count').html(number_format(parseInt(x[2])));
			notifica.userMenuHandle(r);
		}
		else if (x.length == 4) mydialog.alert('Notificaciones', x[3]);
	},
	userInMonitorHandle: function (r, obj) {
		var x = r.split('-');
		if (x.length == 3 && x[0] == 0) $(obj).fadeOut(function(){ $(obj).remove(); });
		else if (x.length == 4) mydialog.alert('Notificaciones', x[3]);	
	},
	inPostHandle: function (r) {
		var x = r.split('-');
		if (x.length == 3 && x[0] == 0) {
			$('a.follow_post, a.unfollow_post').parent('li').toggle();
			$('ul.post-estadisticas > li > span.icons.monitor').html(number_format(parseInt(x[2])));
		}
		else if (x.length == 4) mydialog.alert('Notificaciones', x[3]);
	},
	inComunidadHandle: function (r) {
		var x = r.split('-');
		if (x.length == 3 && x[0] == 0) {
			$('a.follow_comunidad, a.unfollow_comunidad').toggle();
			$('li.comunidad_seguidores').html(number_format(parseInt(x[2]))+' Seguidores');
		}
		else if (x.length == 4) mydialog.alert('Notificaciones', x[3]);
	},
	temaInComunidadHandle: function (r) {
		var x = r.split('-');
		if (x.length == 3 && x[0] == 0) {
			$('div.followBox > a.follow_tema, a.unfollow_tema').toggle();
			$('span.tema_notifica_count').html(number_format(parseInt(x[2]))+' Seguidores');
		}
		else if (x.length == 4) mydialog.alert('Notificaciones', x[3]);
	},
	ruserInAdminHandle: function (r) {
		var x = r.split('-');
		if (x.length == 3 && x[0] == 0) $('.ruser'+x[1]).toggle();
		else if (x.length == 4) mydialog.alert('Notificaciones', x[3]);	
	},
	listInAdminHandle: function (r) {
		var x = r.split('-');
		if (x.length == 3 && x[0] == 0) {
			$('.list'+x[1]).toggle();
			$('.list'+x[1]+':first').parent('div').parent('li').children('div:first').fadeTo(0, $('.list'+x[1]+':first').css('display') == 'none' ? 0.5 : 1);
		}
		else if (x.length == 4) mydialog.alert('Notificaciones', x[3]);	
	},
	spamPostHandle: function (r) {
		var x = r.split('-');
		if (x.length == 2) mydialog.alert('Notificaciones', x[1]);
		else mydialog.close();
	},
	spamTemaHandle: function (r) {
		var x = r.split('-');
		if (x.length == 2) mydialog.alert('Notificaciones', x[1]);
		else mydialog.close();
	},
	ajax: function (param, cb, obj) {
		if ($(obj).hasClass('spinner')) return;
		notifica.retry.push(param);
		notifica.retry.push(cb);
		var error = param[0]!='action=count';
		$(obj).addClass('spinner');
        $('#loading').fadeIn(250);
		$.ajax({
			url: global_data.url + '/notificaciones-ajax.php', type: 'post', data: param.join('&')+gget('key'),
			success: function (r) {
				$(obj).removeClass('spinner');
				cb(r, obj);
                $('#loading').fadeOut(350);
			},
			error: function () {
				if (error) mydialog.error_500('notifica.ajax(notifica.retry[0], notifica.retry[1])');
                $('#loading').fadeOut(350);                
			}
		});
	},
	follow: function (type, id, cb, obj) {
		this.ajax(Array('action=follow', 'type='+type, 'obj='+id), cb, obj);
	},
	unfollow: function (type, id, cb, obj) {
		this.ajax(Array('action=unfollow', 'type='+type, 'obj='+id), cb, obj);
	},
	spam: function (id, cb) {
		this.ajax(Array('action=spam', 'postid='+id), cb);
	},
	c_spam: function (id, cb) {
		this.ajax(Array('action=c_spam', 'temaid='+id), cb);
	},
	sharePost: function (id) {
		mydialog.show();
		mydialog.title('Recomendar');
		mydialog.body('¿Quieres recomendar este post a tus seguidores?');
		mydialog.buttons(true, true, 'Recomendar', 'notifica.spam('+id+', notifica.spamPostHandle)', true, true, true, 'Cancelar', 'close', true, false);
		mydialog.center();
	},
	shareTema: function (id) {
		mydialog.show();
		mydialog.title('Recomendar');
		mydialog.body('¿Quieres recomendar este tema a tus seguidores?');
		mydialog.buttons(true, true, 'Recomendar', 'notifica.c_spam('+id+', notifica.spamTemaHandle)', true, true, true, 'Cancelar', 'close', true, false);
		mydialog.center();
	},
	last: function () {
		var c = parseInt($('#alerta_mon > a > span').html());
		mensaje.close();
      menu.close();
		if ($('#mon_list').css('display') != 'none') {
			$('#mon_list').hide();
			$('a[name=Monitor]').parent('item').removeClass('monitor-notificaciones');
		} else {
			if (($('#mon_list').css('display') == 'none' && c > 0) || typeof mensaje.cache.last == 'undefined') {
				$('a[name=Monitor]').children('span').addClass('loading');
				$('#mon_list').show();
				notifica.ajax(Array('action=last'), function (r) {
					notifica.cache['last'] = r;
					notifica.show();
				});
			}
			else notifica.show();
		}
	},
	check: function () {
		notifica.ajax(Array('action=count'), notifica.popup);
	},
	popup: function (r) {
		var c = parseInt($('#alerta_mon > a > span').html());
		if (r != c && r > 0) {
			if (r != 1) var not_total = ' notificaciones'; else var not_total = ' notificaci&oacute;n';
		}
		else if (r == 0) $('#alerta_mon').remove();
	},
	show: function () {
		if (typeof notifica.cache.last != 'undefined') {
			$('a[name=Monitor]').children('span').removeClass('loading');
			$('#mon_list').show().children('ul').html(notifica.cache.last);
		}
	},
	filter: function (x, obj) {
		$.ajax({
			url: global_data.url + '/notificaciones-filtro.php', 
			type: 'post', 
			data: 'fid=' + x
		});
       var v = $(obj).prop('checked') ? 1 : 0; 	   
	},
    close: function(){
		$('#mon_list').hide();
		$('a[name=Monitor]').parent('item').removeClass('monitor-notificaciones');   
    }
	
}
/* Mensajes */

var mensaje = {
    cache: {},
    vars: Array(),
    // CREAR HTML
    form: function (){
         var html = '';
        if(this.vars['error']) html += '<div class="emptyData">' + this.vars['error'] + '</div><br style="clear:both">'
        html += '<div class="form-group">Para:'
        html += '<input type="text" value="' + this.vars['to'] + '" class="form-input" maxlength="16" tabindex="0" size="20" id="msg_to" name="msg_to"/> <span style="font-size: 10px;">(Ingrese el nombre de usuario)</span></div>'
        html += '<div class="form-group">Asunto:'
        html += '<input type="text" value="' + this.vars['sub'] + '" class="form-input" maxlength="100" tabindex="0" size="50" id="msg_subject" name="msg_subject"/></div>'
        html += '<div class="form-group">Mensaje:'
        html += '<textarea tabindex="0" rows="10" id="msg_body" class="form-input" name="msg_body" style="height:100px;">' + this.vars['msg'] + '</textarea></div>'
        return html;                          
    },
    // FUNCIONES AUX
    checkform: function (h){
        if(parseInt(h) == 0)
            mensaje.enviar(1);
        else if(parseInt(h) == 1) {
            mensaje.nuevo(mensaje.vars['to'], mensaje.vars['sub'], mensaje.vars['msg'], 'No es posible enviarse mensajes a s&iacute; mismo.');
        } else if(parseInt(h) == 2) {
            mensaje.nuevo(mensaje.vars['to'], mensaje.vars['sub'], mensaje.vars['msg'], 'Este usuario no existe. Por favor, verif&iacute;calo.');
        }    
    },
    alert: function(h){
      mydialog.procesando_fin();
      mydialog.alert('Aviso','<div class="emptyData">' + h + '</div>');  
    },
    mostrar: function(show, obj){
        //
        $('.GBTabset a').removeClass('here');
        //
        if(show == 'all'){
            $('#mensajes div').show();
            $(obj).addClass('here');
        } else if(show == 'unread'){
            $('#mensajes div.GBThreadRow').hide();
            $('#mensajes table.unread').parent().show();
            $(obj).addClass('here');
        }
    },
    select: function(act){
        //
        var inputs = $('#mensajes .GBThreadRow :input');
        inputs.each(function(){
           if(act == 'all'){
            $(this).attr({checked: 'checked'});
           } else if(act == 'read'){
                if($(this).attr('class') != 'inread'){
                    $(this).attr({checked: 'checked'});
                } else $(this).attr({checked: ''});
           } else if(act == 'unread'){
                if($(this).attr('class') == 'inread'){
                    $(this).attr({checked: 'checked'});
                } else $(this).attr({checked: ''});                
           } else if(act == 'none'){
            $(this).attr({checked: ''});
           }
        });
    },
    modificar: function(act){
        var inputs = $('#mensajes .GBThreadRow :input');
        var ids = new Array();
        var i = 0;
        //
        inputs.each(function(){
            var este = $(this).prop('checked');
            //
            if(este != false){
                // AGREGAR EL ID
                ids[i] = $(this).val();
                i++;
                // PARA LOS ESTILOS
                var cid = $(this).val().split(':');
                // MARCAR LEIDO
                if(act == 'read'){
                    $('#' + cid[0]).removeClass('unread');
                    $(this).removeClass('inread');
                // MARCAR NO LEIDO
                } else if(act == 'unread'){
                    $('#' + cid[0]).addClass('unread');
                    $(this).addClass('inread');
                // ELIMINAR
                } else if(act == 'delete'){
                    $('#' + cid[0]).parent().remove();
                }
            }
        });
        // ENVIAR CAMBIOS
        if(ids.length > 0){
            var params = ids.join(',');
            mensaje.ajax('editar','ids=' + params + '&act=' + act,function(r){
                //
            });   
        }
    },
    eliminar: function(id,type){
        mensaje.ajax('editar','ids=' + id + '&act=delete',function(r){
            if(type == 1){
                var cid = id.split(':');
                $('#mp_' + cid[0]).remove();
             }else if(type == 2){
                location.href = global_data.url + '/mensajes/';
             }
        });
    },
    marcar: function(id, a, type, obj){
        var act = (a == 0) ? 'read' : 'unread';
        var show = (act == 'read') ? 'unread' : 'read';
        
        //
        mensaje.ajax('editar','ids=' + id + '&act=' + act,function(r){
            // CAMBIAR ENTRE LEIDO Y NO LEIDO
            if(type == 1){
                var cid = id.split(':');
                if(act == 'read')
                $('#mp_' + cid[0]).removeClass('unread');
                else 
                $('#mp_' + cid[0]).addClass('unread');
                //
                $(obj).parent().find('a').hide();
                $(obj).parent().find('.' + show).show();
             } else {
                location.href = global_data.url + '/mensajes/';
             }
        });
    },
    // POST
    ajax: function(action, params, fn){
        $('#loading').fadeIn(250);
        $.ajax({
    		type: 'POST',
    		url: global_data.url + '/mensajes-' + action + '.php',
    		data: params,
    		success: function(h){
                fn(h);
                $('#loading').fadeOut(350);                
    		}
    	});
    },
    // PREPARAR EL ENVIO
	nuevo: function (para, asunto, body, error){
        // GUARDAR
        this.vars['to'] = para;
        this.vars['sub'] = asunto;
        this.vars['msg'] = body;
        this.vars['error'] = error;
        //
        mydialog.procesando_fin();
		mydialog.show(true);
		mydialog.title('Nuevo mensaje');
		mydialog.body(this.form());
		mydialog.buttons(true, true, 'Enviar', '$(\'.wysibb-texarea\').sync(); mensaje.enviar(0)', true, true, true, 'Cancelar', 'close', true, false);
        var wbbOpt = { resize_maxheight: 170, buttons: "smilebox,|,bold,italic,underline,strike,sup,sub,|,img,video,link,|,removeFormat" }
        $('#msg_body').wysibb(wbbOpt);
        mydialog.center();
	},
    // ENVIAR...
    enviar: function (enviar){
        // DATOS
        this.vars['to'] = $('#msg_to').val();
        this.vars['sub'] = encodeURIComponent($('#msg_subject').val()); // FIX: 14/12/2014 - 1.1.000.9
        this.vars['msg'] = encodeURIComponent($('#msg_body').val()); // FIX: 14/12/2014 - 1.1.000.9
        // COMPROBAR
        if(enviar == 0){ // VERIFICAR...
            if(this.vars['to'] == '')
                mensaje.nuevo(mensaje.vars['to'], mensaje.vars['sub'], mensaje.vars['msg'], 'Por favor, especific&aacute; el destinatario.');
            if(this.vars['msg'] == '')
                mensaje.nuevo(mensaje.vars['to'], mensaje.vars['sub'], mensaje.vars['msg'], 'El mensaje esta vac&iacute;o.');
            //
            mydialog.procesando_inicio('Verificando...', 'Nuevo Mensaje');
            this.ajax('validar', 'para=' + this.vars['to'], mensaje.checkform);

        } else if(enviar == 1){
            mydialog.procesando_inicio('Enviando...', 'Nuevo Mensaje');
            // ENVIAR
            this.ajax('enviar', 'para=' + mensaje.vars['to'] + '&asunto=' + mensaje.vars['sub'] + '&mensaje=' + mensaje.vars['msg'], mensaje.alert);
        }
    },
    // RESPONDER
    responder: function(mp_id){
        this.vars['mp_id'] = $('#mp_id').val();
        this.vars['mp_body'] = encodeURIComponent($('#respuesta').bbcode()); // Fix: 06/05/2018 - 1.3
        if(this.vars['mp_body'] == '') {
            $('#respuesta').focus();
            return;
        }
        //
        this.ajax('respuesta','id=' + this.vars['mp_id'] + '&body=' + this.vars['mp_body'], function(h){
            $('#respuesta').val(''); // LIMPIAMOS
            $('.wysibb-body').html('');
            switch(h.charAt(0)){
                case '0':
                    mydialog.alert("Error", h.substring(3));
                break;
                case '1':
					$('#historial').append($(h.substring(3)).fadeIn('slow'));
                break;
            }
            $('#respuesta').focus();
        });
    },
	last: function () {
		var c = parseInt($('#alerta_mps > a > span').html());
      notifica.close();
      menu.close();
		if ($('#mp_list').css('display') != 'none') {
			$('#mp_list').hide();
			$('a[name=Mensajes]').parent('item').removeClass('monitor-notificaciones');
		} else {
			if (($('#mp_list').css('display') == 'none' && c > 0) || typeof mensaje.cache.last == 'undefined') {
				$('a[name=Mensajes]').children('span').addClass('loading');
				$('#mp_list').show();
				mensaje.ajax('lista', '', function (r) {
					mensaje.cache['last'] = r;
					mensaje.show();
				});
			}
			else mensaje.show();
		}
	},
	popup: function (mps) {
		var c = parseInt($('#alerta_mps > a > span').html());
		if (mps != c && mps > 0) {
         if (mps != 1) var mps_total = ' mensajes'; else var mps_total = ' mensaje';
      }
		else if (mps == 0) $('#alerta_mps').remove();
	},
	show: function () {
		if (typeof mensaje.cache.last != 'undefined') {
			$('a[name=Mensajes]').children('span').removeClass('loading');
			$('#mp_list').show().children('ul').html(mensaje.cache.last);
		}
	},
   close: function(){
      $('#mp_list').slideUp();
      $('a[name=Mensajes]').parent('item').removeClass('monitor-notificaciones');
   }
}
var menu = {
   cache: {},
	last: function () {
      notifica.close();
      mensaje.close();
		if ($('#menu_list').css('display') != 'none') {
			$('#menu_list').hide();
		} else {
			if (typeof menu.cache.last == 'undefined') {
				$('#menu_list').show();
			}
			else menu.show();
		}
	},
	show: function () {
		if (typeof menu.cache.last != 'undefined') {
		}
	},
   close: function(){
      $('#menu_list').slideUp();
      $('a[name=Menu_usuario]').parent('item').removeClass('monitor-notificaciones');
   }
}
var timelib = {
	current: false,
	iupd: 60,
	timetowords: function (x) {
		if (!this.current) return r;
		var r = false;
		var t = {
			s: {
				year: 'M&aacute;s de 1 a&ntilde;o',
				month: 'M&aacute;s de 1 mes',
				day: 'Ayer',
				hour: 'Hace 1 hora',
				minute: 'Hace 1 minuto',
				second: 'Menos de 1 minuto'
			},
			p: {
				year: 'M&aacute;s de $1 a&ntilde;os',
				month: 'M&aacute;s de $1 meses',
				day: 'Hace $1 d&iacute;as',
				hour: 'Hace $1 horas',
				minute: 'Hace $1 minutos',
				second: 'Menos de 1 minuto'
			}
		};
		var n = this.current - x;
		var d = { year: 31536000, month: 2678400, day: 86400, hour: 3600, minute: 60, second: 1 };
		for (k in d) {
			if (n >= d[k]) {
				var c = Math.floor(n / d[k]);
				if (c == 1) r = t.s[k];
				else if (c > 1) r = t.p[k].replace('$1', c);
				else r = 'Hace mucho tiempo';
				break;
			}
		}
		return r ? r : 'Hace instantes';	
	},
	upd: function () {
		setTimeout(function(){
			if (this.current) {
				timelib.current = timelib.current + timelib.iupd;
				$('span[ts]').each(function(){ $(this).html(timelib.timetowords($(this).attr('ts'))); });
			}
			timelib.upd()
		}, this.iupd * 1000);
	}
}

function brand_day(enable) {
	var site = global_data.domain;
	document.cookie = 'brandday='+(enable ? 'on' : 'off')+';expires=Tue, 25 May 2020 00:00:00 GMT-3;path=/;SameSite=None;domain=.'+site;
	window.location.reload();
}
