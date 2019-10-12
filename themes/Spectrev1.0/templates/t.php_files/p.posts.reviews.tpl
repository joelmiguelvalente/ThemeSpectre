<div>
	{foreach from=$tsReviews item=p}
	{if $p.post_hits > 0} 
	<div class="tile tile-centered" onclick="location.href='{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html'" style="cursor:pointer;">
	  	<div class="tile-icon">
	    	<div class="purple-tile-icon">
	      	<i class="lni-eye"></i>
	    	</div>
	  	</div>
	  	<div class="tile-content">
	    	<div class="tile-title">{$p.post_title}</div>
	    	<small class="tile-subtitle text-gray">Visitas {$p.post_hits} · {$p.post_date|date_format:"%e %b, %Y"|replace:".":""}</small>
	  	</div>
	</div>
	{/if}
	{/foreach}
</div>