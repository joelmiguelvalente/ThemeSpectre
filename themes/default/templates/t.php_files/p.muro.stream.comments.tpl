1:
{foreach from=$tsComments.data item=c}
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