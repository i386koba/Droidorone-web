//ヘッドアップディスプレイ　Live Videoに、方角、高度計を重ねて表示する
    // video要素のsrcに設定することで、映像を表示する (デバッグ動画)
    //$('#android-video').prop('src', "http://www.cirlution.com/FPV.mov");
    //Video受信前の静止画
    //$('#android-video').prop('poster', "Selection_096.png");
//    HTML5 videoでニコニコ動画風プレーヤー http://ascii.jp/elem/000/000/521/521366/index-2.html
//    clipプロパティは、ボックスを切り抜き表示（クリッピング）する http://www.htmq.com/style/clip.shtml
//    rect（上,右,下,左）
//    <div id="viewArea" style="position: absolute; clip: rect(0px, 640px, 360px, 0px);">
//    <canvas id="hudCanvas" width="600" height="720" style="background-color: rgba(0,0,0,0.1);">
//    HTML ページの SVG http://memopad.bitter.jp/w3c/svg/svg_inhtml.html
//    F15 HUD http://forum.flightgear.org/viewtopic.php?f=71&t=23601
//   <embed id="svg" src="orient16.svg" type="image/svg+xml" style="background-color:rgba(0,0,0,0.1);" />
//    
// jQueryでのサイズ、座標の取得方法まとめ http://taneppa.net/jquery-size/
var videoOffset =  $('#android-video').offset();
$("#commandStat").val("video.X: " + videoOffset.left + "video.Y: " + videoOffset.top);
hudCanvas = document.getElementById("hudCanvas");
hudCanvas.style.position = "absolute";
hudCanvas.style.left = "100px";
hudCanvas.style.top = "100px";
hudg = hudCanvas.getContext("2d");
hudg.fillStyle = "rgba(0, 0, 0, 1.0)";
hudg.fillText("X : " + videoOffset.left, 8, 48);
hudg.fillText("Y : " + videoOffset.top, 8, 64);
hudg.beginPath();
//    //パスの開始座標を指定する
hudg.moveTo(0, 100);
//    //座標を指定してラインを引いていく
hudg.lineTo(200, 100);
//    //パスを閉じる（最後の座標から開始座標に向けてラインを引く）
hudg.closePath();
//    //現在のパスを輪郭表示する
hudg.stroke();
//SVG
// svg要素の基本的な使い方まとめ http://www.h2.dion.ne.jp/~defghi/svgMemo/svgMemo_15.htm
// グラフに目盛りを表示する (SVG使用) http://www.openspc2.org/reibun/D3.js/code/graph/horizontal-bar/1002/index.html
hudSvg = document.getElementById("svg");
hudSvg.style.position = "absolute";
hudSvg.style.left = "100px";
hudSvg.style.top = "100px";
// 
var rote = -45;
hudSvg.style.transform = "rotate(" + rote + "deg)";
$("#commandStat").val("oriBar:" + oriBar.length);
//oriBar テスト270文字　540度
var intervalID = setInterval(function () {
 oriDeg++;
 if (oriDeg > 359) {
     oriDeg = 0;
 }
 var oriCahr = Math.floor(oriDeg / 2);
 $("#orient").html(("  " + oriDeg).substr(-4) + ":" + oriBar.substr(oriCahr, 90));
}, 100);

