class ResponseModel<T> {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final T data;
  final Map? support;

  ResponseModel({
    required this.data,
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.support,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      data: json['data'],
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      support: json['support'],
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data,
        'page': page,
        'per_page': perPage,
        'total': total,
        'total_pages': totalPages,
        'support': support,
      };
}
