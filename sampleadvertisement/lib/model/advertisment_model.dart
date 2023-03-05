class Advertisement_Model {
  String? id;
  String? title;
  String? reference;
  String? imageUrl;
  String? urlLink;
  String? rent;

  Advertisement_Model(
      {this.id,
      this.title,
      this.reference,
      this.imageUrl,
      this.urlLink,
      this.rent});

  Advertisement_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    reference = json['refrence'];
    imageUrl = json['pictureLink'];
    urlLink = json['urlLink'];
    rent = json['rent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['reference'] = this.reference;
    data['pictureLink'] = this.imageUrl;
    data['urlLink'] = this.urlLink;
    data['rent'] = this.rent;
    return data;
  }
}
