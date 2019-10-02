{include file='sections/main_header.tpl'}
<div class="columns">
	{if $tsAction == ''}
		<div class="column col-8">
		   {include file='modules/m.monitor_content.tpl'}
		</div>
		<div class="column col-4">
		   {include file='modules/m.monitor_sidebar.tpl'}
		</div>
	{else}
		<div class="column col-12">
			{include file='modules/m.monitor_menu.tpl'}
		   {include file='modules/m.monitor_listado.tpl'}
		</div>
	{/if}
</div>            
</div>            
{include file='sections/main_footer.tpl'}