import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:test/player/player.dart';
import 'dart:io';
import './models/songmodel.dart';

class Songs extends StatefulWidget {
  const Songs({super.key});

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  Future<void> loadSongs() async {
    Directory appDocDir = Directory('D:/songs');
    // String appDocPath = appDocDir.path;
    await for (var entity
        in appDocDir.list(recursive: true, followLinks: false)) {
        if(entity.path.endsWith('.mp3')){
          Provider.of<SongModel>(context, listen: false).addSong(entity.path,
             entity.path.split('\\')[1]);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        actions: [
          TextButton(
            onPressed: (() => Navigator.pushReplacementNamed(context, '/')),
            child: const Icon(Icons.home),
          )
        ],
      ),
      body: Consumer<SongModel>(
        builder: (context, songs, child) => ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: songs.getLength(),
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 2,
          ),
          itemBuilder: (BuildContext innercontext, int index) {
            return GestureDetector(
              onTap: () {
                 Provider.of<SongModel>(context, listen: false).selectSong(index);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Player()));
                },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  height: 50,
                  color: Colors.blue[50],
                  child: Padding(child: Text('${songs.getDisplayName(index)}'), padding: EdgeInsets.all(3),),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
