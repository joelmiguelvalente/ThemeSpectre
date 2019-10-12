
   <ul class="tab">
      <li class="tab-item active"><a href="#">Estad&iacute;sticas</a></li>
   </ul>
   <div class="home-stats d-flex">
      <p><b>{$tsStats.stats_online|kmg}</b> <span><a class="usuarios_online" href="{$tsConfig.url}/usuarios/?online=true" title="R&eacute;cord conectados: {$tsStats.stats_max_online} {$tsStats.stats_max_time|fecha}">online</a></span></p>
      <p><b>{$tsStats.stats_miembros|kmg}</b> <span><a href="{$tsConfig.url}/usuarios/">miembros</a></span></p>
      <p><b>{$tsStats.stats_posts|kmg}</b> <span>posts</span></p>
   </div>
