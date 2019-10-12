1:
<div id="perfil_medallas" class="widget" status="activo">
	<div class="title-w clearfix">
        <h2>Medallas de {$tsUsername} ({$tsMedallas.total})</h2>
    </div>
    {if $tsMedallas.medallas}
        <ul class="listado">
        {foreach from=$tsMedallas.medallas item=m}
        <div class="tile">
          <div class="tile-icon">
            <figure class="avatar avatar-sm" style="background: transparent;"><img src="{$tsConfig.tema.t_url}/images/icons/med/{$m.m_image}_32.png" alt="{$m.medal_date|hace:true}"></figure>
          </div>
          <div class="tile-content">
            <p class="tile-title"><strong>{$m.m_title}</strong><span style="display: block;">{$m.m_description}</span></p>
          </div>
        </div>
        {/foreach}
    </ul>
        {else}
        <div class="emptyData">No tiene medallas</div>
        {/if}
</div>