<div class="boxy-title">
    <h3>Administrar Emoticones</h3>
</div>
<div id="res" class="boxy-content">
{if $tsSave}<div class="mensajes ok">Tus cambios han sido guardados.</div>{/if}
{if $tsAct == ''}
<div class="km_tabbable">
    <div class="kmt_content">
    {foreach from=$tsEmoticones item=categoria key=i}
	<table class="table">
        {if $categoria.data}
    	<thead>
        	<th>ID</th>
            <th>Smile</th>
            <th>Code</th>
            <th>Opciones</th>
        </thead>
        <tbody>
            {foreach from=$categoria.data item=e}
        	<tr id="{$e.id}">
            	<td>{$e.id}</td>
                <td><span>&#{$e.smile};</span></td>
                <td>{$e.code|escape}</td>
                <td class="admin_actions">
                	<a href="?act=editar&eid={$e.id}" alt="Editar Emoticon"><i class="lni-pencil"></i></a>
                    <a href="?act=borrar&eid={$e.id}" alt="Borrar Emoticon"><i class="lni-trash"></i></a>
                </td>
            </tr>
            {/foreach}
        </tbody>
        {else}
        <tr><td colspan="4" class="emptyData">Nada por aqu&iacute;</td></tr>
        {/if}
    </table>
    {/foreach}
    </div>
</div>
    <hr />
    <input type="button"  onclick="location.href = '{$tsConfig.url}/admin/emoticones?act=nuevo'" value="Agregar Nuevo Emoticon" class="btn btn-success" style="margin-left:280px;"/>
    {elseif $tsAct == 'nuevo' || $tsAct == 'editar'}
        {if $tsError}
        <div class="mensajes error">{$tsError}</div>
        {/if}
        <form action="" method="post" autocomplete="off">
        <fieldset>
            <legend>Nuevo</legend>
            <dl>
                <dt><label for="code">Code:</label></dt>
                <dd><input type="text" id="code" name="code" value="{$tsEmoticon.code}" /></dd>
            </dl>
            <dl>
                <dt><label for="smile">Imagen:</label></dt>
                <dd>
                <dd>&#<input type="number" id="smile" name="smile" value="{$tsEmoticon.smile}" />;</dd>
            </dl>
            <p><input type="submit" name="save" value="{if $tsAct == 'editar'}Guardar{else}Agregar{/if} Emoticon" class="btn btn-primary"/></p>
        </fieldset> 
        </form>                                       
    {/if}
</div>