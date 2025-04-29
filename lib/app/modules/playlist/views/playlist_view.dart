import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';
import '../controllers/playlist_controller.dart';

class PlaylistView extends GetView<PlaylistController> {
  const PlaylistView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlaylistController>(
      init: PlaylistController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('PlaylistView'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: neutralSurface,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: controller.textField,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: controller.submitPlaylist,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: controller.databaseService.getPlaylists(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data?[index].name ?? ''),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
