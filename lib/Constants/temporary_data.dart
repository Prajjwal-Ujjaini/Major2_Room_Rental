import 'package:major2_room_rental/Constants/image_url.dart';
import 'package:major2_room_rental/models/category_model.dart';

List<CategoryModel> getCategories() {
  // ignore: deprecated_member_use
  List<CategoryModel> categoryList = new List<CategoryModel>();
  CategoryModel categoryModel;

  //1
  categoryModel = new CategoryModel();
  categoryModel.categoryName = citiesName[0];
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  categoryList.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = citiesName[1];
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryList.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = citiesName[2];
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  categoryList.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = citiesName[3];
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  categoryList.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = citiesName[4];
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  categoryList.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = citiesName[5];
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  categoryList.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = citiesName[6];
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryList.add(categoryModel);

  return categoryList;
}
