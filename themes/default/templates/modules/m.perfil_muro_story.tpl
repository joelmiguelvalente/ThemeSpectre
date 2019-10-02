<div class="timeline">
   {foreach from=$tsMuro.data item=p}
   <div id="pub_{$p.pub_id}">
      <div class="timeline-item" id="timeline-example-1">
         <div class="timeline-left">
            <a class="timeline-icon icon-lg" href="{$tsConfig.url}/perfil/{$p.user_name}">
               <figure class="avatar avatar-sm" style="background-color: #5755d9;">
                  <img src="{$tsConfig.url}/files/avatar/{$p.p_user_pub}_120.jpg" alt="{$tsUser->nick}">
               </figure>
            </a>
         </div>
         <div class="timeline-content">
            <span>{if $p.user_name == $tsUser->nick}{$tsUser->nick}{else}{$p.user_name}{/if} - {$p.p_date|hace}</span>
            <div class="tile">
               <div class="tile-content">
                  <span>{$p.p_body|quot}</span>
                  {if $p.p_type != 1}
                  <div class="mvm clearfix">
                     {if $p.p_type == 2}
                     <div onclick="ModalFoto('{$p.a_img}');" class="uiPhoto"><img src="{$p.a_img}"/></div>
                     {elseif $p.p_type == 3}
                     <div class="uiLink">
                        <div><a href="{$p.a_url}" target="_blank" class="a_blue"><strong>{$p.a_title}</strong></a></div>
                        <a href="{$p.a_url}" target="_blank" class="a_blue">{$p.a_url}</a>
                     </div>
                     {elseif $p.p_type == 4}
                     <div class="video" onclick="ModalVideo('{$p.a_url}');">
                        <img src="https://img.youtube.com/vi/{$p.a_url}/hqdefault.jpg"/>
                        <div class="videoDesc">
                           <strong><a href="http://www.youtube.com/watch?v={$p.a_url}" target="_blank" class="a_blue">{$p.a_title}</a></strong>
                           <div style="margin-top:5px">
                              {$p.a_desc}
                           </div>
                        </div>
                     </div>
                     {/if}
                  </div>
                  {/if}
                  <div class="Story_Info">
                     <a onclick="muro.like_this({$p.pub_id}, 'pub', this); return false;" class="a_blue">{$p.likes.link}</a>
                     &middot;
                     <a onclick="muro.show_comment_box({$p.pub_id}); return false" class="a_blue">Comentar</a>
                     {if $tsUser->is_admod}
                     &middot;
                     <span class="text">{$p.p_ip}</span>
                     {/if}
                  </div>
                  <ul id="cb_{$p.pub_id}" class="Story_Comments" {if $p.p_comments == 0 && $p.p_likes == 0}style="display:none"{/if}>
                     <li class="ufiItem" {if $p.p_likes == 0}style="display:none"{/if}>
                        <div class="likes clearfix">
                           <span class="floatL" id="lk_{$p.pub_id}">{$p.likes.text}</span>
                        </div>
                     </li>
                     <li>
                        <ul id="cl_{$p.pub_id}" class="commentList">
                           {if $p.p_comments > 2 && !$p.hide_more_cm}
                           <li class="ufiItem">
                              <div class="more_comments clearfix">
                                 <i></i>
                                 <a href="#" class="a_blue floatL" onclick="muro.more_comments({$p.pub_id}, this); return false">Ver los {$p.p_comments} comentarios</a>
                                 <div class="loading loading-lg"></div>
                              </div>
                           </li>
                           {/if}
                           {foreach from=$p.comments item=c}
                           <li class="ufiItem" id="cmt_{$c.cid}">
                              <div class="clearfix">
                                 <a href="{$tsConfig.url}/perfil/{$c.user_name}" class="autorPic">
                                    <img alt="{$c.user_name}" src="{$tsConfig.url}/files/avatar/{$c.c_user}_120.jpg"/>
                                 </a>
                                 {if $p.p_user == $tsUser->uid || $c.c_user == $tsUser->uid  || $tsUser->is_admod || $tsUser->permisos.moecm}<span class="close"><a href="#" onclick="muro.del_pub({$c.cid}, 2); return false" class="lni-close" title="Eliminar"></a></span>{/if}
                                 <div class="mensaje">
                                    <a href="{$tsConfig.url}/perfil/{$c.user_name}" class="autorName a_blue">{$c.user_name}</a>
                                    <span>{$c.c_body|quot}</span>
                                    <div class="cmInfo">{$c.c_date|hace} &middot; <a onclick="muro.like_this({$c.cid}, 'com', this); return false;" class="a_blue">{$c.like}</a> <span class="cm_like"{if $c.c_likes == 0} style="display:none"{/if}>&middot; <i></i> <a onclick="muro.show_likes({$c.cid}, 'com'); return false;" id="lk_cm_{$c.cid}" class="a_blue">{$c.c_likes} persona{if $c.c_likes > 1}s{/if}</a></span>{if $tsUser->is_admod}<span>{$c.c_ip}</span>{/if}</div>
                                 </div>
                              </div>
                           </li>
                           {/foreach}
                        </ul>
                     </li>{if $tsPrivacidad.mf.v == true && $tsUser->is_member || $tsType == 'news'}
                     <li class="ufiItem">
                        <div class="newComment">
                           <div class="formulario">
                              <img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg" />
                              <textarea class="comentar" placeholder="Escribe un comentario..." id="cf_{$p.pub_id}" pid="{$p.pub_id}" name="add_wall_comment" onfocus="onfocus_input(this)" onblur="onblur_input(this)"></textarea>
                           </div>
                        </div>
                     </li>{/if}
                  </ul>
               </div>
               <div class="tile-action">
                  {if $p.p_user == $tsUser->uid || $p.p_user_pub == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.moepm}
                  <button class="btn btn-error" onclick="muro.del_pub({$p.pub_id},1); return false;" title="Eliminar la publicaci&oacute;n"><i class="lni-trash"></i></button>
                  {/if}
               </div>
            </div>
         </div>
      </div>
   </div>
   {/foreach}
</div>
