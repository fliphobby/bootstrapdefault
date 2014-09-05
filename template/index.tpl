<!-- Start of index.tpl -->
{combine_script id='equalheights' require='jquery' path='themes/bootstrapdefault/js/jquery.equalheights.js'}
{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}

<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div class="navbar-brand">{$TITLE}</div>
        </div>
        <div class="navbar-right">
            <ul class="nav navbar-nav">
{if !empty($image_orders)}
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-sort"></span> {'Sort order'|@translate} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
{foreach from=$image_orders item=image_order name=loop}
                        <li{if $image_order.SELECTED} class="active"{/if}><a href="{$image_order.URL}" rel="nofollow">{$image_order.DISPLAY}</a></li>
{/foreach}
                    </ul>
                </li>
{/if}
{if !empty($image_derivatives)}
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-picture"></span> {'Photo sizes'|@translate} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
{foreach from=$image_derivatives item=image_derivative name=loop}
                        <li{if $image_derivative.SELECTED} class="active"{/if}><a href="{$image_derivative.URL}" rel="nofollow">{$image_derivative.DISPLAY}</a></li>
{/foreach}
                    </ul>
                </li>
{/if}
                <li id="btn-grid" class="active"><a href="#"><span class="glyphicon glyphicon-th"></span></a></li>
                <li id="btn-list"><a href="#"><span class="glyphicon glyphicon-th-list"></span></a></li>
            </ul>
        </div>
    </div>
</nav>
{include file='infos_errors.tpl'}

<div class="container">
    <div id="content" class="row">
{if !empty($CATEGORIES)}
            <!-- Start of categories -->
{$CATEGORIES}
{footer_script}{literal}$(document).ready(function(){$('#content .last').load(function(){$('#content .thumbnail').equalHeights()})});{/literal}{/footer_script}
            <!-- End of categories -->
{/if}
    </div>
