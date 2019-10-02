{include file='sections/main_header.tpl'}
{$tsInstall}
<div class="columns">
   <div class="column col-8">
      {include file='modules/m.home_last_posts.tpl'}
   </div>
   <div class="column col-4">
      <div class="box">
         <ul class="tab tab-block">
            <li onclick="home.tab('azar',this); return false;" class="tab-item active"><a href="#">Random</a></li>
            <li onclick="home.tab('popular',this); return false;" class="tab-item"><a href="#">Popular</a></li>
            <li onclick="home.tab('recientes',this); return false;" class="tab-item"><a href="#">Recientes</a></li>
            <li onclick="home.tab('reviews',this); return false;" class="tab-item"><a href="#">Reviews</a></li>
         </ul>
         <div id="home_content">
            {include 't.php_files/p.posts.azar.tpl'}
         </div>
      </div>
      {include file='modules/m.home_last_comments.tpl'}
   </div>
</div>
{*<div id="izquierda">
   
</div>
<div id="centro">
   {include file='modules/m.home_search.tpl'}
   {include file='modules/m.home_stats.tpl'}
   
   {include file='modules/m.home_top_posts.tpl'}
   {include file='modules/m.home_top_users.tpl'}
   <!--Poner aqui mas modulos-->
</div>
<div id="derecha">
   {if $tsConfig.c_fotos_private == 1 && !$tsUser->is_member}
   {else}
   {include file='modules/m.home_fotos.tpl'}
   {/if}
   {include file='modules/m.home_afiliados.tpl'}
   <br class="spacer"/>
   {include file='modules/m.global_ads_160.tpl'}
</div>
<div style="clear:both"></div>*}
{include file='sections/main_footer.tpl'}