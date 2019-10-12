1:
{if $tsType == 'new'} 
<div class="comment-show" id="div_cmnt_{$tsComment.0}">
    <span id="citar_comm_{$tsComment.0}" style="display:none">{$tsComment.2}</span>
    <div class="avatar avatar-lg">
        <img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg" />
    </div>
    <div class="content" id="pp_{$c.cid}" {if $c.c_status == 1 || !$c.user_activo && $tsUser->is_admod}style="opacity:0.5"{/if}>
        <div class="name_user">
            <a href="{$tsConfig.url}/perfil/{$tsUser->nick}" class="nick">{$tsUser->nick}</a> {if $tsUser->is_admod}(<a href="{$tsConfig.url}/moderacion/buscador/1/1/{$tsComment.6}" target="_blank">{$c.c_ip}</a>){/if}
            <time>{$tsComment.3|hace}</time>
            {if $tsComment.0 > 0}
            <div class="answerOptions">
                <ul>
                    {if $tsUser->is_member}
                        <li class="answerCitar">
                            <a onclick="citar_comment({$tsComment.0}, '{$tsUser->nick}')" title="Citar">
                                <i class="lni-quotation"></i>
                            </a>
                        </li>
                        {if $tsUser->is_admod || $tsUser->permisos.goepc}
                            <li>
                                <a onclick="comentario.editar({$tsComment.0}, 'show')" title="Editar comentario">
                                    <i class="lni-pencil"></i>
                                </a>
                            </li>
                        {/if}
                        {if $tsUser->is_admod || $tsUser->permisos.godpc}
                            <li class="iconDelete">
                                <a onclick="borrar_com({$tsComment.0}, {$tsUser->uid})" title="Borrar">
                                    <i class="lni-trash"></i>
                                </a>
                            </li>
                            {if $tsUser->is_admod || $tsUser->permisos.moaydcp}
                                <li class="iconHide">
                                    <a onclick="ocultar_com({$tsComment.0}, {$tsUser->uid});" title="Ocultar/Mostrar}">
                                        <i class="lni-construction-hammer"></i>
                                    </a>
                                </li>
                            {/if}
                        {else}
                            <li><a><span style="color:red;width:auto;background:none;"><b>VISTA PREVIA</b></span></a></li>
                        {/if}
                    {/if}
                </ul>
            </div>
            {/if}
        </div>
        <div class="mensaje" id="comment-body-{$tsComment.0}">
            {$tsComment.1|nl2br}
        </div>
    </div>
</div>

{elseif $tsType == 'edit'}
<div id="preview" class="box_cuerpo">
    <div id="new-com-html">{$tsComment.1|nl2br}</div>
    <div id="new-com-bbcode" style="display:none">{$tsComment.5}</div>
</div>
{/if}