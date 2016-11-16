//NetBeans でコード内の TODO を一覧表示させる http://wp.tekapo.com/2012/12/29/how-to-show-todo-list-in-netbeans/
//http://qiita.com/kazu56/items/36b025dac5802b76715c 【jQuery】フォーム部品の取得・設定まとめ
//テストページ
//http://i386koba.github.io/Droidrone-SkyWay/
//SkyWayに関するドキュメントとサンプルアプリ
//https://nttcom.github.io/skyway/documentation.html
// SkyWayのシグナリングサーバーへ接続する (APIキーを置き換える必要あり）
var apiKey = '30fa6fbf-0cce-45c1-9ef6-2b6191881109';
var peer;

var peerdConn = null; // 接続したコネを保存しておく変数
//2015.06
var helloAndroid = false;
var pCanvas = null;  //マウスパッド　キャンバス
var padg = null;     //マウスパッド コンテキスト
var pMouse = {x: null, y: null};// マウス座標
var isDragging = false; //マウスドラグフラグ
var yRange = 400;
var yCenter = 1500;
var xRange = 400;
var xCenter = 1500;
var commandStr = "";
var lastCommand = "";
//Drive REST API JavaScript Quickstart
//https://developers.google.com/drive/v2/web/quickstart/js
// Your Client ID can be retrieved from your project in the Google
// Developer Console, https://console.developers.google.com
var CLIENT_ID = '233745234921-nv641kj8arbantub6qde76ld1l2pp4jf.apps.googleusercontent.com';
var SCOPES = ['https://www.googleapis.com/auth/drive'];
var gapi;

// Initiate auth flow in response to user clicking authorize button.
function handleAuth() {
    //既存のPeer再接続（Android再起動の場合）
    if (helloAndroid) {
        peer.destroy();
        helloAndroid = false;
    }
    peer = new Peer({key: apiKey, debug: 3});
    peer.on('error', function (err) {
        setMsgTextArea('peer-err : ' + err);
    });
    peer.on('close', function () {
        peer.destroy();
        setMsgTextArea('peer Close: : ');
    });
    peer.on('open', function () {
        // - 自分のIDはpeerオブジェクトのidプロパティに存在する
        setMsgTextArea('My PeerID : ' + peer.id);
    });
    //
    gapi.auth.authorize({client_id: CLIENT_ID, scope: SCOPES, immediate: false}, handleAuthResult);
    return false;
}
//Check if current user has authorized this application.
function checkAuth() {
    gapi.auth.authorize({'client_id': CLIENT_ID, 'scope': SCOPES.join(' '), 'immediate': true}, handleAuthResult);
}

function handleAuthResult(authResult) {
    var authButton = document.getElementById('authorizeButton');
    if (authResult && !authResult.error) {
        // Access token has been successfully retrieved, requests can be sent to the API.
        gapi.client.load('drive', 'v2', loadPeerId);
    } else {
        // No access token could be retrieved, show the button to start the authorization flow.
        authButton.onclick = function () {
            gapi.auth.authorize({'client_id': CLIENT_ID, 'scope': SCOPES, 'immediate': false}, handleAuthResult);
        };
    }
}

//終了時
$(window).on("beforeunload", function () {
    peer.destroy();
});

