import 'package:flutter/material.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;

  DiscoverProvider({required this.videoPostRepository});

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    final newVideos = await videoPostRepository.getTrendingVideoByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
