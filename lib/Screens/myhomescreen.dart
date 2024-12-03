import 'package:get/get.dart';
import 'package:tiktok/Modal/kids_modal.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class VideoController extends GetxController {
  var kidsModal = KidsModal().obs; // Observing KidsModal object
  var isLoading = true.obs;
  var isVideoInitialized =
      false.obs; // Observable for video initialization state
  late VideoPlayerController videoPlayerController;

  @override
  void onInit() {
    super.onInit();
    fetchVideos(); // Fetch videos when the controller is initialized
  }

  // Fetch videos from the API
  Future<void> fetchVideos() async {
    try {
      final response =
          await http.get(Uri.parse('http://kids.three60.app/api/videos'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        kidsModal.value = KidsModal.fromJson(jsonData);
        if (kidsModal.value.data != null && kidsModal.value.data!.isNotEmpty) {
          // Initialize the first video when data is available
          initializeVideoPlayer(kidsModal.value.data![0].video!);
        }
      } else {
        print('Failed to load videos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching videos: $e');
    } finally {
      isLoading.value = false; // Mark loading as false after fetch completes
    }
  }

  // Initialize the video player with the provided video URL
  void initializeVideoPlayer(String videoUrl) {
    videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        videoPlayerController.play(); // Automatically play the video
        isVideoInitialized.value = true; // Update the initialization state
        update(); // Update the UI
      });
  }

  // Play the selected video when changing pages
  void playVideo(String videoUrl) {
    if (videoPlayerController.value.isInitialized) {
      videoPlayerController.pause(); // Pause the current video
    }
    videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        videoPlayerController.play(); // Play the new video
        isVideoInitialized.value = true; // Set initialization to true
        update(); // Trigger UI update
      });
  }

  @override
  void onClose() {
    videoPlayerController
        .dispose(); // Dispose of the video player when controller is closed
    super.onClose();
  }
}
