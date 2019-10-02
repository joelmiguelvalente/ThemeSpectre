<div class="boxy-title">
    <h3>Centro de Administraci&oacute;n</h3>
</div>
<div id="res" class="boxy-content">
    <b>Bienvenido(a), {$tsUser->nick}!</b><br />Este es tu &quot;Centro de Administraci&oacute;n de PHPost&quot;. Aqu&iacute; puedes modificar la configuraci&oacute;n de tu web, modificar usuarios, modificar posts, y muchas otras cosas.<br />Si tienes algun problema, por favor revisa la p&aacute;gina de &quot;Soporte y Cr&eacute;ditos&quot;.  Si esa informaci&oacute;n no te sirve, puedes <a href="http://www.phpost.net/" target="_blank">visitarnos para solicitar ayuda</a> acerca de tu problema.
    <div class="divider"></div>
    <div class="columns">
        <div class="column col-8">
            <div class="phpost pointer">
                <h1 id="phpost_directo">PHPost en directo <i class="lni-chevron-down"></i></h1>
                <ul id="news_pp" class="pp_list hide">
                    <div class="phpostAlfa"><div class="loading loading-lg"></div></div>
                </ul>
            </div>
            <div class="divider"></div>
            <div class="phpost pointer">
                <h1 id="phpost_themes">Themes <i class="lni-chevron-down"></i></h1>
                <ul id="newTheme" class="pp_list">
                    <div class="phpostAlfa"><div class="loading loading-lg"></div></div>
                </ul>
            </div>
        </div>
        <div class="column col-4">
            <div class="phpost version">
                <h1>PHPost Risus</h1>
                <ul id="version_pp" class="pp_list">
                    <li>
                        <div class="title">Versi&oacute;n instalada</div>
                        <div class="body"><b>{$tsConfig.version}</b></div>
                    </li>
                </ul>
                <h1>Administradores</h1>
                <ul class="pp_list">
                    {foreach from=$tsAdmins item=admin}
                    <li><div class="title"><a href="{$tsConfig.url}/perfil/{$admin.user_name}" class="hovercard" uid="{$admin.user_id}">{$admin.user_name}</a></div></li>
                    {/foreach}
                </ul>
                <div class="categoriaList estadisticasList">
                    <h6>Instalaciones</h6>
                    <ul>
                        <li class="clearfix"><span class="floatL">&nbsp; Fundaci&oacute;n</span><span class="floatR number" title="{$tsInst.0|fecha}">{$tsInst.0|hace:true} &nbsp;</span></li>
                        <li class="clearfix"><span class="floatL">&nbsp; Actualizado</span><span class="floatR number" title="{$tsInst.1|fecha}">{$tsInst.1|hace:true} &nbsp;</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="clearBoth"></div>
</div>
{literal}
<script type="text/javascript">
$(document).ready(function(){
    $.ajax({
        type: "GET",
        url: global_data.url + "/feed-support.php",
        dataType: "json",
        success: function(r) {
           $('#news_pp').html('');
           for (var i = 0; i < r.length; i++) {
              //
              var html = '<li>';
              html += '<div class="title"><a href="' + r[i].link + '" target="_blank">' + r[i].title + '</a></div>';
              html += '<div class="body">' + r[i].info + '</div>';
              html += '</li>';
              //
              $('#news_pp').append(html);
           }
        }
    });
    $.ajax({
       type: "GET",
       url: global_data.url + "/feed-version.php?v=risus",
       dataType: "json",
       success: function(r) {
          for (var i = 0; i < r.length; i++) {
             //
             var html = '<li>';
             html += '<div class="title">' + r[i].title + '</div>';
             html += '<div class="body">' + r[i].text + '</div>';
             html += '</li>';
             //
             $('#version_pp').append(html);
          }
       }
    });
});
</script>
{/literal}