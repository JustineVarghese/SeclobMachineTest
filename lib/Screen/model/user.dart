class ApiCall {
  String? sts;
  String? msg;
  int? postCount;
  List<Media>? media;

  ApiCall({this.sts, this.msg, this.postCount, this.media});

  ApiCall.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    postCount = json['postCount'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    data['postCount'] = this.postCount;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  String? sId;
  String? userId;
  String? fileType;
  String? fileName;
  String? filePath;
  String? description;
  List<String>? likedBy;
  int? likeCount;
  List<String>? commentId;
  int? commentCount;
  bool? story;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? firstName;
  String? lastName;
  String? profilePic;

  Media(
      {this.sId,
      this.userId,
      this.fileType,
      this.fileName,
      this.filePath,
      this.description,
      this.likedBy,
      this.likeCount,
      this.commentId,
      this.commentCount,
      this.story,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.firstName,
      this.lastName,
      this.profilePic});

  Media.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    fileType = json['fileType'];
    fileName = json['fileName'];
    filePath = json['filePath'];
    description = json['description'];
    likedBy = json['likedBy'].cast<String>();
    likeCount = json['likeCount'];
    commentId = json['commentId'].cast<String>();
    commentCount = json['commentCount'];
    story = json['story'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['fileType'] = this.fileType;
    data['fileName'] = this.fileName;
    data['filePath'] = this.filePath;
    data['description'] = this.description;
    data['likedBy'] = this.likedBy;
    data['likeCount'] = this.likeCount;
    data['commentId'] = this.commentId;
    data['commentCount'] = this.commentCount;
    data['story'] = this.story;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profilePic'] = this.profilePic;
    return data;
  }
}
