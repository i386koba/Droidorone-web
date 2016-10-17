/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    // Gemapad API に対応しているか調べる
    //http://hakuhin.jp/js/gamepad.html#GAMEPAD_GAMEPAD_MAPPING
    if (!(window.Gamepad)) {
        $("#commandStat").val('NO GamePad-API.');
    } else if (!(navigator.getGamepads)) {
        $("#commandStat").val('NO GamePad.');
        console.log('NO GamePad. nofunc');
    } else if (window.GamepadEvent) {
        // ------------------------------------------------------------
        // ゲームパッドを接続すると実行されるイベント
        // ------------------------------------------------------------
        window.addEventListener("gamepadconnected", function (e) {
            console.log("ゲームパッドが接続された");
            console.log(e.gamepad);
            // ゲームパッドリストを取得する
            var gamepad_list = navigator.getGamepads();
            if (gamepad_list.length === 0) {
                $("#commandStat").val('NO GamePad.');
                console.log('NO GamePad.' + gamepad_list.length);
                return;
            }
            var gStr;
            for (i = 0; i < gamepad_list.length; i++) {
                // Gamepad オブジェクトを取得する
                if (!gamepad_list[i]) {
                    continue;
                }
                var gamepad = gamepad_list[i];
                // ゲームパッドの識別名
                var gStr = "id: " + gamepad.id + "\n";
                // ゲームパッドの物理的な接続状態
                gStr += "connected: " + gamepad.connected + "\n";
                // マッピングタイプ情報
                gStr += "mapping: " + gamepad.mapping + "\n";
                gamepadNo = i;
            }
            $("#commandStat").val(gStr + "gamepadNo : " + gamepadNo);
            console.log(gStr);
        });

        // ------------------------------------------------------------
        // ゲームパッドの接続を解除すると実行されるイベント
        // ------------------------------------------------------------
        window.addEventListener("gamepaddisconnected", function (e) {
            console.log("ゲームパッドの接続が解除された");
            console.log(e.gamepad);
            $("#commandStat").val("ゲームパッドの接続が解除されました。");
        });
    }
var speed = 0; //前回と比較するためグローバル変数
var direction = 0;
function gamePadListen() {
    var gamepad_list = navigator.getGamepads();
    var gamepad = gamepad_list[gamepadNo];
// 軸リスト axes
    var axes = gamepad.axes;
    //http://www.w3.org/TR/gamepad/#remapping
    //左　上下　axes[1] 
    //右　左右　axes[2]
    //右　上下　axes[3]
    //console.log('gamepad' + gamepadNo + 'axes0' + axes[0]);
    if (Math.abs(speed - axes[1]) > 0.1 || Math.abs(direction - axes[3]) > 0.1) {
        speed = axes[1];
        direction = axes[3];
        var left = -1 * Math.round(speed * 100);
        var right = -1 * Math.round(direction * 100);
        if (Math.abs(left) < 20) {
            left = 0;
        }
        if (Math.abs(right) < 20) {
            right = 0;
        }
        command('M(' + left + ',' + right + ')', "GamePad");
    }

    /*   // ボタンリスト
     var str;
     var buttons = gamepad.buttons; 		 str += "buttons: {\n";
     var j;
     var n = buttons.length;
     for (j = 0; j < n; j++) {
     // GamepadButton オブジェクトを取得
     var button = buttons[j];
     str += "  \"" + j + "\": { ";
     // ボタン押下状態
     str += "pressed:" + button.pressed + " , ";
     // ボタン入力強度
     str += "value:" + button.value + " }\n";
     } */
}


