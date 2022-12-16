import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/models/songmodel.dart';

typedef void OnError(Exception exception);

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => new _PlayerState();
}

class _PlayerState extends State<Player> {
  Duration _duration = Duration();
  Duration _position = Duration();
  AudioPlayer? advancedPlayer;
  AudioCache? audioCache;
  String _localFilePath = '';

  @override
  void initState() {
    super.initState();
    int? ind = Provider.of<SongModel>(context,listen: false).getSelectedIndex();
    if(ind==null){
      
       Navigator.pop(context);
    }
    _localFilePath = Provider.of<SongModel>(context,listen: false).getpath(
    Provider.of<SongModel>(context,listen: false).getSelectedIndex());
    print(_localFilePath);
    _localFilePath = _localFilePath.replaceAll('\\','/');
    initPlayer();
  }

  @override
  void dispose(){
    super.dispose();
    advancedPlayer?.release();
  }

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache();

    advancedPlayer?.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;  
      });
    });

    advancedPlayer?.onPositionChanged.listen((p) {
      setState(() {
        _position = p;  
      });
    });

    advancedPlayer?.play(DeviceFileSource(_localFilePath));
  }

  

  Widget _tab(List<Widget> children) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: children
              .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
              .toList(),
        ),
      ),
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
        minWidth: 48.0,
        child: ElevatedButton(child: Text(txt), onPressed: onPressed));
  }

  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          // setState(() {
            seekToSecond(value.toInt());
          // });
        });
  }

  Widget localAsset() {
    return _tab([
      Text('Play Local Asset \'audio.mp3\':'),
      _btn('Play',
          () => advancedPlayer?.play(DeviceFileSource(_localFilePath))),
      _btn('Pause', () => advancedPlayer?.pause()),
      _btn('Stop', () => advancedPlayer?.stop()),
      slider()
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer?.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Local Asset'),
            ],
          ),
          title: Text('audioplayers Example'),
        ),
        body: TabBarView(
          children: [localAsset()],
        ),
      ),
    );
  }
}