var skyWayFolderID = "";
function loadPeerId() {
    //SkyWayフォルダ検索
    var SKYWAYRC_DIR = "SkyWayRC";
    var SKYWAY_ANDROID_ID = "SkyWayAndroid.id";
    //Drive REST API JavaScript Quickstart https://developers.google.com/drive/v2/web/quickstart/js
    var skyWayIdfileID = "";
    var requestFolder = gapi.client.drive.files.list({
        q: "'root' in parents and mimeType = 'application/vnd.google-apps.folder'and trashed = false"
    });
    //Search for Folder
    requestFolder.execute(function (resp) {
        setMsgTextArea("Google drive load PeerId file.");
        //appendPre('Files:');
        var files = resp.items;
        if (files && files.length > 0) {
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                if (file.title === SKYWAYRC_DIR) {
                    skyWayFolderID = file.id;
                    setMsgTextArea("Folder:" + file.title);
                } //else { //setMsgTextArea(file.title ); }
            }
            var requestFile = gapi.client.drive.files.list({
                q: "'" + skyWayFolderID + "' in parents and mimeType = 'text/plain'"
            });
            //Search for Files
            requestFile.execute(function (resp) {
                //appendPre('Files:');
                var files = resp.items;
                if (files && files.length > 0) {
                    for (var i = 0; i < files.length; i++) {
                        var file = files[i];
                        if (file.title === SKYWAY_ANDROID_ID) {
                            skyWayIdfileID = file.id;
                            setMsgTextArea("File:" + file.title);
                            //downloadFile(file, function (responseText){
                            //setMsgTextArea("download peer.id:" + responseText);
                            //});
                        }
                    }
                    var requestIdGet = gapi.client.drive.files.get({'fileId': skyWayIdfileID});
                    requestIdGet.execute(function (resp) {
                        console.log('Title: ' + resp.title);
                        console.log('Description: ' + resp.description);
                        console.log('MIME type: ' + resp.mimeType);
                        //peerStart(resp.description);
                        setMsgTextArea("Android peer.id:" + resp.description);
                        //Peer ID 接続
                        peerStart(resp.description);
                    });

                } else {
                    setMsgTextArea("SkyWayAndroid.id not found:");
                }
            });
        } else {
            setMsgTextArea('SkyWayRC-folder not found:');
        }
    });
}
//TODO:　カメラ画像、経路データをGoogleDriveに保存
//skyWayFolderIDの下に読み込み共有の経路ファイル、写真用のTime番号のフォルダ作る。
//GoogleDrive経路一覧共通ファイルに上記フォルダIDを追加。
//　GDフォルダ作成 Creating a folder https://developers.google.com/drive/v2/web/folder#creating_a_folder
//Google Driveフォルダに権限追加する方法 http://qiita.com/nurburg/items/7720d031a3adac5a3c34#%E6%9B%B8%E3%81%8D%E6%96%B9
//Google Drive APIs REST v2 Permissions: insert https://developers.google.com/drive/v2/reference/permissions/insert
var saveDirID = 0;
function gMkdir(name, url, data) {
    var request = gapi.client.drive.files.insert({ 
        'path': '/upload/drive/v2/files',
        'method': 'POST',
        "title": name,
        "parents": [{"id": skyWayFolderID}],
        "mimeType": "application/vnd.google-apps.folder"
    });
    request.execute(function(insert) {
        saveDirID = insert.id;
        console.log(insert);
	setMsgTextArea('JpegSaveDirID :' + saveDirID);
        //permissions change(共有（読み出し））
        var body = {
            //'value': value,//mailAddress
            'type': 'anyone',
            'role': 'reader'
        };
        var perRequest = gapi.client.drive.permissions.insert({
            'fileId': saveDirID,
            'resource': body,
            'sendNotificationEmails': 'false'  //"false"にすると通知メールが飛びません
        });
        perRequest.execute(function(resp) { 
	    console.log('permissions:Done');
	    console.log(resp);
	    saveJpegM(name + ".jpg", url, data);
        });
    });
}
//GDアップロードにはSimple、マルチパートがある。
//Simple upload https://developers.google.com/drive/v2/web/manage-uploads#simple
//うまくいかなかった。gapi.client.drive.files.insertはフォルダ以外のアップロードはJavascriptで使えない模様。
//gapi.client.requestでないとファイルのアップロードは無理。
//gapi.client.requestマルチパートアップロードでないとファイル名指定できない。シンプルアップロードではinsertでないとファイル名指定できない。
//よって、ファイル名を指定したいシンプルアップロードアップデートは無理な模様。
//drive v2 でファイルupload http://qiita.com/anyworks@github/items/98ffc5b2cac77d440a1e

//いまさら聞けないHTTPマルチパートフォームデータ送信 http://d.hatena.ne.jp/satox/20110726/1311665904
//JavaScriptのみでGoogle Driveに動的にテキストや画像等を保存する http://qiita.com/kjunichi/items/552f13b48685021966e4
//Google Drive APIでFile OpenからSaveまで http://qiita.com/nida_001/items/9f0479e9e9f5051bca3c  
/**
 * Insert new file.
 *
 * @param {File} fileData File object to read data from.
 * @param {Function} callback Function to call when the request is complete.
 */
const boundary = '-------314159265358979323846';
const delimiter = "\r\n--" + boundary + "\r\n";
const close_delim = "\r\n--" + boundary + "--";

function saveJpegM(name, url, data) {
    var contentType = 'image/jpeg'; // 'application/octet-stream';
    var metadata = {
      'title': name,
      'mimeType': contentType,
      'parents': [{'id': saveDirID}], //親フォルダここで指定
      'description' : data
    };
    //toDataURLのファイルの先頭　data:image/jpeg;base64,を削除
    var binaryData = url.replace(/^data:image\/(png|jpeg);base64,/,  "");
    var multipartRequestBody =
        delimiter + 'Content-Type: application/json\r\n\r\n' +
        JSON.stringify(metadata) + delimiter +
        'Content-Type: ' + contentType + '\r\n' +
        'Content-Transfer-Encoding: base64\r\n' +
        '\r\n' +  binaryData + close_delim;

    var request = gapi.client.request({
        'path': '/upload/drive/v2/files',
        'method': 'POST',
        'params': {'uploadType': 'multipart'},
        'headers': { 'Content-Type': 'multipart/mixed; boundary="' + boundary + '"' },
        'body': multipartRequestBody
    });
   
    request.execute(function(file) {
        console.log(file);
	//console.log(multipartRequestBody);
    });
}

function getSnap(){
    var videoWidth = video.get(0).videoWidth;
    var videoHeight = video.get(0).videoHeight;
    console.log("videoWidth:Height = " + videoWidth + " : " + videoHeight);
    //attr(key,value) http://semooh.jp/jquery/api/attributes/attr/key%2Cvalue/
    $('#tmp-canvas').attr("width", videoWidth);
    $('#tmp-canvas').attr("height", videoHeight);
    //http://www.html5.jp/tag/elements/video.html
    //videoの任意のフレームをcanvasに描画するメモ　http://d.hatena.ne.jp/favril/20100225/1267099197
    var tmpCanvas = $('#tmp-canvas').get(0);
    var tmpCtx = tmpCanvas.getContext("2d");
    tmpCtx.drawImage(video.get(0) ,0 ,0);
    var img = new Image();
    // 第2引数は品質レベルで、0.0~1.0の間の数値です。高いほど高品質。
    img.src = tmpCanvas.toDataURL("image/jpeg", 0.5);
    // 日時からGD画像保存フォルダを作成 new Date().toISOString()
    if (saveDirID === 0 ) {
	gMkdir(new Date().getTime(), img.src, $("#JSON").text());
    } else {
	saveJpegM(new Date().getTime() + ".jpg", img.src, $("#JSON").text());
    }

    img.onload = function(){
        img.width = videoWidth / 2;
        img.height = videoHeight / 2;
        //縦長なら回転 
        //if (videoWidth < videoHeight) {
            //tmpCanvas.css("-webkit-transform", "rotate(270deg)");
            //↑表示Canvasは回転するがキャプチャIMGは回転しない
            //DOM エレメント->jQuery オブジェクト http://please-sleep.cou929.nu/jquery-object-dom-element.html
            //$(img).css("-webkit-transform", "rotate(270deg)");
            //console.log("rotate.");
        //}
        //console.log("img.width:hight = " + img.width + " : " + img.height);
        $('#snap-area').append(img);
    };
}
//DOM読み込み完了　初期化
var google;
google.maps.event.addDomListener(window, 'load', initialize);

