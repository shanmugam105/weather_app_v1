class UserList {
  UserList({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<UserDetails> data;
  final UserSupport? support;

  factory UserList.fromJson(Map<String, dynamic> json) {
    return UserList(
      page: json["page"],
      perPage: json["per_page"],
      total: json["total"],
      totalPages: json["total_pages"],
      data: json["data"] == null
          ? []
          : List<UserDetails>.from(
              json["data"]!.map((x) => UserDetails.fromJson(x))),
      support: json["support"] == null
          ? null
          : UserSupport.fromJson(json["support"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": data.map((x) => x.toJson()).toList(),
        "support": support?.toJson(),
      };
}

class UserDetails {
  UserDetails({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class UserSupport {
  UserSupport({
    required this.url,
    required this.text,
  });

  final String? url;
  final String? text;

  factory UserSupport.fromJson(Map<String, dynamic> json) {
    return UserSupport(
      url: json["url"],
      text: json["text"],
    );
  }

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
