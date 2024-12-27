import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.purple[400],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "نغماتي",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: MusicApp(),
    ),
  ));
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  Widget musicItem() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1.0),
        child: TextButton(
          onPressed: () {
            final player = AudioPlayer();
            player.play(AssetSource('music-3.mp3'));
          },
          child: ListTile(
            leading: Icon(Icons.music_note),
            title: Text("Samsung Galaxy"),
          ),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            backgroundColor: Colors.white, // Button background color
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        musicItem(),
        musicItem(),
        musicItem(),
        musicItem(),
        musicItem(),
        musicItem(),
        musicItem()
      ],
    );
  }
}
