import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../Model/audio_model.dart';

class AudioPlayerScreen extends StatefulWidget {
  final List<AudioModel> audioList;
  final int initialIndex;
  const AudioPlayerScreen({super.key, required this.audioList, required this.initialIndex});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  late int _currentIndex;

  AudioModel get _currentAudio => widget.audioList[_currentIndex];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _currentIndex = widget.initialIndex;
    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });
    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });
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
      await _audioPlayer.play(UrlSource(_currentAudio.url));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _stop() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
      _position = Duration.zero;
    });
  }

  void _replay() async {
    await _audioPlayer.seek(Duration.zero);
    await _audioPlayer.play(UrlSource(_currentAudio.url));
    setState(() {
      _isPlaying = true;
    });
  }

  void _next() {
    if (_currentIndex < widget.audioList.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _playNewAudio();
    }
  }

  void _previous() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _playNewAudio();
    }
  }

  void _playNewAudio() async {
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(_currentAudio.url));
    setState(() {
      _isPlaying = true;
      _position = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentAudio.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill),
              iconSize: 64.0,
              onPressed: _playPause,
            ),
            IconButton(
              icon: Icon(Icons.stop_circle),
              iconSize: 64.0,
              onPressed: _stop,
            ),
            IconButton(
              icon: Icon(Icons.replay_circle_filled),
              iconSize: 64.0,
              onPressed: _replay,
            ),
            Slider(
              min: 0,
              max: _duration.inSeconds.toDouble(),
              value: _position.inSeconds.toDouble(),
              onChanged: (double value) async {
                final position = Duration(seconds: value.toInt());
                await _audioPlayer.seek(position);
                setState(() {
                  _position = position;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatDuration(_position)),
                  Text(_formatDuration(_duration)),
                ],
              ),
            ),
            Text(
              _isPlaying ? 'Playing' : 'Paused',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  iconSize: 48.0,
                  onPressed: _previous,
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  iconSize: 48.0,
                  onPressed: _next,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (hours > 0) twoDigits(hours),
      minutes,
      seconds,
    ].join(':');
  }
}
