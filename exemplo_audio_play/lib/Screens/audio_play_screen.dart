import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../Model/audio_model.dart';

class AudioPlayerScreen extends StatefulWidget {
  final AudioModel audio;
  const AudioPlayerScreen({super.key, required this.audio});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    // Opcional: Carregar a fonte ao iniciar
    // _audioPlayer.setSource(UrlSource(widget.audio.url));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(widget.audio.url));
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.audio.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 64.0,
              onPressed: _playPause,
            ),
            Text(
              _isPlaying ? 'Reproduzindo' : 'Pausado',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
