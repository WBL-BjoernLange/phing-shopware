{block name='frontend_index_header_javascript' append}
    <!-- Start Visual Website Optimizer Asynchronous Code -->
    <script type='text/javascript'>
        var _vwo_code=(function() { {* prevent IDEs from removing trailing whitespace *}
        var account_id = "{$VWOAccountId}",
        settings_tolerance = {$VWOSettingsTolerance} ,
        library_tolerance = {$VWOLibraryTolerance} ,
        use_existing_jquery = {if $VWOUseNewJQuery}true{else}false{/if},
        // DO NOT EDIT BELOW THIS LINE
        f=false,d=document;return { use_existing_jquery:function() { return use_existing_jquery; } ,library_tolerance:function() { return library_tolerance; } ,finish:function() { if(!f) { f=true;var a=d.getElementById('_vis_opt_path_hides');if(a)a.parentNode.removeChild(a); }  } ,finished:function() { return f; } ,load:function(a) { var b=d.createElement('script');b.src=a;b.type='text/javascript';b.innerText;b.onerror=function() { _vwo_code.finish(); } ;d.getElementsByTagName('head')[0].appendChild(b); } ,init:function() { settings_timer=setTimeout('_vwo_code.finish()',settings_tolerance);this.load('//dev.visualwebsiteoptimizer.com/j.php?a='+account_id+'&u='+encodeURIComponent(d.URL)+'&r='+Math.random());var a=d.createElement('style'),b='body { opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important; } ',h=d.getElementsByTagName('head')[0];a.setAttribute('id','_vis_opt_path_hides');a.setAttribute('type','text/css');if(a.styleSheet)a.styleSheet.cssText=b;else a.appendChild(d.createTextNode(b));h.appendChild(a);return settings_timer; }  } ; } ());_vwo_settings_timer=_vwo_code.init();
    </script>
    <!-- End Visual Website Optimizer Asynchronous Code -->
{/block}