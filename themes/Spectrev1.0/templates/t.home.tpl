{include file='sections/main_header.tpl'}
{$tsInstall}
<div class="columns">
   <div class="column col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-8 col-8">
      {include file='modules/m.home_last_posts.tpl'}
   </div>
   <div class="column col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 col-4">
      <div class="columns">
      <div class="box column col-xs-6 col-sm-6 col-md-6 col-lg-12 col-xl-12 col-12">
         {include file='modules/m.home_stats.tpl'}
      </div>
      <div class="box column col-xs-6 col-sm-6 col-md-6">
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
      <div class="column col-xs-6 col-sm-6 col-md-6">
         {include file='modules/m.home_last_comments.tpl'}
      </div>
      </div>
   </div>
</div>
{include file='sections/main_footer.tpl'}