//HTML5のvideoとcanvasで動画のキャプチャを取る http://maepon.skpn.com/web/entry-32.html
var video;
function peerStart(destPeerId) {
    //peer接続されていたら無効
    if (helloAndroid) {
        setMsgTextArea('Peer is already　Open.');
        return;
    }
    // 相手への接続を開始する
    peerdConn = peer.connect(destPeerId);
    //, { serialization: 'none', metadata: {message: 'hi i want to chat with you!'} });
    setMsgTextArea('Try connect: ' + destPeerId);

    peerdConn.on('error', function (err) {
        setMsgTextArea('conn-err: ' + err);
    });

    // 接続が完了した場合のイベントの設定
    peerdConn.on("open", function () {
        setMsgTextArea('Open　connect: ' + peerdConn.peer);
        // メッセージ受信イベントの設定
        peerdConn.on("data", function (res) {
            //接続初回
            if (helloAndroid === false) {
                setMsgTextArea('From Android: ' + res);
                // Call-IDのメッセージを送信
                //peerdConn.send(peer.id); IDを送らなくてもAndroidでIDわかる
                //setMsgTextArea('Send To Android: ' + peer.id);
                helloAndroid = true;
            } else {
                readJData(res);
            }
        });
    });
    
    peer.on('call', function (call) {
        // - 相手のIDはCallオブジェクトのpeerプロパティに存在する
        setMsgTextArea('Call from : ' + call.peer);
        call.answer();
        //呼び出しに応答する時のMediaStreamは必須ではありません。もし応答時にMediaStreamをセットしなければ、一方向の通話が確立されます。
        setMsgTextArea('call Answer null');

        call.on('stream', function (stream) {
            // 映像ストリームオブジェクトをURLに変換する
            // - video要素に表示できる形にするため変換している
            var url = window.URL.createObjectURL(stream);
            setMsgTextArea('stream url: ' + url);
            // video要素のsrcに設定することで、映像を表示する 	 	
            video.prop('src', url);
            //GamePad監視 一定時間隔で、繰り返し実行される関数 30FPS
            //if (gamepadNo !== -1) {
            //setInterval(gamePadListen, 1000 / 30);
            //}
        });
        call.on('error', function (err) {
            setMsgTextArea('call-err : ' + err);
        });
    });
}

//地図クリア
var rPoly;
var sPoly;

