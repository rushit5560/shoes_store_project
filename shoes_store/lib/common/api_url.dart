class ApiUrl {
  static const ApiMainPath = 'http://shoes.omdemo.co.in/';

  static const LoginApi = ApiMainPath + "api/login";
  static const RegisterApi = ApiMainPath + 'api/register';
  static const BannerApi = ApiMainPath + 'api/banner';
  static const ProductApi = ApiMainPath + 'api/product';
  static const CategoryApi = ApiMainPath + 'api/category';
  static const CategoryCollectionApi = ApiMainPath + 'api/categoryproduct';
  static const ProductDetailApi = ApiMainPath + 'api/productdetails';
  static const AddToCartApi = ApiMainPath + 'api/addtocart';
  static const UserCartApi = ApiMainPath + 'api/usercart';
  static const AddCartQtyApi = ApiMainPath + 'api/addcartqty';
  static const DeleteCartProductApi = ApiMainPath + 'api/deletecart';
  static const FeaturedProductApi = ApiMainPath + 'api/productfeatured';

  static const ProductReviewApi = ApiMainPath + 'api/reviewget';
  static const AddProductReviewApi = ApiMainPath + 'api/reviewadd';
  static const UpdateUserProfileApi = ApiMainPath + 'api/userprofile';
  static const ContactUsApi = ApiMainPath + 'api/contactus';
  static const ChangePasswordApi = ApiMainPath + 'api/changepassword';

  static const CountryApi = ApiMainPath + 'api/country';
  static const StateApi = ApiMainPath + 'api/states';
  static const CityApi = ApiMainPath + 'api/city';

  static const BlogsApi = ApiMainPath + 'api/blog';
  static const BlogDetailApi = ApiMainPath + 'api/blogdetails';
  static const AddProductWishlistApi = ApiMainPath + 'api/addwishlist';
  static const UserWishListApi = ApiMainPath + 'api/userwishlist';
  static const DeleteWishListApi = ApiMainPath + 'api/deletewishlist';
  static const TestimonialApi = ApiMainPath + 'api/testimonials';
  static const AddOrderApi = ApiMainPath + 'api/orderadd';
  static const AddUserBillingAddressApi = ApiMainPath + 'api/usersbilling';
  static const AddUserShippingAddressApi = ApiMainPath + 'api/usersshipping';
  static const UserAllAddressApi = ApiMainPath + 'api/usersaddress';
  static const UserTotalOrderApi = ApiMainPath + 'api/usertotalorder';
  static const OrderDetailsApi = ApiMainPath + 'api/orderdetails';
  static const GetProfileApi = ApiMainPath + "api/profile/";
  static const GetBrandBannerApi = ApiMainPath + "api/brandbanner/";

  static const GetRelatedProductsApi = ApiMainPath + "api/related/";
  static const ForgotPasswordApi = ApiMainPath + "api/forgetpassword";

  static const SearchProductsApi = ApiMainPath + "api/searchproduct";

  /// Add, Get Blog comment API
  static const AddBlogCommentApi = ApiMainPath + "api/addblogcomment";
  static const GetBlogCommentApi = ApiMainPath + "api/getcomment/";

  static const InvoicePdfPrefix = "${ApiMainPath}public/";
  static const InvoicePdfSuffix = ".pdf";
}
