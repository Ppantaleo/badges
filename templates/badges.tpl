{**
 * plugins/generic/badges/templates/articleFooter.tpl
 *
 * Copyright 2019
 * Portal de Revistas de la Universidad Nacional de La Plata
 *  https://revistas.unlp.edu.ar
 *  https://sedici.unlp.edu.ar
 *
 * @author gonetil
 *}

{if $doi}
    <link rel="stylesheet" type="text/css" href="{$badgesStylesheetUrl|escape}">
    <div class="item badges" style="display: none">
        <h2 class="label">{translate key="plugins.generic.badges.manager.settings.showBlockTitle"}</h2>

        <div class="badges_list">
        {if $showDimensions}
        <div class="sub_item">
            <span class="__dimensions_badge_embed__" data-doi="{$doi|escape}" data-hide-zero-citations="{$badgesDimensionsHideWhenEmpty|escape}" data-style="{$badgesDimensionsStyle|escape}"></span><script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>
        </div>
        {/if}

        {if $showAltmetric}
        <div class="sub_item">
            <script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script>
            <div data-badge-popover="right" data-badge-type="{$badgesAltmetricStyle|escape}" data-doi="{$doi|escape}" data-hide-no-mentions="{$badgesAltmetricHideWhenEmpty|escape}" class="altmetric-embed"></div>
        </div>
        {/if}

        {if $showPlumx}
        <div class="sub_item">
            <script type="text/javascript" src="//cdn.plu.mx/widget-popup.js"></script>
            <a href="https://plu.mx/plum/a/?doi={$doi|escape}" class="plumx-plum-print-popup" data-hide-when-empty="{$badgesPlumxHideWhenEmpty|escape}"></a>
        </div>
        {/if}
        </div><!-- .badges_list -->
    </div>

    {literal}
    <script>
        (function() {
            var BADGE_CLASSES = [
                '__dimensions_badge_embed__',
                'altmetric-embed',
                'plumx-plum-print-popup'
            ];
            var GIVE_UP_AFTER_MS = 15000;

            // Only the enabled badges are in the DOM, so missing elements are
            // expected rather than an error.
            function reveal() {
                var container = document.getElementsByClassName('badges')[0];
                if (!container) {
                    return false;
                }
                var rendered = BADGE_CLASSES.some(function(className) {
                    var badge = document.getElementsByClassName(className)[0];
                    return badge && badge.hasChildNodes();
                });
                if (rendered) {
                    container.style.display = 'block';
                }
                return rendered;
            }

            // The third-party scripts fill the badges in asynchronously, often
            // after the load event, so keep watching instead of checking once.
            function watch() {
                var container = document.getElementsByClassName('badges')[0];
                if (!container || reveal()) {
                    return;
                }
                var observer = new MutationObserver(function() {
                    if (reveal()) {
                        observer.disconnect();
                    }
                });
                observer.observe(container, {childList: true, subtree: true});
                window.setTimeout(function() {
                    observer.disconnect();
                }, GIVE_UP_AFTER_MS);
            }

            if (document.readyState === 'complete') {
                watch();
            } else {
                window.addEventListener('load', watch);
            }
        })();
    </script>
    {/literal}
{/if}
