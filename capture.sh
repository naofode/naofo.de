<!DOCTYPE html>
<html>
	<head data-suburl="">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="author" content="Gogs - Go Git Service" />
		<meta name="description" content="Gogs(Go Git Service) a painless self-hosted Git Service written in Go" />
		<meta name="keywords" content="go, git, self-hosted, gogs">
		<meta name="_csrf" content="5ZVQbsTZQ-PQe4p55o1X-ori8Ac6MTQ1NTc2NjYwNDExMzY5NjYzOA==" />
		

		<link rel="shortcut icon" href="/img/favicon.png" />

		<link rel="stylesheet" href="/css/font-awesome.min.css">
		
		<script src="/ng/js/lib/jquery-1.11.1.min.js"></script>

		
		<link rel="stylesheet" href="/ng/css/ui.css">
		<link rel="stylesheet" href="/ng/css/gogs.css">
		<link rel="stylesheet" href="/ng/css/tipsy.css">
		<link rel="stylesheet" href="/ng/css/magnific-popup.css">
		<link rel="stylesheet" href="/ng/fonts/octicons.css">
		<link rel="stylesheet" href="/css/github.min.css">

		
    	<script src="/ng/js/lib/lib.js"></script>
    	<script src="/ng/js/lib/jquery.tipsy.js"></script>
    	<script src="/ng/js/lib/jquery.magnific-popup.min.js"></script>
        <script src="/ng/js/utils/tabs.js"></script>
        <script src="/ng/js/utils/preview.js"></script>
		<script src="/ng/js/gogs/issue_label.js"></script>
		<script src="/ng/js/gogs.js"></script>

		<title>naofode - NotABug.org: Free code hosting</title>
	</head>
	<body>
		<div id="wrapper">
		<noscript>Please enable JavaScript in your browser!</noscript>

<header id="header">
    <ul class="menu menu-line container" id="header-nav">
        
        <li class="head" id="header-nav-logo">
            <img src="/img/favicon.png" alt="avatar" class="avatar-30"/>
        </li>
        <li >
            <a href="/">Home</a>
        </li>
        <li><a href="/explore">Explore</a></li>
        <li><a href="/help">Help</a></li>
	<li><a href="/outages#2016-01-31">SSH Key</li>
        

        
            
            <li class="right" id="header-nav-sign-in">
                <a href="/user/login" title="Sign In"><i class="octicon octicon-sign-in"></i> Sign In</a>
            </li>
            
            <li class="right">
                <a href="/user/sign_up" title="Account Settings"><i class="octicon octicon-person-add"></i> Register</a>
            </li>
            
            
        
    </ul>
</header>

<div id="repo-wrapper">
    
