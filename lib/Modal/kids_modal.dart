class KidsModal {
  List<Data>? data;

  KidsModal({this.data});

  KidsModal.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  Null? title;
  String? description;
  int? totalViews;
  String? user;
  String? video;

  Data(
      {this.id,
      this.title,
      this.description,
      this.totalViews,
      this.user,
      this.video});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    totalViews = json['total_views'];
    user = json['user'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['total_views'] = this.totalViews;
    data['user'] = this.user;
    data['video'] = this.video;
    return data;
  }
}
