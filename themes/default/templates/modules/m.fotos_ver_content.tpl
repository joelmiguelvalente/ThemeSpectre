{if $tsFoto.f_status != 0 || $tsFoto.user_activo == 0}
<div class="emptyData">Esta foto no es visible{if $tsFoto.f_status == 1} por acumulaci&oacute;n de denuncias u orden administrativa{elseif $tsFoto.f_status == 2} porque est&aacute; eliminada{elseif $tsFoto.user_activo != 1} porque la cuenta del due&ntilde;o se encuentra desactivada{/if}, pero puedes verla porque eres {if $tsUser->is_admod == 1}administrador{elseif $tsUser->is_admod == 2}moderador{else}autorizado{/if}.</div><br />
{/if}
<div id="fg_centro">
   <div class="foto">
      <div class="v_user">
         <div class="avatar-box">
            <a href="{$tsConfig.url}/perfil/{$tsFoto.user_name}"><img src="{$tsConfig.url}/files/avatar/{$tsFoto.f_user}_120.jpg"/></a>
         </div>
         <div class="v_info">
            <a href="{$tsConfig.url}/perfil/{$tsFoto.user_name}" style="color:#{$tsFoto.r_color}" class="user">{$tsFoto.user_name}</a>
            <div class="links">
               <span style="background-image:url({$tsConfig.images}/icons/ran/{$tsFoto.r_image});color:#{$tsFoto.r_color}"><strong>{$tsFoto.r_name}</strong></span>
               <span style="background-image:url({$tsConfig.images}/flags/{$tsFoto.user_pais.0|lower}.png);">{$tsFoto.user_pais.1}</span>
            </div>
         </div>
      </div>
      <div id="imagen">
         <img class="img" src="{$tsFoto.f_url}" />
      </div>
      <div class="imagen-head">
         <b>{$tsFoto.f_date|date_format:"%d.%m.%Y"}</b>
         <h2>{$tsFoto.f_title}</h2>
         <p>{if $tsFoto.f_description}{$tsFoto.f_description|nl2br}{else}Sin descripción{/if}</p>
      </div>
      <div class="infoPost">
         <div class="rateBox">
            <strong class="title">Calificar:</strong>
            <span id="actions">
               <a title="Votar positivo" class="thumbs thumbsUp" href="#" onclick="fotos.votar('pos'); return false;"><i class="lni-thumbs-up"></i></a>
               <a title="Votar negativo" class="thumbs thumbsDown" href="#" onclick="fotos.votar('neg'); return false;"><i class="lni-thumbs-down"></i></a>
            </span>
            </div><!-- END RateBox -->
            <div class="rateBox">
               <strong class="title">Positivos:</strong>
               <span class="text-success" id="votos_total_pos">{$tsFoto.f_votos_pos}</span>
               </div><!-- END RateBox -->
               <div class="rateBox">
                  <strong class="title">Negativos:</strong>
                  <span class="text-error" id="votos_total_neg">{$tsFoto.f_votos_neg}</span>
                  </div><!-- END RateBox -->
                  <div class="metaBox">
                     <strong class="title">Visitas:</strong>
                     <span>{$tsFoto.f_hits}</span>
                     </div><!-- END Visitas -->
                     {if $tsUser->is_admod}
                     <div class="metaBox">
                        <strong class="title">IP</strong>
                        <span style="font-size:11px"><a href="{$tsConfig.url}/moderacion/buscador/1/1/{$tsFoto.f_ip}" class="geoip" target="_blank">{$tsFoto.f_ip}</a></span>
                     </div>
                     <!-- END Visitas -->
                     {/if}
                  </div>
               </div>
               <div class="bajo">
                  <div class="comments">
                     <div class="comentarios-title">
                        <h4 class="titulorespuestas floatL"><span id="ncomments">{$tsFoto.f_comments}</span> Comentarios</h4>
                     </div>
                     <div id="mensajes">
                     {if $tsFComments}
                        {foreach from=$tsFComments item=c}
                        <div class="item" id="div_cmnt_{$c.cid}">
                           <a href="{$tsConfig.url}/perfil/{$c.user_name}">
                              <img src="{$tsConfig.url}/files/avatar/{$c.c_user}_120.jpg" />
                           </a>
                           <div class="firma">
                              <div class="options">
                                 {if $tsFoto.f_user == $tsUser->info.user_id || $tsUser->is_admod || $tsUser->permisos.moecf}
                                 <a href="#" onclick="fotos.borrar({$c.cid}, 'com'); return false" title="Borrar Comentario"><span class="lni-close"></span></a>
                                 {/if}
                              </div>
                              
                              <div class="info">
                                 <a href="{$tsConfig.url}/fotos/{$c.user_name}">{$c.user_name}</a> <span>@ {$c.c_date|hace} {if $tsUser->is_admod}(<span style="color:red;">IP:</span> <a href="{$tsConfig.url}/moderacion/buscador/1/1/{$c.c_ip}" class="geoip" target="_blank">{$c.c_ip}</a>){/if} dijo:</span></div>
                              
                              {if !$c.user_activo}<div>Escondido por pertener a una cuenta desactivada
                                 <a href="#" onclick="$('#hdn_{$c.cid}').slideDown(); $(this).parent().slideUp(); return false;">Click para verlo</a>.</div>
                                 <div id="hdn_{$c.cid}" style="display:none">{/if}
                                    <div class="clearfix">{$c.c_body|nl2br}</div>
                                 {if !$c.user_activo}</div>{/if}
                           </div>
                        </div>
                           {/foreach}
                           {elseif $tsFoto.f_closed == 0 && ($tsUser->is_admod || $tsUser->permisos.gopcf)}
                           <div class="noComments">Esta foto no tiene comentarios, Se el primero!.</div>
                           {/if}
                        </div>
                        {if $tsUser->is_admod == 0 && $tsUser->permisos.gopcf == false}
                        <div class="noComments">No tienes permiso para comentar.</div>
                        {elseif $tsFoto.f_closed == 1}
                        <div class="noComments">La foto se encuentra cerrada y no se permiten comentarios.</div>
                        {elseif $tsUser->is_member}
                        <div class="form">
                           <div class="avatar-box">
                              <img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg" />
                           </div>
                           <form method="post" action="" name="firmar">
                              <div class="error"></div>
                              <textarea name="mensaje" id="mensaje" rows="2" class="onblur_effect autorow" title="Escribe un mensaje." onblur="onblur_input(this)" onfocus="onfocus_input(this)">Escribe un mensaje.</textarea>
                              <input type="hidden" name="auser_post" value="{$tsFoto.f_user}" />
                              <input type="button" id="btnComment" class="btn btn-success" value="Comentar" onclick="fotos.comentar()" />
                           </form>
                           <div class="clearBoth"></div>
                        </div>
                        {else}
                        <div class="emptyData">Para poder comentar necesitas estar <a onclick="registro_load_form(); return false" href="">Registrado.</a> O.. ya tienes usuario? <a onclick="open_login_box('open')" href="#">Logueate!</a></div>
                        {/if}
                     </div>
                  </div>
               </div>