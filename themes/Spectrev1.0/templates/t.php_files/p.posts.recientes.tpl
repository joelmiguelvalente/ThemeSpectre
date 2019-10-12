<div>
	{foreach from=$tsRecientes item=p}
	<div class="tile tile-centered" onclick="location.href='{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html'" style="cursor:pointer;">
	  	<div class="tile-icon">
	    	<div class="sky-tile-icon">
	      	<i class="lni-add-file"></i>
	    	</div>
	  	</div>
	  	<div class="tile-content">
	    	<div class="tile-title">{$p.post_title}</div>
	    	<small class="tile-subtitle text-gray">{$p.c_nombre} · {$p.post_date|date_format:"%e %b, %Y"|replace:".":""}</small>
	  	</div>
	</div>
	{/foreach}
</div>