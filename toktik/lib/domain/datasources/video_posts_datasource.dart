import '../entities/video_post.dart';

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getTrendingVideoByPage(int page);
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
}