function initialize() {
    //シンボルをポリラインに追加する https://developers.google.com/maps/documentation/javascript/symbols?hl=ja#add_to_polyline
    //var lineSymbol = {
        //: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
    //};
    rPoly = new google.maps.Polyline({
        strokeColor: '#0000FF',
        strokeOpacity: 1.0,
        strokeWeight: 3,
        //icons: [{ 最後にしかマーカーされない
            //icon: lineSymbol,
            //offset: '100%'
        //}],
        zIndex: 1// 重なりの優先値(z-index)
    });
    //https://developers.google.com/maps/documentation/javascript/3.exp/reference?hl=ja#PolylineOptions
    sPoly = new google.maps.Polyline({
        strokeColor: '#00FFFF',
        strokeOpacity: 1.0,
        strokeWeight: 2,
        editable: true,
        zIndex: 1// 重なりの優先値(z-index)
    });

    //PeerIDセレクトで接続
    $("#peers").change(function () {
        peerStart($(this).val()); //Android のdataConn PeerID
    });
    //複数のマーカーをまとめて地図上から削除する http://googlemaps.googlermania.com/google_maps_api_v3/ja/map_example_remove_all_markers.html
    //マウスによる2chプロポ操作　Canvas上の矢印をドラッグしてXY座標入力。
    //マウスを離すと0点に戻るようにする。
    //pCanvas = document.getElementById("padCanvas");  
    //canvas をjQueryで使う。 http://tnomura9.exblog.jp/12624562/ 
    pCanvas = $("#padCanvas").get(0);
    padg = pCanvas.getContext("2d");
    //mCanvas = document.getElementById("mouseCanvas");
    mCanvas = $("#mouseCanvas").get(0);
    mouseg = mCanvas.getContext("2d");
    //初期化
    pMouse.x = 100;
    pMouse.y = 100;
    padDraw();

    //HTML5のcanvas内の複数の画像をドラッグ＆ドロップさせてみる http://qiita.com/akase244/items/b801f435e85ea67a70eb
    pCanvas.addEventListener("mousedown", function (e) {
        // マウス位置を更新
        var rect = e.target.getBoundingClientRect();
        pMouse.x = e.clientX - rect.left;
        pMouse.y = e.clientY - rect.top;
        if (pMouse.x > 90 && pMouse.x < 110 && pMouse.y > 90 && pMouse.y < 110) {
            isDragging = true;
        }
    }, false);

    // ドラッグ終了
    pCanvas.addEventListener('mouseup', function (e) {
        isDragging = false;
        pMouse.x = 100;
        pMouse.y = 100;
        padDraw();
    }, false);

    pCanvas.addEventListener("mousemove", function (e) {
        //ドラッグ中
        if (isDragging === true) {
            //要素の上でマウスが動いた際の処理 http://tmlife.net/programming/javascript/javascript-mouse-pos.html
            // マウス位置を更新 // 注）getBoundingClientRect()はページがスクロールしても対応しているようです。
            //http://cartman0.hatenablog.com/entry/2015/06/29/022301
            var rect = e.target.getBoundingClientRect();
            pMouse.x = parseInt(e.clientX - rect.left);
            pMouse.y = parseInt(e.clientY - rect.top);
            padDraw();
        }
    }, false);

    // 要素からマウスが出た際の処理
    pCanvas.addEventListener("mouseout", function (e) {
        isDragging = false;
        pMouse.x = 100;
        pMouse.y = 100;
        padDraw();
    }, false);
    //サーボPWMの制御幅で角度コントロール
    //http://tetsuakibaba.jp/index.php?page=workshop/ServoBasis/main
    //パルス幅　800us〜1500usでー90～0度、1500us~2300usで0〜90度の角度設定．
    //初期値読み取り
    yRange = $("#yRange").val();//400;
    yCenter = $("#yCenter").val();//1500;
    xRange = $("#xRange").val();//400;
    xCenter = $("#xCenter").val();//1500;

    //変更読み取り
    $("#yRange").change(function () {
        yRange = $("#yRange").val();
    });
    $("#yCenter").change(function () {
        yCenter = $("#yCenter").val();
    });
    $("#xRange").change(function () {
        xRange = $("#xRange").val();
    });
    $("#xCenter").change(function () {
        xCenter = $("#xCenter").val();
    });
    //PAD十字の描画　http://www.htmq.com/canvas/lineTo.shtml
    padg.beginPath();
    padg.moveTo(0, 100);
    padg.lineTo(200, 100);
    padg.closePath();
    padg.stroke();
    padg.beginPath();
    padg.moveTo(100, 0);
    padg.lineTo(100, 200);
    padg.closePath();
    padg.stroke();

    //Camera servo control　
    //レンジ入力（input[type=range]）の変更時の値をリアルタイムに取得する　http://elearn.jp/jmemo/jquery/memo-287.html
    //Xカメラ操作
    $("#xCamera").on('input', function () {
        //JavaScriptでゼロ埋めする方法 http://stabucky.com/wp/archives/4655
        commandStr = ("0" + $("#xCamera").val()).slice(-4) + "x";
    });

    //Center Click
    $("#xCset").click(function () {
        $("#xCamera").val($("#xCCenter").val());
        commandStr = ("0" + $("#xCamera").val()).slice(-4) + "x";
    });

    //xCamera　中心　xCCenter
    $("#xCamera").val($("#xCCenter").val());
    $("#xCCenter").on('input', function () {
        $("#xCamera").val($("#xCCenter").val());
        commandStr = ("0" + $("#xCamera").val()).slice(-4) + "x";
    });

    //Yカメラ操作
    $("#yCamera").on('input', function () {
        yCamera = ("0" + $("#yCamera").val()).slice(-4);
        commandStr = ("0" + $("#yCamera").val()).slice(-4) + "y";
    });

    //Center Click
    $("#yCSet").click(function () {
        $("#yCamera").val($("#yCCenter").val());
        commandStr = ("0" + $("#yCamera").val()).slice(-4) + "y";
    });

    //CameraY↑範囲"yCMaxRange"
    $("#yCamera").prop('max', $("#yCMaxRange").val());
    $("#yCMaxRange").change(function () {
        $("#yCamera").prop('max', $("#yCMaxRange").val());
    });

    //CameraY↓範囲"yCMinRange
    $("#yCamera").prop('min', $("#yCMinRange").val());
    $("#yCMinRange").change(function () {
        $("#yCamera").prop('min', $("#yCMinRange").val());
    });

    //CameraY 補正"yCCenter"
    $("#yCamera").val($("#yCCenter").val());
    $("#yCCenter").on('input', function () {
        $("#yCamera").val($("#yCCenter").val());
        commandStr = ("0" + $("#yCamera").val()).slice(-4) + "y";
    });

    //BT connect Click
    $("#btConn").click(function () {
        commandStr = "btConnect";
    });

    //videoRotate https://sites.google.com/site/westinthefareast/home/html5/css3videorotate
    //http://www.buildinsider.net/web/jqueryref/005
    $("#videoRotate270").click(function () {
        $("#android-video").css("-webkit-transform", "rotate(270deg)");
    });

    $("#videoRotate0").click(function () {
        $("#android-video").css("-webkit-transform", "rotate(0deg)");
    });

    $("#RcBatVol").html("-.-");
    //TODO: 位置データデバック用自動更新 
    //setInterval("autoCommandTest()", 1000);
    
    //マーカー、パスのクリア
    $("#mapClear").click(function () {
        for ( var i = 0; i < rMarkerArray.length; i++ ) { 
            rMarkerArray[i].setMap(null);
        }
        rMarkerArray = [];
        var rPath = rPoly.getPath();
        //sPoly.setMap(null);
        rPoly.setMap(null);
	
//ポリラインを検査する https://developers.google.com/maps/documentation/javascript/shapes?hl=ja#polyline_remove
//MVCArray class  https://developers.google.com/maps/documentation/javascript/3.exp/reference?hl=ja#MVCArray
	rPath.clear();
	//rPath.push(sPos);
    });
    video = $('#android-video');
    //テスト
    $('#snapshot-btn').click(getSnap);
}

