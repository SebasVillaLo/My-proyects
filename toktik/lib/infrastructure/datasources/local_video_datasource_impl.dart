import 'package:toktik/domain/entities/video_post.dart';

import '../../domain/datasources/video_posts_datasource.dart';
import '../../shared/data/local_video_post.dart';
import '../models/local_video_model.dart';

class LocaVideoDataSource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideoByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
        return newVideos;
  }
}
