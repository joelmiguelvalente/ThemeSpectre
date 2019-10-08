{include file='sections/main_header.tpl'}
<link rel="stylesheet" href="{$tsConfig.css}/portal.css">
<script type="text/javascript" src="{$tsConfig.js}/perfil.js?{$smarty.now}"></script>
<script type="text/javascript" src="{$tsConfig.js}/portal.js?{$smarty.now}"></script>
<div class="columns">
   <div class="column col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-8 col-8">
      <div id="portal">
         <div class="tabs_menu box_title">
            <ul id="tabs_menu" class="tab tab-block">
               <li class="tab-item active"><a onclick="portal.load_tab('news', this); return false" class="news">Noticias</a></li>
               <li class="tab-item"><a onclick="portal.load_tab('activity', this); return false;" class="activity">Actividad</a></li>
               <li class="tab-item"><a onclick="portal.load_tab('posts', this); return false;" class="posts">Posts</a></li>
               <li class="tab-item"><a onclick="portal.load_tab('favs', this); return false;" class="favs">Favoritos</a></li>
            </ul>
         </div>
         <div id="portal_content">
            {include file='modules/m.portal_noticias.tpl'}
            {include file='modules/m.portal_activity.tpl'}
            {include file='modules/m.portal_posts.tpl'}
            {include file='modules/m.portal_posts_favoritos.tpl'}
         </div>
      </div>
   </div>
   <div class="column col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 col-4">
      {include file='modules/m.portal_posts_visitados.tpl'}
      {include file='modules/m.portal_afiliados.tpl'}
   </div>
</div>

{include file='sections/main_footer.tpl'}