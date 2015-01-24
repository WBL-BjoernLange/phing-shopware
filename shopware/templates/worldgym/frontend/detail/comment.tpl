{*DEFAULT ---------*}
<div id="comments">
<h2>{s name="DetailCommentHeader"}{/s} "{$sArticle.articleName}"</h2>

    {* Response save comment *}
    {if $sAction == "ratingAction"}
        {block name='frontend_detail_comment_error_messages'}
            {if $sErrorFlag}
                <div class="error bold center">
                    {se name="DetailCommentInfoFillOutFields"}{/se}
                </div>
            {else}
                {if {config name="OptinVote"} && !{$smarty.get.sConfirmation}}
                    <div class="success bold center">
                        {se name="DetailCommentInfoSuccessOptin"}{/se}
                    </div>
                {else}
                    <div class="success bold center">
                        {se name="DetailCommentInfoSuccess"}{/se}
                    </div>
                {/if}
            {/if}
        {/block}
    {/if}

{if $sArticle.sVoteAverange.count}
    <div class="overview_rating">
        <strong>{se name="DetailCommentInfoAverageRate"}{/se}</strong>
        <div class="star star{$sArticle.sVoteAverange.averange}">Star Rating</div>
        <span>({s name="DetailCommentInfoRating"}{/s})</span>
    </div>
{/if}

{* Display comments *}
{if $sArticle.sVoteComments}
    {foreach name=comment from=$sArticle.sVoteComments item=vote}
        <div class="comment_block{if $smarty.foreach.comment.last} last{/if}{if $vote.answer} no_border{/if}">

            <div class="left_container">


                {block name='frontend_detail_comment_author'}

                    <div class="star star{$vote.points*2}"></div>

                    <strong class="author">
                        {se name="DetailCommentInfoFrom"}{/se} <span class="name">{$vote.name}</span>
                    </strong>
                {/block}

                {* Date *}
                {block name='frontend_detail_comment_date'}
                    <span class="date">
						{$vote.datum}
					</span>
                {/block}

                {* Star rating *}
                {block name="frontend_detail_comment_star_rating"}{/block}
            </div>

            <div class="right_container">
                {block name='frontend_detail_comment_text'}
                {* Headline *}
                    {block name='frontend_detail_comment_headline'}
                        <h3>{$vote.headline}</h3>
                    {/block}

                {* Comment text *}
                    <p>
                        {$vote.comment|nl2br}
                    </p>
                {/block}
            </div>
        </div>

        {block name="frontend_detail_answer_block"}
            {if $vote.answer}
                <div class="comment_block answer">
                    <div class="left_container">
                        <strong class="author">
                            {se name="DetailCommentInfoFrom"}{/se} {se name="DetailCommentInfoFromAdmin"}Admin{/se}
                        </strong>
                        <span class="date">
                            {$vote.answer_date}
                        </span>
                    </div>
                    <div class="right_container">
                        {$vote.answer}
                    </div>
                    <div class="clear"></div>
                </div>
            {/if}
        {/block}
    {/foreach}
{/if}

    {block name='frontend_detail_comment_post'}

    {* Display notice if the shop owner needs to unlock a comment before it will'be listed *}
        {if {config name=VoteUnlock}}
            <div class="notice">
                <span>{s name='DetailCommentTextReview'}{/s}</span>
            </div>
        {/if}

    {* Write comment *}
        <h3>{se name="DetailCommentHeaderWriteReview"}{/se}</h3>
        <form class="form row" method="post" action="{url action='rating' sArticle=$sArticle.articleID sCategory=$sArticle.categoryID}">
            <div>
                <a name="tabbox"></a>

                <fieldset>
                    {* Name *}
                    {block name='frontend_detail_comment_input_name'}
                        <div class="form_row col two">
                            <label for="sVoteName">{se name="DetailCommentLabelName"}{/se}*: </label>
                            <input name="sVoteName" type="text" id="sVoteName" value="{$sFormData.sVoteName|escape}" class="text {if $sErrorFlag.sVoteName}instyle_error{/if}" />
                        </div>
                    {/block}

                    {* E-Mail address *}
                    {if {config name=OptinVote} == true}
                        {block name='frontend_detail_comment_input_mail'}
                            <div class="form_row col two">
                                <label for="sVoteMail">{se name="DetailCommentLabelMail"}{/se}*: </label>
                                <input name="sVoteMail" type="text" id="sVoteMail" value="{$sFormData.sVoteMail|escape}" class="text {if $sErrorFlag.sVoteMail}instyle_error{/if}" />
                            </div>
                        {/block}
                    {/if}

                    {* Comment summary*}
                    {block name='frontend_detail_comment_input_summary'}
                        <div class="form_row col two">
                            <label for="sVoteSummary">{se name="DetailCommentLabelSummary"}{/se}*:</label>
                            <input name="sVoteSummary" type="text" value="{$sFormData.sVoteSummary|escape}" id="sVoteSummary" class="text {if $sErrorFlag.sVoteSummary}instyle_error{/if}" />
                        </div>
                    {/block}

                    {* Star Rating *}
                    {block name='frontend_detail_comment_input_rating'}
                        <div class="form_row col two">
                            <label for="sVoteStars">{se name="DetailCommentLabelRating"}{/se}*:</label>
                            <select name="sVoteStars" class="normal" id="sVoteStars">
                                <option value="10">{s name="Rate10"}{/s}</option>
                                <option value="9">{s name="Rate9"}{/s}</option>
                                <option value="8">{s name="Rate8"}{/s}</option>
                                <option value="7">{s name="Rate7"}{/s}</option>
                                <option value="6">{s name="Rate6"}{/s}</option>
                                <option value="5">{s name="Rate5"}{/s}</option>
                                <option value="4">{s name="Rate4"}{/s}</option>
                                <option value="3">{s name="Rate3"}{/s}</option>
                                <option value="2">{s name="Rate2"}{/s}</option>
                                <option value="1">{s name="Rate1"}{/s}</option>
                            </select>
                        </div>
                    {/block}

                    {* Comment text *}
                    {block name='frontend_detail_comment_input_text'}
                        <div class="form_row col one">
                            <label for="sVoteComment">{se name="DetailCommentLabelText"}{/se}</label>
                            <textarea name="sVoteComment" id="sVoteComment" cols="3" rows="2" class="text {if $sErrorFlag.sVoteComment}instyle_error{/if}">{$sFormData.sVoteComment|escape}</textarea>
                        </div>
                    {/block}

                    {* Captcha *}
                    {block name='frontend_detail_comment_input_captcha'}
                        <div class="captcha form_row col one">
                            <div class="captcha-placeholder" data-src="{url module=widgets controller=Captcha action=refreshCaptcha}"></div>
                            <div class="code">
                                <label>{se name="DetailCommentLabelCaptcha"}{/se}</label>
                                <input type="text" name="sCaptcha"class="text {if $sErrorFlag.sCaptcha}instyle_error{/if}" />
                            </div>
                        </div>
                    {/block}
                    <p class="col two">
                        {se name="DetailCommentInfoFields"}{/se}
                    </p>
                    <div class="form_row col two">
                        <input class="btn textright" type="submit" name="Submit" value="{s name="DetailCommentActionSave"}{/s}"/>
                    </div>
                </fieldset>


            </div>
        </form>
    {/block}
</div>