<div id="repo-header" class="clear">
    <div class="container clear">
        <h1 id="repo-header-name" class="left public">
            <i class="mega-octicon octicon-repo"></i>
            <a class="author" href="/iikb">iikb</a>
            <span class="divider">/</span>
            <a class="repo text-bold" href="/iikb/naofode">naofode</a>
            
            
        </h1>
        <ul id="repo-header-meta" class="right menu menu-line">
            <li id="repo-header-download" class="drop">
                <a id="repo-header-download-btn" href="#">
                    <button class="btn btn-black text-bold btn-radius">
                        <i class="octicon octicon-cloud-download"></i>
                    </button>
                </a>
                <div id="repo-header-download-drop" class="drop-down">
                    <div id="repo-clone" class="clear">
                        
                        <button class="btn btn-blue left btn-left-radius" id="repo-clone-ssh" data-link="git@notabug.org:iikb/naofode.git">SSH</button>
                        
                        <button class="btn btn-gray left" id="repo-clone-https" data-link="https://notabug.org/iikb/naofode.git">HTTPS</button>
                        <input id="repo-clone-url" class="ipt ipt-disabled left" value="git@notabug.org:iikb/naofode.git" onclick="this.select();" readonly />
                        <button id="repo-clone-copy" class="btn btn-black left btn-right-radius" data-copy-val="val" data-copy-from="#repo-clone-url" original-title="Copy to clipboard" data-original-title="Copy to clipboard" data-after-title="Copied OK">Copy</button>
                        <p class="text-center" id="repo-clone-help">Need help cloning? Visit <a href="http://git-scm.com/book/en/Git-Basics-Getting-a-Git-Repository" rel="nofollow">Help</a>!</p>
                        <hr/>
                        <div class="text-center" id="repo-clone-zip">
                            <a class="btn btn-green btn-radius" href="/iikb/naofode/archive/master.zip"><i class="octicon octicon-file-zip"></i>ZIP</a>
                            <a class="btn btn-green btn-radius" href="/iikb/naofode/archive/master.tar.gz"><i class="octicon octicon-file-zip"></i>TAR.GZ</a>
                        </div>
                    </div>
                </div>
            </li>
            <li id="repo-header-watch">
                <a id="repo-header-watch-btn" href="/iikb/naofode/action/watch">
                    <button class="btn btn-gray text-bold btn-radius">
                        <i class="octicon octicon-eye-watch"></i>Watch<span class="num">2</span>
                    </button>
                </a>
            </li>
            <li id="repo-header-star">
                <a id="repo-header-star-btn" href="/iikb/naofode/action/star">
                    <button class="btn btn-gray text-bold btn-radius">
                        <i class="octicon octicon-star"></i>Star
                        <span class="num">0</span>
                    </button>
                </a>
            </li>
            <li id="repo-header-fork">
                <a id="repo-header-fork-btn" href="/repo/fork?fork_id=15299">
                    <button class="btn btn-gray text-bold btn-radius">
                        <i class="octicon octicon-repo-forked"></i>Fork
                        <span class="num">0</span>
                    </button>
                </a>
            
            </li>
        </ul>
    </div>
</div>


    <div id="repo-content" class="clear container">
        <div id="repo-main" class="left grid-5-6">
            <p id="repo-desc">
                <span class="description">Clone de <a href="https://github.com/naofode/naofo.de.git" target="_blank">https://github.com/naofode/naofo.de.git</a></span>
                <a class="link" href=""></a>
            </p>
            <ul id="repo-file-nav" class="clear menu menu-line">
                
                <li id="repo-branch-switch" class="down drop">
                    <a>
                        <button class="btn btn-gray btn-medium btn-radius">
                            <i class="octicon octicon-git-branch"></i> Branch:
                            <strong id="repo-branch-current">master</strong>
                        </button>
                    </a>
                    <div class="drop-down panel">
                        <p class="panel-header text-bold">Branches &amp; Tags</p>
                        
                        <div id="repo-branch-tag">
                            <ul class="menu menu-line tab-nav clear" id="repo-branch-tab-nav">
                                <li class="js-tab-nav js-tab-nav-show left" data-tab-target="#repo-branch-list"><a>Branches</a></li>
                                <li class="js-tab-nav  left" data-tab-target="#repo-tag-list"><a>Tags</a></li>
                            </ul>
                            <ul class="menu menu-vertical switching-list " id="repo-branch-list">
                                
                                <li ><a href="/iikb/naofode/src/dev"><i class="octicon octicon-check"></i>dev</a></li>
                                
                                <li class="checked"><a href="/iikb/naofode/src/master"><i class="octicon octicon-check"></i>master</a></li>
                                
                                <li ><a href="/iikb/naofode/src/naousemxyz"><i class="octicon octicon-check"></i>naousemxyz</a></li>
                                
                            </ul>
                            <ul class="menu menu-vertical switching-list hide" id="repo-tag-list">
                                
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="repo-bread" class="breads">
                    <a class="title bread" href="/iikb/naofode/src/master">naofode</a>
                    
                    
                    
                        
                        <span class="bread">capture.sh</span>
                        
                    
                </li>
                
            </ul>
            
                <div class="panel panel-radius" id="repo-read-file">
    <p class="panel-header">
        
            <i class="icon fa fa-file-text-o"></i>
            <strong class="file-name">capture.sh</strong><span class="file-size">448B</span>
	    
        
            <a class="right" href="/iikb/naofode/commits/master/capture.sh">
                <button class="btn btn-medium btn-gray btn-right-radius btn-comb">History</button>
            </a>
            <a class="right" href="/iikb/naofode/raw/master/capture.sh">
                <button class="btn btn-medium btn-gray btn-left-radius btn-comb">Raw</button>
            </a>
        
    </p>
    <div class=" code-view" id="repo-code-view">
    	
        <table>
            <tbody>
                <tr>
                    <td class="lines-num"></td>
                    <td class="lines-code"><pre class="prettyprint linenums lang-sh"><code>#!/bin/bash
