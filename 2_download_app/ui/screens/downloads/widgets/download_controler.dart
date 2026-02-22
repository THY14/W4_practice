import 'package:flutter/material.dart';

class Ressource {
  final String name;
  final int size;   // in MB

  Ressource({required this.name, required this.size}); 
}

enum DownloadStatus { notDownloaded, downloading, downloaded }

class DownloadController extends ChangeNotifier {
  
  DownloadController(this.ressource);

  // DATA
  Ressource ressource;
  DownloadStatus _status = DownloadStatus.notDownloaded;
  double _progress = 0.0;         // 0.0 → 1.0

  // GETTERS
  DownloadStatus get status => _status;
  double get progress => _progress;

  // ACTIONS
  void startDownload() async {
    // 1. Set status to downloading
    _status = DownloadStatus.downloading;
    notifyListeners();

    // 2. Loop 10 times and increment the download progress
    for (int i = 1; i <= 10; i++) {
      // Wait 1 second
      await Future.delayed(const Duration(milliseconds: 1000));
      
      _progress = i / 10.0; 
      notifyListeners();
    }

    // 3. Set status to downloaded
    _status = DownloadStatus.downloaded;
    notifyListeners();
  }
}


