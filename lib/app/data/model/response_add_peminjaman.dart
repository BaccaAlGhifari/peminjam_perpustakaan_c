/// status : 201
/// message : "success"
/// data : {"user_id":2,"book_id":1,"tanggal_pinjam":"2024-01-01","tanggal_kembali":"2024-01-10","status":"DIPINJAM","updated_at":"2024-01-09T06:09:06.000000Z","created_at":"2024-01-09T06:09:06.000000Z","id":1}

class ResponseAddPeminjaman {
  ResponseAddPeminjaman({
      this.status, 
      this.message, 
      this.data,});

  ResponseAddPeminjaman.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// user_id : 2
/// book_id : 1
/// tanggal_pinjam : "2024-01-01"
/// tanggal_kembali : "2024-01-10"
/// status : "DIPINJAM"
/// updated_at : "2024-01-09T06:09:06.000000Z"
/// created_at : "2024-01-09T06:09:06.000000Z"
/// id : 1

class Data {
  Data({
      this.userId, 
      this.bookId, 
      this.tanggalPinjam, 
      this.tanggalKembali, 
      this.status, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  Data.fromJson(dynamic json) {
    userId = json['user_id'];
    bookId = json['book_id'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  int? userId;
  int? bookId;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['book_id'] = bookId;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['status'] = status;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}