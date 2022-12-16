import 'package:flutter/foundation.dart';

class SongModel extends ChangeNotifier{
  List<String> _path = [];
  List<String> _displayName = [];
  int? _selectedIndex = null;

  selectSong(int index){
    _selectedIndex = index;
    notifyListeners();
  }

  getSelectedIndex(){
    return _selectedIndex;
  }

  addSong(String path, String displayName){
    _path.add(path);
    _displayName.add(displayName);
    notifyListeners();
  }

  clearList(){
    _path = [];
    _displayName = [];
    notifyListeners();
  }

  getLength(){
    return _path.length;
  }

  getDisplayName(int index){
    if(_displayName.length -1 >=index){
      return _displayName[index];
    }
    return null;
  }

  getpath(int index){
    if(_path.length -1 >=index){
      return _path[index];
    }
    return null;
  }
  
}