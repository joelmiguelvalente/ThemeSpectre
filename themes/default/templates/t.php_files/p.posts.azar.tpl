<div>
	{foreach from=$tsPostsAzar item=p}
	<div class="tile tile-centered" onclick="location.href='{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html'" style="cursor:pointer;">
	  	<div class="tile-icon">
	    	<div class="random-tile-icon">
	      	{$p.c_nombre|truncate:1:''}
	    	</div>
	  	</div>
	  	<div class="tile-content">
	    	<div class="tile-title">{$p.post_title}</div>
	    	<small class="tile-subtitle text-gray">{$p.user_name} · Puntos {$p.post_puntos} · Favoritos {$p.post_favoritos} · {$p.post_date|date_format:"%e %b, %Y"|replace:".":""}</small>
	  	</div>
	</div>
	{/foreach}
</div>