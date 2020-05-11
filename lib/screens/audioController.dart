import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';

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

  void audioStop() => player.stop();

  void mute() => player.setVolume(0.0);


}
