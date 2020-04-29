class ProductModel {
  String title;


  String thumbnailUrl;
  String longDescription;
String  isbn;
  int price;



  ProductModel(
      {this.title,

this.price,
        this.isbn,

        this.thumbnailUrl,
        this.longDescription,


        });

  ProductModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];


    thumbnailUrl = json['thumbnailUrl'];
    longDescription = json['longDescription'];


    price = json['price'];
    isbn=json['isbn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;

    data['price'] = this.price;
    data['isbn'] = this.isbn;

    data['thumbnailUrl'] = this.thumbnailUrl;
    data['longDescription'] = this.longDescription;



    return data;
  }
}

class PublishedDate {
  String date;

  PublishedDate({this.date});

  PublishedDate.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}
