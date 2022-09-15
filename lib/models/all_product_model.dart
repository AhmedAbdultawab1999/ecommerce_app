class ProductsModel{
  late int id;
  late String title;
  late dynamic price;
  late String description;
  late String image;
  late Rating rating;
  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating
    });

  factory ProductsModel.fromJson(Map<String,dynamic> jasonData){
    return ProductsModel(
      id: jasonData['id'],
      title: jasonData['title'],
      price: jasonData['price'],
      description: jasonData['description'],
      image: jasonData['image'],
      rating: Rating.fromJson(jasonData['rating'])
      );
      
  }
}
class Rating{
  late num rate;
  late num count;
  Rating({required this.rate,required this.count});
  factory Rating.fromJson(jasonData){
    return Rating(
      rate: jasonData['rate'],
      count: jasonData['count']
      );
  }
}