## Adicionado xvfb-run conforme sugestões em https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2037#issuecomment-62019521 e https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=580226#34
xvfb-run wkhtmltoimage --disable-javascript --crop-h 13000 --crop-w 10000 --width 1280 $1 $2
rc=$?; if [[ $rc != 0 ]]; then
	xvfb-run wkhtmltoimage --disable-javascript --crop-h 13000 --crop-w 10000 --width 1280 --height 10000 $1 $2
fi
echo &#34;success&#34;
</code></pre></td>
                </tr>
            </tbody>
        </table>
    	
    </div>
</div>
            
        </div>
        <div id="repo-sidebar" class="right grid-1-6">
    <ul class="menu menu-vertical" id="repo-sidebar-nav">
        <li>
            <a class="radius" href="/iikb/naofode/issues"><i class="octicon octicon-issue-opened"></i>Issues<span class="num right label label-blue label-radius">0</span></a>
        </li>
        
        <li class="border-bottom"></li>
        <li class="head">master</li>
        <li>
            <a class="radius" href="/iikb/naofode/commits/master"><i class="octicon octicon-history"></i>Commits <span class="num right label label-gray label-radius">85</span></a>
        </li>
        
        <li>
            <a class="radius" href="/iikb/naofode/releases"><i class="octicon octicon-tag"></i>Releases <span class="num right label label-gray label-radius">0</span></a>
        </li>
        
        
    </ul>
</div>
    </div>
</div>
		</div>
		<footer id="footer">
		    <div class="container clear">
		        <p class="left">
			<a href="/about">About us</a>
			&bull;
		        <a href="/outages">Outages</a>
			&bull;
			<a href="/hp/gogs/issues">Report a problem</a>
			</p>

		        <div class="right" id="footer-links">
		            <div id="footer-lang" class="inline drop drop-top">Language
		                <div class="drop-down">
		                    <ul class="menu menu-vertical switching-list">
		                    	
		                        <li><a href="#">English</a></li>
		                        
		                        <li><a href="/iikb/naofode/src/master/capture.sh?lang=zh-CN">简体中文</a></li>
		                        
		                        <li><a href="/iikb/naofode/src/master/capture.sh?lang=zh-HK">繁體中文</a></li>
		                        
		                        <li><a href="/iikb/naofode/src/master/capture.sh?lang=de-DE">Deutsch</a></li>
		                        
		                        <li><a href="/iikb/naofode/src/master/capture.sh?lang=fr-FR">Français</a></li>
		                        
		                        <li><a href="/iikb/naofode/src/master/capture.sh?lang=nl-NL">Nederlands</a></li>
		                        
		                        <li><a href="/iikb/naofode/src/master/capture.sh?lang=lv-LV">Latviešu</a></li>
		                        
		                        <li><a href="/iikb/naofode/src/master/capture.sh?lang=ru-RU">Русский</a></li>
		                        
		                        <li><a href="/iikb/naofode/src/master/capture.sh?lang=ja-JP">日本语</a></li>
		                        
		                        <li><a href="/iikb/naofode/src/master/capture.sh?lang=es-ES">Español</a></li>
		                        
		                        <li><a href="/iikb/naofode/src/master/capture.sh?lang=pt-BR">Português</a></li>
		                        
		                        <li><a href="/iikb/naofode/src/master/capture.sh?lang=pl-PL">Polski</a></li>
		                        
		                    </ul>
		                </div>
		            </div>
		        </div>
		    </div>
		</footer>
	</body>
</html>

