import 'package:flutter/material.dart';
import 'package:my_app/2_download_app/ui/screens/downloads/widgets/download_controler.dart';


class DownloadTile extends StatelessWidget {
  final DownloadController controller;

  const DownloadTile({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        Widget trailingIcon;
        Widget? subtitle;
        double downloadedSize = controller.progress * controller.ressource.size;
        switch (controller.status) {
          case DownloadStatus.notDownloaded:
            trailingIcon = IconButton(
              icon: const Icon(Icons.download),
              onPressed: () => controller.startDownload(),
            );
            subtitle = null;
            break;
          case DownloadStatus.downloading:
            trailingIcon = const Icon(Icons.downloading);
            subtitle = Text(
                '${(controller.progress * 100).toStringAsFixed(1)} % completed - '
                '${downloadedSize.toStringAsFixed(1)} of ${controller.ressource.size} MB');
            break;
            
          case DownloadStatus.downloaded:
            trailingIcon = const Icon(Icons.folder);
            subtitle = Text(
                '100.0 % completed - '
                '${controller.ressource.size.toStringAsFixed(1)} of ${controller.ressource.size} MB');
            break;
        }

        return Card(
          child: ListTile(
            title: Text(controller.ressource.name),
            subtitle: subtitle,
            trailing: trailingIcon,
          ),
        );
      },
    );
  }
}