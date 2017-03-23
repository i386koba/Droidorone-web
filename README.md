# Droidorone-web

https://i386koba.github.io/Droidorone-web/

で画面を開けます。

航路の記録は

https://i386koba.github.io/Droidorone-web/mapLink.html

から参照できます。

# CellularRC (セルラーRC（アールシー））
Droidoroneと命名しましたが、ドローンというとマルチコプターがイメージされてしまい、あまり実態を示していないかな？

と思いまして、名前を替えようと思っております。

## 概要
RC（ラジコン）の電波として携帯電話網（セルラー）を用いる事で操作範囲を広げみました。
操縦者はWeb操縦画面よりRCに載せたスマフォのカメラ、マイク、GPS位置などを確認して、
マウスかゲームパッドで操作します。

## 必要な機器
RCとスマフォ、BTモジュールを載せた、Arduinoベースのマイコン基板、ネットに繋がったWebブラウザが必要です。
スマフォのBluetooth（BT)でBTモジュールを載せた、Arduinoベースのマイコン基板とBT通信して、
RCのサーボ、ESC（モーターコントローラ）を スマフォからコントロールします。
一方、スマフォはセルラーを通じ、WebRTCのSkyWay（PeerJS)を用いて
Web操縦画面にカメラ画像、音声を送信しつつ、Web操縦画面上で操作された操作コマンドを受け取り、
BTを介してRCを駆動します。

## Android端末とPeerIDの交換

Androidのアプリ
https://github.com/i386koba/Droidrone
　は、自身のGoogleIDでログインし、GoogleDriveにデータコネクション待ちのPeerIDをファイル保存します。

Web画面は［Authorize GoogleID］ボタンで、Androidと同じGoogleIDでログインし、
AndroidによってGoogleDriveに保存されたPeerIDを読みに行って、
そのPeerIDでAndroiｄのPeerデータコネクションに接続しにいきます。

接続したPeerデータコネクションより、AndroidでWeb画面のPeerIDを取得し、
Web画面のPeerメディアコネクションをAndroidからコールします。

今後の予定として:　操縦をリアルタイムで共有したい。

https://github.com/nttcom/SkyWay-MultiParty-Android

SkyWay( http://nttcom.github.io/skyway/ )を用い、多人数参加のグループビデオチャットを簡単に開発できるAndroid向けのライブラリです。
