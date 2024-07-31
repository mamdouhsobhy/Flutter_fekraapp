import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       backgroundColor: Colors.indigo,
//       appBar: AppBar(
//         title: const Text(
//           "نغمات",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.indigo[800],
//       ),
//       body: SafeArea(child: MusicApp()),
//     ),
//   ));
// }

class MusicApp extends StatelessWidget {

  Expanded eleButton(String title, int audioNumber){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1.0),
        child: ElevatedButton(
          onPressed: () {
            final player = AudioPlayer();
            player.play(AssetSource('music-$audioNumber.mp3'));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
          ),
          child: Row(
            children: [
              Icon(Icons.music_note,color: Colors.red,),
              SizedBox(width: 10,),
              Text(
                title,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        eleButton("samsung Galaxy", 3),
        eleButton("samsung Note", 4),
        eleButton("Nokia", 5),
        eleButton("iphone 11", 6),
        eleButton("Whats App", 7),
      ],
    );
  }
}
