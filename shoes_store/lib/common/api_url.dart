class ApiUrl {
  static const ApiMainPath = 'http://192.168.29.95:5000/';

  static const BannerApi = ApiMainPath + "Admin/Banner/getAll";
  static const FeaturedProductApi = ApiMainPath + 'Admin/Products/getall';
  static const TestimonialApi = ApiMainPath + 'Admin/Testimonial/getall';
  static const CategoryApi = ApiMainPath + 'Admin/Category/getall';



  static const LoginApi = ApiMainPath + "api/login";
  static const RegisterApi = ApiMainPath + 'api/register';
  // static const BannerApi = ApiMainPath + 'api/banner';
  static const ProductApi = ApiMainPath + 'api/product';
  // static const CategoryApi = ApiMainPath + 'api/category';
  static const CategoryCollectionApi = ApiMainPath + 'api/categoryproduct';
  static const ProductDetailApi = ApiMainPath + 'api/productdetails';
  static const AddToCartApi = ApiMainPath + 'api/addtocart';
  static const UserCartApi = ApiMainPath + 'api/usercart';
  static const AddCartQtyApi = ApiMainPath + 'api/addcartqty';
  static const DeleteCartProductApi = ApiMainPath + 'api/deletecart';
  // static const FeaturedProductApi = ApiMainPath + 'api/productfeatured';

  static const ProductReviewApi = ApiMainPath + 'api/reviewget';
  static const AddProductReviewApi = ApiMainPath + 'api/reviewadd';
  static const UpdateUserProfileApi = ApiMainPath + 'api/userprofile';
  static const ContactUsApi = ApiMainPath + 'api/contactus';
  static const ChangePasswordApi = ApiMainPath + 'api/changepassword';

  static const CountryApi = ApiMainPath + 'api/country';
  static const StateApi = ApiMainPath + 'api/states';
  static const CityApi = ApiMainPath + 'api/city';
}