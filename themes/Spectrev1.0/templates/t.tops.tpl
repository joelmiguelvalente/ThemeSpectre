{include file='sections/main_header.tpl'}
<div class="columns">
	<div class="column col-3">
		{include file='modules/m.top_sidebar.tpl'}
	</div>
	<div class="column col-9">
		<div class="columns">
	     	{if $tsAction == 'posts'}
				{include file='modules/m.top_posts.tpl'}
	      {elseif $tsAction == 'usuarios'}
	         {include file='modules/m.top_users.tpl'}
			{elseif $tsAction == 'fotos'}
				{include file='modules/m.top_fotos.tpl'}
	      {/if}
   	</div>
   </div>
</div>             
{include file='sections/main_footer.tpl'}