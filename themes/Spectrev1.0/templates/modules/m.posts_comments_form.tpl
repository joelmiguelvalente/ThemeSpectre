<div id="procesando"><div id="post"></div></div>
<div class="answerInfo">
    <img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg" class="avatar-48"/>
    <div class="loading loading-lg" id="gif_cargando"></div>
</div>
<div class="answerTxt">
    <div class="Container">
        <div class="error"></div>
        <textarea id="body_comm" class="onblur_effect autogrow" tabindex="1" title="Escribir un comentario..." style="resize:none;" onfocus="onfocus_input(this)" onblur="onblur_input(this)">Escribir un comentario...</textarea>
        <div class="buttons" style="text-align:left">
            <div class="floatL">
                <input type="hidden" id="auser_post" value="{$tsPost.post_user}" />
                <input type="button" onclick="comentario.nuevo('true')" class="btn btn-success" value="Enviar Comentario" tabindex="3" id="btnsComment"/>
                &nbsp;<input type="button" onclick="comentario.preview('body_comm','new')" class="btn btn-info" value="Vista Previa" tabindex="2" style="width:auto;" />
            </div>
            <div class="float-right">
                <a href="#" onclick="moreEmoticons(true); return false;" class="btn btn-link" id="moreemofn"> M&aacute;s emoticones</a>
            </div>
            
            <div class="clearfix"></div>
        </div>
    </div>
</div>