//マウスによるPAD操作の描画
function  padDraw() {
    // クリア
    mouseg.clearRect(0, 0, pCanvas.width, pCanvas.height);

    //カメラ位置　横方向センターか？
    if ($("#xCamera").val() !== $("#xCCenter").val()) {
        //if (peerdConn) {
        //    peerdConn.send(("0" + $("#xCCenter").val()).slice(-4) + "x");
        //}
        return;
    }
    // マウスの位置に三角を描画
    mouseg.beginPath();
    //パスを使って図形を描画するには？ http://javascript-api.sophia-it.com/reference/%E3%83%91%E3%82%B9%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E5%9B%B3%E5%BD%A2%E3%82%92%E6%8F%8F%E7%94%BB%E3%81%99%E3%82%8B%E3%81%AB%E3%81%AF%EF%BC%9F
    //mouseg.arc(pMouse.x, pMouse.y, 16, 0, Math.PI * 2, false);
    mouseg.moveTo(pMouse.x, pMouse.y - 20);
    mouseg.lineTo(pMouse.x - 15, pMouse.y + 10);
    mouseg.lineTo(pMouse.x + 15, pMouse.y + 10);
    mouseg.closePath();
    mouseg.strokeStyle = "blue"; // 線の色を指定する
    mouseg.fillStyle = "green";  // 塗りつぶしの色を指定する
    mouseg.fill();
    mouseg.stroke();
    // マウスの情報を表示
    //padg.fillStyle = "rgba(0, 0, 0, 1.0)";
    //padg.fillText("Mouse X : " + pMouse.x, 8, 48);
    //padg.fillText("Mouse Y : " + pMouse.y, 8, 64);
    var yR = Number(yRange);
    var yC = Number(yCenter);
    var xR = Number(xRange);
    var xC = Number(xCenter);
    pMouse.x = pMouse.x - 100;
    pMouse.y = pMouse.y - 100;
    //Arduino サーボ制御　http://tetsuakibaba.jp/index.php?page=workshop/ServoBasis/main
    var xPWM = xC + parseInt(pMouse.x * (xR / 100), 10);
    var yPWM = yC + parseInt(pMouse.y * (yR / 100), 10);
    commandStr = xPWM + "" + yPWM + "m";
}

var map;
var lastBtR = "";
//https://developers.google.com/maps/documentation/javascript/reference#Circle
var gpsAccCircle = new google.maps.Circle({
    fillColor: '#ff0000', // 塗りつぶし色
    fillOpacity: 0.2, // 塗りつぶし透過度（0: 透明 ⇔ 1:不透明）
    strokeColor: '#ff0000', // 外周色
    strokeOpacity: 0.5, // 外周透過度（0: 透明 ⇔ 1:不透明）
    strokeWeight: 1, // 外周太さ（ピクセル）
    zIndex: 1 //
});
var gpsAccCount = 0;
var setFinCircle = new google.maps.Circle({
    fillColor: '#00ff00', // 塗りつぶし色 緑
    fillOpacity: 0.2, // 塗りつぶし透過度（0: 透明 ⇔ 1:不透明）
    strokeColor: '#00ff00', // 外周色
    strokeOpacity: 0.5, // 外周透過度（0: 透明 ⇔ 1:不透明）
    strokeWeight: 1, // 外周太さ（ピクセル）
    zIndex: 1 //
});
var gpsMarker = null;
var sMarker = null;
var roverMarker = null;
//ＧＰＳ起動時のmap作成フラグ
var onGps = false;
//var rInfoWin = new google.maps.InfoWindow();
var checkInfoWin = new google.maps.InfoWindow({
    content: '<button onClick="checkedInfoWin()">現在位置設定</button>'
});

var hudCanvas = null;  //ヘッドアップ　キャンバス
var hugg = null;     //ヘッドアップ コンテキスト
var ori8 = ["N W", "  N  ", "N E", " E ", "S E", " S ", "S W", " W ", "N W", "  N  ", "N E", " E "];
var oriBar = "W";
for (var i = 0; i < ori8.length; i++) {
    oriBar += ("|........|........|" + ori8[i]);
}
var sPos;
var rPos = null;
var lastrPos = null;
var jData;
var sDragend = false;
var farstSetPos;
var farstSetMaker = new google.maps.Marker({});
var reachInfoWin = new google.maps.InfoWindow({
    content: '次の移動場所に行くならClose'
            //'<button onClick="checkedInfoWin()"></button>'
});
var reachInfoWinClose = false;
google.maps.event.addListener(reachInfoWin, 'closeclick', function () {
    reachInfoWinClose = true;
});

var vRotate = 0;

