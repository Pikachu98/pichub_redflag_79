<%--
  Created by IntelliJ IDEA.
  User: msi
  Date: 2019/3/16
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Untitled Document</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link type="text/css" href="resources/css/reset.css" rel="Stylesheet" />
    <link type="text/css" href="resources/css/default.css" rel="Stylesheet" />
    <!--<link href='https://fonts.googleapis.com/css?family=Nunito:300' rel='stylesheet' type='text/css'>-->

    <script type="text/javascript">
        if (location.href.toString().indexOf('file://localhost/') == 0) {
            location.href = location.href.toString().replace('file://localhost/', 'file:///');
        }
    </script>

    <!-- 8.0.0.3382 -->
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/startPre.js"></script>
    <script src="data/document.js"></script>

    <style type="text/css">

        #outerContainer {
            width:1000px;
            height:1500px;
        }

        .vsplitbar {
            width: 3px;
            /*background: #B9B9B9;*/
            border-right: 1px solid #8f949a;
        }

        .vsplitbar:hover, .vsplitbar.active {
            background: #8f949a;
        }

        #rightPanel {
            background-color: White;
        }

        /*#leftPanel {
            min-width: 120px;
        }*/

        .splitterMask {
            position:absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            background-image: url(resources/images/transparent.gif);
            z-index: 20000;
        }

    </style>
    <script type="text/javascript" language="JavaScript"><!--
    var SITEMAP_COLLAPSE_VAR_NAME = 'c';
    var PLUGIN_VAR_NAME = 'g';
    var FOOTNOTES_VAR_NAME = 'fn';
    var ADAPTIVE_VIEW_VAR_NAME = 'view';
    var lastLeftPanelWidth = 295;
    var toolBarOnly = true;

    // isolate scope
    (function() {
        setUpController();

        var configuration = $axure.document.configuration;
        var _settings = {};
        _settings.projectId = configuration.prototypeId;
        _settings.isAxshare = configuration.isAxshare;
        _settings.loadFeedbackPlugin = configuration.loadFeedbackPlugin;
        var cHash = getHashStringVar(SITEMAP_COLLAPSE_VAR_NAME);
        _settings.startCollapsed = cHash == "1";
        if(cHash == "2") closePlayer();
        var gHash = getHashStringVar(PLUGIN_VAR_NAME);
        if(gHash == "") gHash = 1;
        _settings.startPluginGid = gHash;

        $axure.player.settings = _settings;

        $(window).bind('load', function() {
            if(CHROME_5_LOCAL && !$('body').attr('pluginDetected')) {
                window.location = 'resources/chrome/chrome.html';
            }
        });

        $(document).ready(function() {
            $axure.page.bind('load.start', mainFrame_onload);
            $axure.messageCenter.addMessageListener(messageCenter_message);

            $(document).on('pluginShown', function (event, data) {
                setVarInCurrentUrlHash('g', data ? data : '');
            });

            $(document).on('pluginCreated', function(event, data) {
                if($axure.player.settings.startPluginGid == data) {
                    $axure.player.showPlugin(data);
                }
            });

            if($axure.player.settings.loadFeedbackPlugin) {
                if($axure.player.settings.isAxshare) {
                    $axure.utils.loadJS('/Scripts/plugins/feedback/feedback8.js');
                } else {
                    $axure.utils.loadJS('http://share.axure.com/Scripts/plugins/feedback/feedback8.js');
                }
            }

            if(navigator.userAgent.indexOf("MSIE") >= 0) $('#outerContainer').width('100%');
            initialize();
            if($axure.player.settings.startCollapsed) $('#outerContainer').splitter({ sizeLeft: 0 });
            else $('#outerContainer').splitter({ sizeLeft: lastLeftPanelWidth });
            $('#leftPanel').width(lastLeftPanelWidth);

            $(window).resize(function() { resizeContent(); });

            $('#maximizePanelContainer').hide();

            initializeLogo();

            $(window).resize();
            resizeContent();

            $axure.player.collapseToBar();

            if($axure.player.settings.startCollapsed) {
                collapse();
                $('#leftPanel').width(0);
            }

            if(MOBILE_DEVICE) {
                $('#interfaceControlFrameMinimizeContainer').height('45px');
                $('#interfaceControlFrameMinimizeContainer a').height('45px');
                $('#interfaceControlFrameHeaderContainer').css('margin-top','45px');
                $('#interfaceControlFrameCloseContainer a').css('padding','10px 0px');
                $('#maximizePanelContainer').height('45px');//.css('top','inherit').css('bottom','0px');

                $('body').removeClass('hashover');

                if(IOS) {
                    $('#rightPanel').css('overflow', 'auto').css('-webkit-overflow-scrolling', 'touch').css('-ms-overflow-x', 'hidden');

                    window.addEventListener("orientationchange", function() {
                        var viewport = document.querySelector("meta[name=viewport]");
                        //so iOS doesn't zoom when switching back to portrait
                        viewport.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0');
                        viewport.setAttribute('content', 'width=device-width, initial-scale=1.0');
                        resizeContent();
                    }, false);

                    $axure.page.bind('load.start', function() {
                        resizeContent();
                    });
                }
            }

        });

        function initialize() {
            var legacyQString = getQueryString("Page");
            if (legacyQString.length > 0) {
                location.href = location.href.substring(0, location.href.indexOf("?")) + "#p=" + legacyQString;
                return;
            }

            var mainFrame = document.getElementById("mainFrame");
            //if it's local file on safari, test if we can access mainframe after its loaded
            if(SAFARI && document.location.href.indexOf('file://') >= 0) {
                $(mainFrame).load(function () {
                    var canAccess;
                    try {
                        var mainFrameWindow = mainFrame.contentWindow || mainFrame.contentDocument;
                        mainFrameWindow['safari_file_CORS'] = 'Y';
                        canAccess = mainFrameWindow['safari_file_CORS'] === 'Y';
                    } catch(err) {
                        canAccess = false;
                    }

                    if(!canAccess) window.location = 'resources/chrome/safari.html';
                });
            }

            mainFrame.contentWindow.location.href = getInitialUrl();
        }

        function initializeLogo() {
            if($axure.document.configuration.logoImagePath) {
                var image = new Image();
                image.onload = function() {
                    $('#logoImage').css('max-width', this.width + 'px');
                    $axure.player.resizeContent();
                };
                image.src = $axure.document.configuration.logoImagePath;

                $('#interfaceControlFrameLogoImageContainer').html('<img id="logoImage" src="" />');
                $('#logoImage').attr('src', $axure.document.configuration.logoImagePath).load(function() { resizeContent(); });
            } else $('#interfaceControlFrameLogoImageContainer').hide();

            if ($axure.document.configuration.logoImageCaption) {
                $('#interfaceControlFrameLogoCaptionContainer').html($axure.document.configuration.logoImageCaption);
            } else $('#interfaceControlFrameLogoCaptionContainer').hide();

            if(!$('#interfaceControlFrameLogoImageContainer').is(':visible') && !$('#interfaceControlFrameLogoCaptionContainer').is(':visible')) {
                $('#interfaceControlFrameLogoContainer').hide();
            }
        }

        var resizeContent = $axure.player.resizeContent = function() {
            var newHeight = $(window).height();
            var newWidth = $(window).width();

            var controlContainerHeight = newHeight;// - 30;
            if($('#interfaceControlFrameLogoContainer').is(':visible')) controlContainerHeight -= $('#interfaceControlFrameLogoContainer').outerHeight();// + 16;

            $('#outerContainer').height(newHeight).width(newWidth);
            $('.vsplitbar').height(newHeight);
            $('#leftPanel').height(newHeight);
            $('#interfaceControlFrame').height(newHeight);
            $('#interfaceControlFrameContainer').height(newHeight);
            $('#interfaceControlFrameHostContainer').height(controlContainerHeight);

            $('#rightPanel').height(newHeight);
            $('#mainFrame').height(newHeight);

            if($('#leftPanel').is(':visible')) $('#rightPanel').width($(window).width() - $('#leftPanel').width() - 1);// $('.vsplitbar').width());
            else $('#rightPanel').width($(window).width());

            $(document).trigger('ContainerHeightChange',[controlContainerHeight]);

            if(MOBILE_DEVICE) {
                if(!(getHashStringVar(ADAPTIVE_VIEW_VAR_NAME).length > 0)) $axure.messageCenter.postMessage('setAdaptiveViewForSize', {'width':newWidth, 'height':$('#rightPanel').height()});
            }
        }

        var collapseToBar = $axure.player.collapseToBar = function() {
            lastLeftPanelWidth = $('#leftPanel').width();
            $('#leftPanel').width('55px');
            $('.vsplitbar').hide();
            $('#rightPanel').width($(window).width() - $('#leftPanel').width());
            $(window).resize();
            $('#outerContainer').trigger('resize');
            toolBarOnly = true;
        }

        var expandFromBar = $axure.player.expandFromBar = function() {
            if($('.vsplitbar').is(':visible')) return;

            $('#leftPanel').width(lastLeftPanelWidth);
            $('.vsplitbar').show();
            $('#rightPanel').width($(window).width() - $('#leftPanel').width() - 1);// $('.vsplitbar').width());
            $(window).resize();
            $('#outerContainer').trigger('resize');
            toolBarOnly = false;
        }

    })();

    function messageCenter_message(message, data) {
        if(message == 'expandFrame') expand();
        else if(message == 'getCollapseFrameOnLoad' && $axure.player.settings.startCollapsed && !MOBILE_DEVICE) $axure.messageCenter.postMessage('collapseFrameOnLoad');
    }


    function getInitialUrl() {
        var pageName = getHashStringVar("p");
        if(pageName.length > 0) return pageName + ".html";
        else {
            var url = getFirstPageUrl($axure.document.sitemap.rootNodes);
            return (url ? url : "about:blank");
        }
    }

    function getFirstPageUrl(nodes) {
        for (var i = 0; i < nodes.length; i++) {
            var node = nodes[i];
            if (node.url) return node.url;
            else {
                var hasChildren = (node.children && node.children.length > 0);
                if (hasChildren) {
                    var url = getFirstPageUrl(node.children);
                    if (url) return url;
                }
            }
        }
        return null;
    }

    function closePlayer() {
        if($axure.page.location) window.location.href = $axure.page.location;
        else {
            var pageFile = getInitialUrl();
            var currentLocation = window.location.toString();
            window.location.href = currentLocation.substr(0, currentLocation.lastIndexOf("/") + 1) + pageFile;
        }
    }

    function replaceHash(newHash) {
        var currentLocWithoutHash = window.location.toString().split('#')[0];

        //We use replace so that every hash change doesn't get appended to the history stack.
        //We use replaceState in browsers that support it, else replace the location
        if(typeof window.history.replaceState != 'undefined') {
            try {
                //Chrome 45 (Version 45.0.2454.85 m) started throwing an error here when generated locally (this only happens with sitemap open) which broke all interactions.
                //try catch breaks the url adjusting nicely when the sitemap is open, but all interactions and forward and back buttons work.
                //Uncaught SecurityError: Failed to execute 'replaceState' on 'History': A history state object with URL 'file:///C:/Users/Ian/Documents/Axure/HTML/Untitled/start.html#p=home' cannot be created in a document with origin 'null'.
                window.history.replaceState(null, null, currentLocWithoutHash + newHash);
            } catch(ex) {}
        } else {
            window.location.replace(currentLocWithoutHash + newHash);
        }
    }

    function collapse() {
        setVarInCurrentUrlHash('c', 1);
        if(!toolBarOnly) lastLeftPanelWidth = $('#leftPanel').width();

        $('#maximizePanelContainer').show();
        $('#leftPanel').hide();
        $('.vsplitbar').hide();
        $('#rightPanel').width($(window).width());
        $(window).resize();
        $('#outerContainer').trigger('resize');

        $(document).trigger('sidebarCollapse');

        if(MOBILE_DEVICE) {
            $('#maximizePanelContainer').animate({
                top:$('#rightPanel').height() - $('#maximizePanelContainer').height()
            }, 300, 'swing', function() {
                $('#maximizePanelContainer').css('top', 'inherit').css('bottom', '0px');
            });
        }
    }

    function expand() {
        if(MOBILE_DEVICE) {
            $('#maximizePanelContainer').css('top', '0px').css('bottom', 'inherit');
        }

        deleteVarFromCurrentUrlHash('c');
        $('#maximizePanelContainer').hide();
        $('#leftPanel').width(lastLeftPanelWidth);
        $('#leftPanel').show();
        if(!toolBarOnly) {
            $('.vsplitbar').show();
            $('#rightPanel').width($(window).width() - $('#leftPanel').width() - 1);
        } else {
            $axure.player.collapseToBar();
        }
        $(window).resize();
        $('#outerContainer').trigger('resize');

        $(document).trigger('sidebarExpanded');
    }


    function mainFrame_onload() {
        if($axure.page.pageName) document.title = $axure.page.pageName;
    }

    function getQueryString(query) {
        var qstring = self.location.href.split("?");
        if(qstring.length < 2) return "";
        return GetParameter(qstring, query);
    }

    function GetParameter(qstring, query) {
        var prms = qstring[1].split("&");
        var frmelements = new Array();
        var currprmeter, querystr = "";

        for(var i = 0; i < prms.length; i++) {
            currprmeter = prms[i].split("=");
            frmelements[i] = new Array();
            frmelements[i][0] = currprmeter[0];
            frmelements[i][1] = currprmeter[1];
        }

        for(j = 0; j < frmelements.length; j++) {
            if(frmelements[j][0].toLowerCase() == query.toLowerCase()) {
                querystr = frmelements[j][1];
                break;
            }
        }
        return querystr;
    }

    function getHashStringVar(query) {
        var qstring = self.location.href.split("#");
        if(qstring.length < 2) return "";
        return GetParameter(qstring, query);
    }

    function setHashStringVar(currentHash, varName, varVal) {
        var varWithEqual = varName + '=';
        var poundVarWithEqual = varVal === '' ? '' :  '#' + varName + '=' + varVal;
        var ampVarWithEqual = varVal === '' ? '' :  '&' + varName + '=' + varVal;
        var hashToSet = '';

        var pageIndex = currentHash.indexOf('#' + varWithEqual);
        if(pageIndex == -1) pageIndex = currentHash.indexOf('&' + varWithEqual);
        if(pageIndex != -1) {
            var newHash = currentHash.substring(0, pageIndex);

            newHash = newHash == '' ? poundVarWithEqual : newHash + ampVarWithEqual;

            var ampIndex = currentHash.indexOf('&', pageIndex + 1);
            if(ampIndex != -1) {
                newHash = newHash == '' ? '#' + currentHash.substring(ampIndex + 1) : newHash + currentHash.substring(ampIndex);
            }
            hashToSet = newHash;
        } else if(currentHash.indexOf('#') != -1) {
            hashToSet = currentHash + ampVarWithEqual;
        } else {
            hashToSet = poundVarWithEqual;
        }

        if(hashToSet != '' || varVal == '') {
            return hashToSet;
        }

        return null;
    }

    function setVarInCurrentUrlHash(varName, varVal) {
        var newHash = setHashStringVar(window.location.hash, varName, varVal);

        if(newHash != null) {
            replaceHash(newHash);
        }
    }

    function deleteHashStringVar(currentHash, varName) {
        var varWithEqual = varName + '=';

        var pageIndex = currentHash.indexOf('#' + varWithEqual);
        if(pageIndex == -1) pageIndex = currentHash.indexOf('&' + varWithEqual);
        if(pageIndex != -1) {
            var newHash = currentHash.substring(0, pageIndex);

            var ampIndex = currentHash.indexOf('&', pageIndex + 1);

            //IF begin of string....if none blank, ELSE # instead of & and rest
            //IF in string....prefix + if none blank, ELSE &-rest
            if(newHash == '') { //beginning of string
                newHash = ampIndex != -1 ? '#' + currentHash.substring(ampIndex + 1) : '';
            } else { //somewhere in the middle
                newHash = newHash + (ampIndex != -1 ? currentHash.substring(ampIndex) : '');
            }

            return newHash;
        }

        return null;
    }

    function deleteVarFromCurrentUrlHash(varName) {
        var newHash = deleteHashStringVar(window.location.hash, varName);

        if(newHash != null) {
            replaceHash(newHash);
        }
    }
    --></script>

    <link type="text/css" rel="Stylesheet" href="plugins/sitemap/styles/sitemap.css" />
    <link type="text/css" rel="Stylesheet" href="plugins/page_notes/styles/page_notes.css" />
    <link type="text/css" rel="Stylesheet" href="plugins/debug/styles/debug.css" />
    <script src="resources/scripts/startPost.js"></script>


    <!--<link type="text/css" rel="Stylesheet" href="plugins/recordplay/styles/recordplay.css" />
    <script type="text/javascript" src="plugins/recordplay/recordplay.js"></script>-->


