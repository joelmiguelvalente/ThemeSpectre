   <br>
   </div><!-- .container -->
   <a id="button" class="show"><i class="lni-angle-double-up"></i></a>
   <footer>
      <div class="pages">
         <a href="{$tsConfig.url}/pages/protocolo/">Protocolo</a> 
         <a href="{$tsConfig.url}/pages/terminos-y-condiciones/">T&eacute;rminos y condiciones</a>
         <a href="{$tsConfig.url}/pages/privacidad/">Privacidad de datos</a>
         <a href="{$tsConfig.url}/pages/dmca/">Report Abuse - DMCA</a>
      </div>
      {* El siguiente contenedor sirve para validar el Copyright *}
      {* El ID del div NO debe ser alterado de lo contrario nuestro validador *}
      {* tomará al sitio como una web sin copyright *}
      <div id="pp_copyright">
         <a href="{$tsConfig.url}" class="label label-success">{$tsConfig.titulo}</a> &copy; {$smarty.now|date_format:"%Y"} - Powered by <a href="http://www.phpost.net/" target="_blank" class="label label-success">PHPost</a>
      </div>
   </footer>
</div>
<script src="{Spectrejs}?{$smarty.now}"></script>
</body>
</html>