function readJData(res) {
    $("#JSON").html(res);
    //Androidデータ読み出し
    jData = eval('(' + res + ')');
    //Chromeデベロッパー・ツールの機能 http://www.buildinsider.net/web/chromedevtools/01#page-9
    //jData.rota 0-180と0~-180 -> 0-360変更済み
    //現在位置
    $('#droidroneStat').html("No.: " + jData.no + ", GPS lat:" + jData.lat
            + ", lag: " + jData.lng
            + ", 高度: " + jData.alti + 'm'
            + ', 誤差: ' + jData.accuracy + 'm'
            + ', pitch: ' + jData.pitch + '°'
            + ', roll: ' + jData.roll + '°');
    //方角表示
    $("#orient").html(("00" + jData.rota).substr(-3) + ":" + oriBar.substr(Math.floor(jData.rota / 2), 90).substr(25, 45));

    //Android　バッテリ情報
    $("#Astat").html(" Bat: " + jData.batLevel + "％, Temp: " + (jData.batTemp / 10).toFixed(1) + "℃");

    //メディアPeer接続後にBTコマンドが前回と違うとコマンド送信
    if (helloAndroid && commandStr !== lastCommand) {
        lastCommand = commandStr;
        $("#commandStat").val('PeerSend[' + commandStr + ']');
        //console.log(commandStr);
        // Peer送信
        if (peerdConn) {
            peerdConn.send("BTC:" + commandStr);
        }
    }
    //初回GPS受信できない場合　サーリューション35.8401073,137.9581047
    if (jData.lat === 'NoData') {
        if (!onGps) {
            //readJData('{"no":0,"lat":35.8401073,"lng":137.9581047,"alti":700,"btr":"BAT:0.0"}');
        }
        //GPSデータ受信
    } else {
        //console.debug('Debug!! jData:' + res);
        var gPos = new google.maps.LatLng(jData.lat, jData.lng);
        //GPS受信初回、地図,マーカーなど定義
        if (!onGps) {
            var mapOptions = {
                zoom: 18,
                center: gPos, mapTypeId: google.maps.MapTypeId.ROADMAP,
                //mapTypeId: google.maps.MapTypeId.TERRAIN
                noClear: false //http://www.openspc2.org/Google/Maps/api3/Map_option/noClear/
            };
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            //GPSマーカー　赤丸
            gpsMarker = new google.maps.Marker({
                icon: {path: google.maps.SymbolPath.CIRCLE,
                    scale: 3,
                    strokeColor: '#FF0000'
                },
                map: map,
                zIndex: 1// 重なりの優先値(z-index)
            });

            //現在位置指定マーカー　青丸
            sMarker = new google.maps.Marker({
                icon: {path: google.maps.SymbolPath.CIRCLE,
                    scale: 3,
                    strokeColor: '#0000FF'
                },
                draggable: true, // ドラッグ可能にする
                map: map,
                position: gPos,
                zIndex: 3// 重なりの優先値(z-index)
            });
            //情報ウィンドウを開く/閉じる http://www.ajaxtower.jp/googlemaps/ginfowindow/index2.html
            initInfoWin = new google.maps.InfoWindow({
                content: '青丸アイコンを現在地にドラッグしてください。'
            });
            initInfoWin.open(map, sMarker);

            ////マウスによる位置修正 http://orange-factory.com/dnf/googlemap_v3.html
            // マーカーのドロップ（ドラッグ終了）時のイベント
            google.maps.event.addListener(sMarker, 'dragend', function (ev) {
                sDragend = true;
                // イベントの引数evの、プロパティ.latLngが緯度経度。
                sPos = ev.latLng;
                initInfoWin.close();
                checkInfoWin.open(map, sMarker);
                //https://developers.google.com/maps/documentation/javascript/3.exp/reference?hl=ja#InfoWindow
                google.maps.event.addListener(checkInfoWin, 'closeclick', function () {
                    sDragend = false;
                });
            });
            //移動場所設定　PATH
            google.maps.event.addListener(map, 'click', function (ev) {
                if (!sDragend && !$('#autoOff').prop('checked')) {
                    var setPos = ev.latLng;
                    var sPath = sPoly.getPath();
                    sPath.push(setPos);
                    sPoly.setMap(map);
                }
            });
            //GPS起動確認
            onGps = true;
        }
        //GPS測定場所アイコン
        gpsMarker.setPosition(gPos);
        //前回GPS精度円を除去
        gpsAccCircle.setMap(null);
        if (gpsAccCount++ > 10) {
            gpsAccCount = 0;
            //半径を指定した円を地図上の中心点に描く http://www.nanchatte.com/map/circle-v3.html
            gpsAccCircle.setCenter(gPos);
            // 中心点(google.maps.LatLng)
            gpsAccCircle.setRadius(jData.accuracy);
            gpsAccCircle.setMap(map);
        }
    }
    if (roverMarker !== null) {
        roverMarker.setMap(null);
    }
    //現在地マーカー　赤
    roverMarker = new google.maps.Marker({
        position: rPos,
        icon: {path: 'M -2,2 0,-2 2,2 0,0 z',
            //var arrowPath = google.maps.SymbolPath.FORWARD_CLOSED_ARROW;
            // 矢印中心が先っぽだったのでPath作った。
            scale: 3,
            strokeColor: '#FF0000',
            rotation: jData.rota
        },
        map: map,
        zIndex: 2// 重なりの優先値(z-index)
    });
    //BuleTooth受信解析（タイヤ回転センサ、バッテリー電圧）
    var btr = jData.btr;
    if (btr !== "") { // 文字列切り出し http://catprogram.hatenablog.com/entry/2013/05/13/231457
        //RCバッテリ電圧表示
        if (btr.substr(0, 4) === "BAT:") {
            var a0Vol = btr.substr(4) * 0.0112;//(10 / 1024); 分圧1・2ですが実測値より計算
            $("#RcBatVol").html(a0Vol.toFixed(1) + "V");
            //ローバーホイル回転センサー受信
        } else if (btr.substr(0, 4) === "RPS:" && btr.substr(4) !== '0' && rPos !== null) {
            //タイヤ一回転カウントでの距離
            var countM = Number($("#countM").val()) * 0.001;
            //ホイルカウントから1秒間の距離を計算
            var dis = Number(btr.substr(4)) * countM;
            //Google Maps JavaScript API V3 ジオメトリ ライブラリ //http://gm-api.net/geometry.html
            //computeOffset() を使用すると、特定の方向、出発地、移動距離（メートル単位）から、目的地の座標を計算できます。
            //https://developers.google.com/maps/documentation/javascript/3.exp/reference#spherical
            rPos = google.maps.geometry.spherical.computeOffset(rPos, dis, jData.rota);
            //現在地マーカー　赤
            //マップ中心をローバーアイコンで移動
            if ($('#MapPanOff').prop('checked')) {
                map.setCenter(rPos);
            }
            //距離が5m動いたらパス描画,データ記録
            //地図上の２点間の距離を求める http://www.nanchatte.com/map/computeDistance.html
            var distance = google.maps.geometry.spherical.computeDistanceBetween(rPos, lastrPos);
            setBtTextArea("距離" + distance.toFixed(2) + "m," + btr + ",rot:" + jData.rota + "°.");
            if (distance > 2) {
                lastrPos = rPos;
                rPathDraw(rPos);
 		//video画面をGD保存
		//attr(key,value) http://semooh.jp/jquery/api/attributes/attr/key%2Cvalue/
		$('#tmp-canvas').attr("width", video.get(0).videoWidth);
		$('#tmp-canvas').attr("height", video.get(0).videoHeight);
		//http://www.html5.jp/tag/elements/video.html
		//videoの任意のフレームをcanvasに描画するメモ　http://d.hatena.ne.jp/favril/20100225/1267099197
		var tmpCanvas = $('#tmp-canvas').get(0);
		var tmpCtx = tmpCanvas.getContext("2d");
		tmpCtx.drawImage(video.get(0) ,0 ,0);
		//第2引数は品質レベルで、0.0~1.0の間の数値です。高いほど高品質。
		var url = tmpCanvas.toDataURL("image/jpeg", 0.5);
		//記録用GDフォルダ作製
                if (saveDirID === 0) {
                    gMkdir(jData.time, url, res);
                } else {
		    saveJpegM(jData.time + ".jpg", url, res);
                }
            }

            //TODO: 自動操縦 (将来的にはAndroidで、）
            var setDis = 1.0; //自動運転停止、設定位置までの距離
            if (!$('#autoOff').prop('checked')) {
                //https://developers.google.com/maps/documentation/javascript/3.exp/reference?hl=ja#MVCArray
                var sPath = sPoly.getPath();
                var num = sPath.getLength();
                if (num > 0) {
                    farstSetPos = sPath.getAt(0);
                    farstSetMaker.setMap(null);
                    farstSetMaker.setPosition(farstSetPos);
                    farstSetMaker.setMap(map);

                    //前回設定終了円を除去
                    setFinCircle.setMap(null);
                    //半径を指定した円を地図上の中心点に描く http://www.nanchatte.com/map/circle-v3.html
                    setFinCircle.setCenter(farstSetPos); // 中心点(google.maps.LatLng)
                    setFinCircle.setRadius(setDis);
                    setFinCircle.setMap(map);
                    //https://developers.google.com/maps/documentation/javascript/geometry?hl=ja#Navigation
                    var heading = google.maps.geometry.spherical.computeHeading(rPos, farstSetPos);
                    var distance = google.maps.geometry.spherical.computeDistanceBetween(rPos, farstSetPos);
                    if (heading < 0) { //マイナス角度修正
                        heading += 360;
                    }
                    setBtTextArea("設定までd:" + distance.toFixed(2) + "m,　h:" + heading.toFixed(0) + "°.");
                    //設定場所到着
                    if (distance < setDis) {
                        commandStr = "15001500m"; //停止
                        if ($('#selfOn').prop('checked') && !reachInfoWinClose) {
                            reachInfoWin.open(map, farstSetMaker);
                        } else {
                            farstSetMaker.setMap(null);
                            sPath.removeAt(0);
                            reachInfoWinClose = false;
                        }
                    } else {
                        //目的までの方向条件
                        var speed = 1470;
                        //direction は　rotaから見たheadingの角度
                        var direction = heading - jData.rota;
                        // 左　０　～　-１８０、　右　０～１８０
                        if (direction < -180) {
                            direction += 360;
                        }
                        if (direction > 180) {
                            direction -= 360;
                        }
                        if (direction > 0) {
                            //ローバーの右が目的地
                            if (direction > 90) { //急角度
                                commandStr = "1700" + speed + "m";
                                $("#commandStat").val(jData.rota + '自動操縦 右 急旋回' + direction.toFixed(0));
                            } else if (direction < 10) {
                                commandStr = "1500" + speed + "m";
                                $("#commandStat").val(jData.rota + '自動操縦　直進' + direction.toFixed(0));
                            } else { // 右　なだらか
                                commandStr = "1600" + speed + "m";
                                $("#commandStat").val(jData.rota + '自動操縦 右 旋回' + direction.toFixed(0));
                            }
                        } else {
                            //ローバーの左が目的地
                            if (direction < -90) {
                                commandStr = "1300" + speed + "m";
                                $("#commandStat").val(jData.rota + '自動操縦 左 急旋回' + direction.toFixed(0));
                            } else if (direction > -10) {
                                commandStr = "1500" + speed + "m";
                                $("#commandStat").val(jData.rota + '自動操縦　直進' + direction.toFixed(0));
                            } else {
                                commandStr = "1400" + speed + "m";
                                $("#commandStat").val(jData.rota + '自動操縦 左　旋回' + direction.toFixed(0));
                            }
                        }
                    }
                }
            }
        } else if (lastBtR !== btr) {
            setBtTextArea(btr);
            lastBtR = btr;
        }
    }
    //Videoの向きを判断して回転 
    //2016.11.15 Android縦専用にした。
    //縦長になった。
//    if (vRotate === 0 && video.get(0).videoHeight > video.get(0).videoWidth ){
//        video.css("-webkit-transform", "rotate(270deg)");
//        vRotate = 270;
//    }
//    //横長になった
//    if (vRotate === 270 && video.get(0).videoHeight < video.get(0).videoWidth ){
//        video.css("-webkit-transform", "rotate(0deg)");
//        vRotate = 0;
//    }
}

