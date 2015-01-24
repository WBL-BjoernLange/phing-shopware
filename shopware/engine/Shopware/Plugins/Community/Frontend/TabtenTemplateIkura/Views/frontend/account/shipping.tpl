{extends file='frontend/account/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' append}
	{$sBreadcrumb[] = ['name'=>"{s name='ChangeShippingTitle'}{/s}", 'link'=>{url}]}
{/block}

{* Main content *}
{block name='frontend_index_content'}
<div id="center" class="register change_shipping">
    <div class="inner">
        {* Error messages *}
        {block name='frontend_account_shipping_error_messages'}
            {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
        {/block}
        <div class="form">
            {* Shipping form *}
            <form name="frmRegister" method="post" action="{url action=saveShipping sTarget=$sTarget}">
                {* Shipping fieldset *}
                {block name='frontend_account_shipping_fieldset'}
                    {include file='frontend/register/shipping_fieldset.tpl' form_data=$sFormData error_flags=$sErrorFlag country_list=$sCountryList}
                {/block}

                {block name="frontend_account_shipping_action_buttons"}
                    {if $sTarget}
                        <a class="btn neutral" href="{url controller=$sTarget}" title="{s name='ShippingLinkBack'}{/s}">
                            {se name="ShippingLinkBack"}{/se}
                        </a>
                    {/if}
                    <input type="submit" value="{s name='ShippingLinkSend'}{/s}" class="btn" />
                {/block}
            </form>
        </div>
    </div>

</div>
{/block}