</head>
<body scroll="no" class="hashover">
<div id="outerContainer">

    <div id="leftPanel">
        <div id="interfaceControlFrame">
            <div id="interfaceControlFrameMinimizeContainer">
                <a title="Collapse" id="interfaceControlFrameMinimizeButton" onclick="collapse();">&nbsp;</a>
            </div>
            <div id="interfaceControlFrameHeaderContainer">
                <ul id="interfaceControlFrameHeader"></ul>
            </div>
            <div id="interfaceControlFrameContainer">
                <div id="interfaceControlFrameLogoContainer">
                    <div id="interfaceControlFrameLogoImageContainer"></div>
                    <div id="interfaceControlFrameLogoCaptionContainer"></div>
                </div>
                <div id="interfaceControlFrameHostContainer">
                </div>
            </div>
            <div id="interfaceControlFrameCloseContainer">
                <a title="Close" id="interfaceControlFrameCloseButton" onclick="closePlayer();">CLOSE</a>
            </div>
        </div>
    </div>
    <div id="rightPanel">
        <iframe id="mainFrame" name="mainFrame" width="100%" height="100%" src="" frameborder="0" style="display: block;" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
    </div>

</div>

<div id="maximizePanelContainer">
    <iframe id="expandFrame" src="resources/expand.html" width="100%" height="100%" scrolling="no" allowtransparency="true" frameborder="0"></iframe>
</div>

</body>
</html>