function setMsgTextArea(str) {
    $("#messages").val(str + "\n" + $("#messages").val());
    $("#messages").scrollTop();
}

function setBtTextArea(str) {
    $("#btMessages").val(str + "\n" + $("#btMessages").val());
    $("#btMessages").scrollTop();
}
//青アイコン位置決定
function checkedInfoWin() {
    checkInfoWin.close();
    sDragend = false;
    rPos = sPos;
    lastrPos = rPos;
    rPathDraw(rPos);
}
var rMarkerArray = [];
function rPathDraw(pos) {
    var rPath = rPoly.getPath();
    //GoogleMAP上の高度
    //gElevation(rPos);
    rPath.push(pos);
    var rMarker = new google.maps.Marker({
        position: pos,
        icon: {path: 'M -2,2 0,-2 2,2 0,0 z',
            scale: 3,
            strokeColor: '#00FF00',
            rotation: jData.rota
        },
        map: map,
        zIndex: 1// 重なりの優先値(z-index)
    });
    rMarkerArray.push(rMarker);
    // infowindow内のコンテンツ(html)を作成 http://kwski.net/api/799/
    var time = new Date(jData.time); //time.toLocaleString()
    var infoWinMsg = '<div class="infowindow' + jData.no + '">'
            + 'No.' + jData.no
            // '<img src="' + imgfile + '" width="100">'
            + ', ' + time.toLocaleString() + '<br />'
            + ',GPS高度:' + jData.alti + 'm'
            + ',方向:' + jData.rota + '°' + ',pitch ' + jData.pitch + '°'
            + ',roll:' + jData.roll + '°'
            + '<br>btr:' + jData.btr + '</div>';
    //関数で呼ばないとInfowindowが重なる
    attachMessage(rMarker, infoWinMsg);
    rPoly.setMap(null);
    rPoly.setMap(map);
    //位置設定アイコンを移動。
    if (!sDragend) {
        sMarker.setPosition(pos);
    }
}