</div>
<div class="container">
    <div class="titrePage{if isset($chronology.TITLE)} calendarTitleBar{/if}">
        <!--
        <ul class="categoryActions">
            {if isset($favorite)}
                <li id="cmdFavorite"><a href="{$favorite.U_FAVORITE}" title="{'delete all photos from your favorites'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
                        <span class="pwg-icon pwg-icon-favorite-del"></span><span class="pwg-button-text">{'delete all photos from your favorites'|@translate}</span>
                    </a></li>
            {/if}
            {if isset($U_CADDIE)}
                <li id="cmdCaddie"><a href="{$U_CADDIE}" title="{'Add to caddie'|@translate}" class="pwg-state-default pwg-button">
                        <span class="pwg-icon pwg-icon-caddie-add"></span><span class="pwg-button-text">{'Caddie'|@translate}</span>
                    </a></li>
            {/if}
            {if isset($U_EDIT)}
                <li id="cmdEditAlbum"><a href="{$U_EDIT}" title="{'Edit album'|@translate}" class="pwg-state-default pwg-button">
                        <span class="pwg-icon pwg-icon-category-edit"></span><span class="pwg-button-text">{'Edit'|@translate}</span>
                    </a></li>
            {/if}
            {if isset($U_SEARCH_RULES)}
                {combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
                <li><a href="{$U_SEARCH_RULES}" onclick="popuphelp(this.href); return false;" title="{'Search rules'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
                        <span class="pwg-icon pwg-icon-help"></span><span class="pwg-button-text">(?)</span>
                    </a></li>
            {/if}
            {if isset($U_SLIDESHOW)}
                <li id="cmdSlideshow">{strip}<a href="{$U_SLIDESHOW}" title="{'slideshow'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
                        <span class="pwg-icon pwg-icon-slideshow"></span><span class="pwg-button-text">{'slideshow'|@translate}</span>
                        </a>{/strip}</li>
            {/if}
            {if isset($U_MODE_FLAT)}
                <li>{strip}<a href="{$U_MODE_FLAT}" title="{'display all photos in all sub-albums'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
                        <span class="pwg-icon pwg-icon-category-view-flat"></span><span class="pwg-button-text">{'display all photos in all sub-albums'|@translate}</span>
                        </a>{/strip}</li>
            {/if}
            {if isset($U_MODE_NORMAL)}
                <li>{strip}<a href="{$U_MODE_NORMAL}" title="{'return to normal view mode'|@translate}" class="pwg-state-default pwg-button">
                        <span class="pwg-icon pwg-icon-category-view-normal"></span><span class="pwg-button-text">{'return to normal view mode'|@translate}</span>
                        </a>{/strip}</li>
            {/if}
            {if isset($U_MODE_POSTED)}
                <li>{strip}<a href="{$U_MODE_POSTED}" title="{'display a calendar by posted date'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
                        <span class="pwg-icon pwg-icon-calendar"></span><span class="pwg-button-text">{'Calendar'|@translate}</span>
                        </a>{/strip}</li>
            {/if}
            {if isset($U_MODE_CREATED)}
                <li>{strip}<a href="{$U_MODE_CREATED}" title="{'display a calendar by creation date'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
                        <span class="pwg-icon pwg-icon-camera-calendar"></span><span class="pwg-button-text">{'Calendar'|@translate}</span>
                        </a>{/strip}</li>
            {/if}
            {if !empty($PLUGIN_INDEX_BUTTONS)}{foreach from=$PLUGIN_INDEX_BUTTONS item=button}<li>{$button}</li>{/foreach}{/if}
            {if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
        </ul>
        -->
        {if isset($chronology_views)}
            <div class="calendarViews">{'View'|@translate}:
                <a id="calendarViewSwitchLink" href="#">
                    {foreach from=$chronology_views item=view}{if $view.SELECTED}{$view.CONTENT}{/if}{/foreach}
                </a>
                <div id="calendarViewSwitchBox" class="switchBox">
                    {foreach from=$chronology_views item=view name=loop}{if !$smarty.foreach.loop.first}<br>{/if}
                        <span{if !$view.SELECTED} style="visibility:hidden"{/if}>&#x2714; </span><a href="{$view.VALUE}">{$view.CONTENT}</a>
                    {/foreach}
                </div>
                {footer_script}(SwitchBox=window.SwitchBox||[]).push("#calendarViewSwitchLink", "#calendarViewSwitchBox");{/footer_script}
            </div>
        {/if}

        {if isset($chronology.TITLE)}
            <h2 class="calendarTitle">{$chronology.TITLE}</h2>
        {/if}

    </div>{* <!-- titrePage --> *}

    {if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}

    {if !empty($category_search_results)}
        <div class="category_search_results">{'Album results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
            <em><strong>
                    {foreach from=$category_search_results item=res name=res_loop}
                        {if !$smarty.foreach.res_loop.first} &mdash; {/if}
                        {$res}
                    {/foreach}
                </strong></em>
        </div>
    {/if}

    {if !empty($tag_search_results)}
        <div class="tag_search_results">{'Tag results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
            <em><strong>
                    {foreach from=$tag_search_results item=tag name=res_loop}
                        {if !$smarty.foreach.res_loop.first} &mdash; {/if} <a href="{$tag.URL}">{$tag.name}</a>
                    {/foreach}
                </strong></em>
        </div>
    {/if}

    {if isset($FILE_CHRONOLOGY_VIEW)}
        {include file=$FILE_CHRONOLOGY_VIEW}
    {/if}

    {if !empty($CONTENT_DESCRIPTION)}
        <div class="additional_info">
            {$CONTENT_DESCRIPTION}
        </div>
    {/if}

    {if !empty($CONTENT)}<!-- Content -->{$CONTENT}<!-- Content -->{/if}

    {if !empty($cats_navbar)}
        {include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$cats_navbar}
    {/if}

    {if !empty($THUMBNAILS)}
        <!--<div class="loader"><img src="{$ROOT_URL}{$themeconf.img_dir}/ajax_loader.gif"></div>-->
        <ul class="thumbnails" id="thumbnails">
            {$THUMBNAILS}
        </ul>
    {/if}
    {if !empty($thumb_navbar)}
        {include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$thumb_navbar}
    {/if}

    {if !empty($PLUGIN_INDEX_CONTENT_END)}{$PLUGIN_INDEX_CONTENT_END}{/if}
</div>{* <!-- content --> *}
{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}
<!-- End of index.tpl -->