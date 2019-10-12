    {foreach from=$tsEmoticones item=categoria key=i}
    <div class="e_content ec_tab_{$i}">
        {foreach from=$categoria.data item=e}
        <a data-code="{$e.code}" data-image="{$e.smile}">{$e.smile}</a>
        {/foreach}
    </div>
    {/foreach}