//ローバーアイコンのWindow
var lastInfoWin = null;

//ローバー(ドロイドローン)アイコン表示
function attachMessage(marker, msg) {
    //http://www.nanchatte.com/map/showDifferentInfoWindowOnEachMarker.html
    var infoWin = new google.maps.InfoWindow({
        maxWidth: 300, // infowindowの最大幅を設定
        content: msg
    });
    // イベントを取得するListenerを追加
    google.maps.event.addListener(marker, 'click', function () {
        //次のウィンドウが表示されるまでウィンドウを表示
        if (lastInfoWin !== null) {
            lastInfoWin.close();
        }
        lastInfoWin = infoWin;
        //ウィンドウオープンopen(map:Map|StreetViewPanorama, anchor?:MVCObject)
        infoWin.open(marker.getMap(), marker);
    });
    // mouseoutイベントを取得するListenerを追加
    //google.maps.event.addListener(marker, 'mouseout', function(){
    google.maps.event.addListener(infoWin, 'closeclick', function () {
        infoWin.close();
    });
}

//現在地の地図の高度を表示
function gElevation(pos) {
// Add a listener for the click event
//google.maps.event.addListener(map, 'click', addLatLng);
//GoogleMap高度を調査。GPS高度と比べて見る
//https://developers.google.com/maps/documentation/javascript/examples/elevation-simple
//http://www.nanchatte.com/map/getElevationForLocation.html
//GPS/地図の高度データが信用ならない理由 http://www.sc-runner.com/2013/07/why-gps-altitude-not-accurate.html
//What vertical datum is used in Google Earth https://productforums.google.com/forum/#!topic/maps/FZkvHCNri0M　(海水面高度か？）
// ElevationServiceのコンストラクタ
    var elevation = new google.maps.ElevationService();
    // リクエストを発行  locations: 要素が１つでも配列に…。
    elevation.getElevationForLocations({locations: [pos]}, function (results, status) {
        if (status === google.maps.ElevationStatus.OK) {
            if (results[0].elevation) {
                // 標高ゲット！
                var gElev = results[0].elevation;
                setBtTextArea('GoogleMAPの高度:' + Math.round(gElev) + 'm');
            }
        } else if (status === google.maps.ElevationStatus.INVALID_REQUEST) {
            alert("リクエストに問題アリ！requestで渡している内容を確認せよ！！");
        } else if (status === google.maps.ElevationStatus.OVER_QUERY_LIMIT) {
            alert("短時間にクエリを送りすぎ！落ち着いて！！");
        } else if (status === google.maps.ElevationStatus.REQUEST_DENIED) {
            alert("このページでは ElevationResult の利用が許可されていない！・・・なぜ！？");
        } else if (status === google.maps.ElevationStatus.UNKNOWN_ERROR) {
            alert("原因不明のなんらかのトラブルが発生した模様。");
        } else {
            alert("えぇ～っと・・、バージョンアップ？");
        }
    });
}