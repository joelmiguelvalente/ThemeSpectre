{if $tsComments.num > 0}
	{foreach from=$tsComments.data item=c}
	<div class="comment-show" id="div_cmnt_{$c.cid}">
		<span id="citar_comm_{$c.cid}" style="display:none">{$c.c_body}</span>
		<div class="avatar avatar-lg">
			<img src="{$tsConfig.url}/files/avatar/{$c.c_user}_120.jpg" />
		</div>
		<div class="content" id="pp_{$c.cid}" {if $c.c_status == 1 || !$c.user_activo && $tsUser->is_admod}style="opacity:0.5"{/if}>
			<div class="name_user">
				<a href="{$tsConfig.url}/perfil/{$c.user_name}" class="nick">{$c.user_name}</a> {if $tsUser->is_admod}(<a href="{$tsConfig.url}/moderacion/buscador/1/1/{$c.c_ip}" target="_blank">{$c.c_ip}</a>){/if}
				<time>{$c.c_date|hace}</time>
				{if $tsUser->is_member}
				<div class="answerOptions" id="opt_{$c.cid}">
					<ul id="ul_cmt_{$c.cid}">
						{*if $tsUser->info.user_rango || $tsUser->info.user_rango_post != 3*}
						<li class="numbersvotes" {if $c.c_votos == 0}style="display: none"{/if}>
							<div class="overview">
								<span class="text-{if $c.c_votos >= 0}success{else}error{/if}" id="votos_total_{$c.cid}">{if $c.c_votos != 0}{if $c.c_votos >= 0}+{/if}{$c.c_votos}{/if}</span>
							</div>
						</li>
						{if $tsUser->uid != $c.c_user && $c.votado == 0 && ($tsUser->permisos.govpp || $tsUser->permisos.govpn || $tsUser->is_admod)}
							{if $tsUser->permisos.govpp || $tsUser->is_admod}
								<li class="icon-thumb-up">
									<a onclick="comentario.votar({$c.cid},1)">
										<i class="lni-thumbs-up"></i>
									</a>
								</li>
							{/if}
							{if $tsUser->permisos.govpn || $tsUser->is_admod}
								<li class="icon-thumb-down">
									<a onclick="comentario.votar({$c.cid},-1)">
										<i class="lni-thumbs-down"></i>
									</a>
								</li>
							{/if}
						{/if}
						{*/if*}
						{if $tsUser->is_member}
							<li class="answerCitar">
								<a onclick="citar_comment({$c.cid}, '{$c.user_name}')" title="Citar">
									<i class="lni-quotation"></i>
								</a>
							</li>
							{if ($c.c_user == $tsUser->uid && $tsUser->permisos.goepc) || $tsUser->is_admod || $tsUser->permisos.moedcopo}
								<li>
									<a onclick="comentario.editar({$c.cid}, 'show')" title="Editar comentario">
										<i class="lni-pencil"></i>
									</a>
								</li>
							{/if}
							{if ($c.c_user == $tsUser->uid && $tsUser->permisos.godpc) || $tsUser->is_admod || $tsUser->permisos.moecp}
								<li class="iconDelete">
									<a onclick="borrar_com({$c.cid}, {$c.c_user}, {$c.c_post_id})" title="Borrar">
										<i class="lni-trash"></i>
									</a>
								</li>
								{if $tsUser->is_admod || $tsUser->permisos.moaydcp}
									<li class="iconHide">
										<a onclick="ocultar_com({$c.cid}, {$c.c_user});" title="{if $c.c_status == 1}Mostrar/Ocultar{else}Ocultar/Mostrar{/if}">
											<i class="lni-construction-hammer"></i>
										</a>
									</li>
								{/if}
							{/if}
						{/if}
					</ul>
				</div>
				{/if}
			</div>
			<div class="mensaje" id="comment-body-{$c.cid}">
				{if $c.c_votos <= -3 || $c.c_status == 1 || !$c.user_activo || $c.user_baneado}<div>Escondido {if $c.c_status == 1}por un moderador{elseif $c.c_votos <= -3}por un puntaje bajo{elseif $c.user_activo == 0}por pertener a una cuenta desactivada{else}por pertenecer a una cuenta baneada{/if}. <a href="#" onclick="$('#hdn_{$c.cid}').slideDown(); $(this).parent().slideUp(); return false;">Click para verlo</a>.</div>
				
				<div id="hdn_{$c.cid}" style="display:none">{/if}
					
					{$c.c_html}
					
				{if $c.c_votos <= -3 || $c.c_status == 1 || !$c.user_activo}</div>{/if}
			</div>
		</div>
	</div>
	{/foreach}
{else}
	<div id="no-comments">Este post no tiene comentarios, S&eacute; el primero!</div>
{/if}
<div id="nuevos"></div>