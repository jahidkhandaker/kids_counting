import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class audioController {
  List mp3dir = List(11);

  AudioPlayer player = AudioPlayer();

  audioController() {
    _loadSound(1);
    _loadSound(2);
    _loadSound(3);
    _loadSound(4);
    _loadSound(5);
    _loadSound(6);
    _loadSound(7);
    _loadSound(8);
    _loadSound(9);
    _loadSound(10);
  }

  void _loadSound(var n) async {
    final ByteData data = await rootBundle.load('assets/audio/$n.mp3');
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/$n.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3dir[n] = tempFile.uri.toString();
  }

  void audioPlay(var i) => player.play(mp3dir[i]);

//  allPlay(var i) {
//    player.play(mp3dir[i]);
//    player.onPlayerCompletion.listen((event) {
//      if (i < 10) {
//        player.play(mp3dir[++i]);
//        return i;
//      } else
//        player.stop();
//    });
//  }

//
//  AudioCache player = AudioCache(prefix: 'audio/');
//
//  AudioPlayer audioPlayer = AudioPlayer();
//
//  audioController(){
//    player.loadAll(['1.mp3', '2.mp3', '3.mp3', '4.mp3', '5.mp3', '6.mp3', '7.mp3', '8.mp3', '9.mp3', '10.mp3']);
//
//  }
//
//  void audioPlay(var i) => player.play('$i.mp3');
//

}
