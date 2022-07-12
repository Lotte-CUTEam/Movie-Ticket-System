/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]ie-checker.js
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.08       이성은         신규생성
 * -----------------------------------------------------------
 */

/*!
 * IE-Checker v1.0.1
 * https://github.com/Unk/IE-Checker
 *
 * Author : Naram Kim ( a.k.a. Unknown )
 * Email : unknown@grotesq.com
 *
 * Copyright 2007-2016 The GrotesQ
 * Released under the MIT license
 *
 * Date: 2016-09-19 00:46
 */
;( function() {
	var ua = navigator.userAgent.toLowerCase();
	var latest = 14;

	function addClass( version ) {
		var classNames = '';
		classNames += ' is-ie';
		classNames += ' ie' + version;
		for( var i = version + 1; i <= latest; i++ ) {
			classNames +=  ' lt-ie' + i;
		}
		document.getElementsByTagName( 'html' )[ 0 ].className += classNames;
	}

	if( /edge\/([0-9]{1,}[\.0-9]{0,})/.test( ua ) ) {
		ua = /edge\/([0-9]{1,}[\.0-9]{0,})/.exec( ua );
		if( ua ) {
			var version = parseInt( ua[ 1 ] );
		}

		addClass( version );
	}
	else if( ua.indexOf( 'msie' ) != -1 || ua.indexOf( 'trident' ) != -1 ) {
		var version = 11;
		ua = /msie ([0-9]{1,}[\.0-9]{0,})/.exec( ua );
		if( ua ) {
			var version = parseInt( ua[ 1 ] );
		}
		
		addClass( version );
	}
} )();