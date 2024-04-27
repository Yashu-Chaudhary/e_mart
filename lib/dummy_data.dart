// import 'package:e_mart/features/personalization/models/user_model.dart';
// import 'package:e_mart/features/shop/models/banner_model.dart';
// import 'package:e_mart/features/shop/models/brand_model.dart';
// import 'package:e_mart/features/shop/models/category_model.dart';
// import 'package:e_mart/features/shop/models/product_attribute_model.dart';
// import 'package:e_mart/features/shop/models/product_model.dart';
// import 'package:e_mart/routes/routes.dart';
// import 'package:e_mart/utils/constants/image_strings.dart';

// class PDummyData {
//   // --Banners
//   static final List<BannerModel> banners = [
//     BannerModel(
//         imageUrl: PImages.banner1, targetScreen: PRoutes.order, active: false),
//     BannerModel(
//         imageUrl: PImages.banner2, targetScreen: PRoutes.cart, active: true),
//     BannerModel(
//         imageUrl: PImages.banner3,
//         targetScreen: PRoutes.favourites,
//         active: true),
//     BannerModel(
//         imageUrl: PImages.banner4, targetScreen: PRoutes.search, active: true),
//     BannerModel(
//         imageUrl: PImages.banner5,
//         targetScreen: PRoutes.settings,
//         active: true),
//     BannerModel(
//         imageUrl: PImages.banner6,
//         targetScreen: PRoutes.userAddress,
//         active: true),
//     BannerModel(
//         imageUrl: PImages.banner9,
//         targetScreen: PRoutes.checkout,
//         active: false),
//   ];

//   // --User
//   static final UserModel user = UserModel(
//     firstName: 'Yashu',
//     lastName: 'Chaudhary',
//     email: 'yashusky232@gmail.com',
//     phoneNumber: '+91 7906277120',
//     profilePicture: PImages.user,
//     addresses: [
//       AddressModel(
//         id: '1',
//         name: 'Yashu Chaudhary',
//         phoneNumber: '+91 7906277120',
//         street: 'C-05 Ganesh Puram Tounship',
//         city: 'South Liana',
//         state: 'Maine',
//         psotalCode: '281005',
//         country: 'USA',
//       ),
//       // AddressModel(
//       //   id: '6',
//       // ),
//     ],
//   );

//   // --Cart
//   static final CartModel cart = CartModel();

//   // --Order
//   static final List<OrderModel> orders = [];

//   // -- List of all Categories
//   static final List<CategoryModel> categories = [
//     CategoryModel(
//         id: '1', image: PImages.sportIcon, name: 'Spoets', isFeatured: true),
//     CategoryModel(
//         id: '5',
//         image: PImages.furnitureIcon,
//         name: 'Furniture',
//         isFeatured: true),
//     CategoryModel(
//         id: '2',
//         image: PImages.electronicIcon,
//         name: 'Electronics',
//         isFeatured: true),
//     CategoryModel(
//         id: '3', image: PImages.clothIcon, name: 'Clothes', isFeatured: true),
//     CategoryModel(
//         id: '4', image: PImages.animalIcon, name: 'Animals', isFeatured: true),
//     CategoryModel(
//         id: '6', image: PImages.shoeIcon, name: 'Shoes', isFeatured: true),
//     CategoryModel(
//         id: '7',
//         image: PImages.cosmeticsIcon,
//         name: 'Cosmetics',
//         isFeatured: true),
//     CategoryModel(
//         id: '14',
//         image: PImages.jeweleryIcon,
//         name: 'Jewelery',
//         isFeatured: true),

//     /// subcategories
//     CategoryModel(
//         id: '8',
//         image: PImages.sportIcon,
//         name: 'Sport Shoes',
//         parentId: '1',
//         isFeatured: false),
//     CategoryModel(
//         id: '9',
//         image: PImages.sportIcon,
//         name: 'Track suits',
//         parentId: '1',
//         isFeatured: false),
//     CategoryModel(
//         id: '10',
//         image: PImages.sportIcon,
//         name: 'Sports Equipments',
//         parentId: '1',
//         isFeatured: false),
//     // furniture
//     CategoryModel(
//         id: '11',
//         image: PImages.jeweleryIcon,
//         name: 'Bedroom furniture',
//         parentId: '5',
//         isFeatured: false),
//     CategoryModel(
//         id: '12',
//         image: PImages.jeweleryIcon,
//         name: 'Kitchen furniture',
//         parentId: '5',
//         isFeatured: false),
//     CategoryModel(
//         id: '13',
//         image: PImages.jeweleryIcon,
//         name: 'Office furniture',
//         parentId: '5',
//         isFeatured: false),
//     // electronics
//     CategoryModel(
//         id: '14',
//         image: PImages.electronicIcon,
//         name: 'Laptop',
//         parentId: '2',
//         isFeatured: false),
//     CategoryModel(
//         id: '15',
//         image: PImages.electronicIcon,
//         name: 'Mobile',
//         parentId: '2',
//         isFeatured: false),
//     //
//     CategoryModel(
//         id: '16',
//         image: PImages.clothIcon,
//         name: 'Shirts',
//         parentId: '3',
//         isFeatured: false),
//   ];

//   // -- List of all Brands
//   static final List<BrandModel> brands = [
//     BrandModel(
//         id = '1',
//         image: PImages.nikeLogo,
//         name = 'Nike',
//         productsCount: 265,
//         isFeatured: true,
//     BrandModel(
//         id = '2',
//         image: PImages.adidasLogo,
//         name = 'Adidas',
//         productsCount: 95,
//         isFeatured: true),
//     BrandModel(
//         id = '8',
//         image: PImages.kenwoodLogo,
//         name = 'Kenwood',
//         productsCount: 36,
//         isFeatured: false),
//     BrandModel(
//         id = '9',
//         image: PImages.ikeaLogo,
//         name = 'IKEA',
//         productsCount: 36,
//         isFeatured: false),
//     BrandModel(
//         id = '5',
//         image: PImages.appleLogo,
//         name = 'Apple',
//         productsCount: 16,
//         isFeatured: true),
//     BrandModel(
//         id = '10',
//         image: PImages.acerLogo,
//         name = 'Acer',
//         productsCount: 36,
//         isFeatured: false),
//     BrandModel(
//         id = '3',
//         image: PImages.jardanLogo,
//         name = 'Jordan',
//         productsCount: 36,
//         isFeatured: true),
//     BrandModel(
//         id = '4',
//         image: PImages.pumaLogo,
//         name = 'Puma',
//         productsCount: 65,
//         isFeatured: true),
//     BrandModel(
//         id = '6',
//         image: PImages.zaraLogo,
//         name = 'ZARA',
//         productsCount: 36,
//         isFeatured: true),
//     BrandModel(
//         id = '7',
//         image: PImages.electronicIcon,
//         name = 'Samsung',
//         productsCount: 36,
//         isFeatured: false),
//   ];

//   // --List of all Brand Categories
//   static final List<BrandCategoryModel> brandCategory = [
//     BrandCategoryModel(brandId: '1', categoryId: '1'),
//     BrandCategoryModel(brandId: '1', categoryId: '8'),
//     BrandCategoryModel(brandId: '1', categoryId: '9'),
//     BrandCategoryModel(brandId: '1', categoryId: '10'),
//     BrandCategoryModel(brandId: '2', categoryId: '1'),
//     BrandCategoryModel(brandId: '2', categoryId: '8'),
//     BrandCategoryModel(brandId: '2', categoryId: '9'),
//     BrandCategoryModel(brandId: '2', categoryId: '10'),
//     BrandCategoryModel(brandId: '3', categoryId: '1'),
//     BrandCategoryModel(brandId: '3', categoryId: '8'),
//     BrandCategoryModel(brandId: '3', categoryId: '9'),
//     BrandCategoryModel(brandId: '3', categoryId: '10'),
//     BrandCategoryModel(brandId: '4', categoryId: '1'),
//     BrandCategoryModel(brandId: '4', categoryId: '8'),
//     BrandCategoryModel(brandId: '4', categoryId: '9'),
//     BrandCategoryModel(brandId: '4', categoryId: '10'),
//     BrandCategoryModel(brandId: '5', categoryId: '15'),
//     BrandCategoryModel(brandId: '5', categoryId: '2'),
//     BrandCategoryModel(brandId: '10', categoryId: '2'),
//     BrandCategoryModel(brandId: '10', categoryId: '14'),
//     BrandCategoryModel(brandId: '6', categoryId: '3'),
//     BrandCategoryModel(brandId: '6', categoryId: '16'),
//     BrandCategoryModel(brandId: '7', categoryId: '2'),
//     BrandCategoryModel(brandId: '8', categoryId: '5'),
//     BrandCategoryModel(brandId: '8', categoryId: '11'),
//     BrandCategoryModel(brandId: '8', categoryId: '12'),
//     BrandCategoryModel(brandId: '8', categoryId: '13'),
//     BrandCategoryModel(brandId: '9', categoryId: '5'),
//     BrandCategoryModel(brandId: '9', categoryId: '11'),
//     BrandCategoryModel(brandId: '9', categoryId: '12'),
//     BrandCategoryModel(brandId: '9', categoryId: '13'),
//   ];

//   // --List of all Product Categories
//   static final List<ProductCategoryModel> productCategories = [
//     ProductCategoryModel(productId: '001', categoryId: '1'),
//     ProductCategoryModel(productId: '001', categoryId: '8'),
//     ProductCategoryModel(productId: '004', categoryId: '3'),
//     ProductCategoryModel(productId: '002', categoryId: '3'),
//     ProductCategoryModel(productId: '002', categoryId: '16'),
//     ProductCategoryModel(productId: '003', categoryId: '3'),
//     ProductCategoryModel(productId: '005', categoryId: '1'),
//     ProductCategoryModel(productId: '005', categoryId: '8'),
//     ProductCategoryModel(productId: '040', categoryId: '2'),
//     ProductCategoryModel(productId: '040', categoryId: '15'),
//     ProductCategoryModel(productId: '006', categoryId: '2'),
//     ProductCategoryModel(productId: '007', categoryId: '4'),
//     ProductCategoryModel(productId: '009', categoryId: '1'),
//     ProductCategoryModel(productId: '009', categoryId: '8'),
//     ProductCategoryModel(productId: '010', categoryId: '1'),
//     ProductCategoryModel(productId: '010', categoryId: '8'),
//     ProductCategoryModel(productId: '011', categoryId: '1'),
//     ProductCategoryModel(productId: '011', categoryId: '8'),
//     ProductCategoryModel(productId: '012', categoryId: '1'),
//     ProductCategoryModel(productId: '012', categoryId: '8'),
//     ProductCategoryModel(productId: '013', categoryId: '1'),
//     ProductCategoryModel(productId: '013', categoryId: '8'),
//     //
//     ProductCategoryModel(productId: '014', categoryId: '1'),
//     ProductCategoryModel(productId: '014', categoryId: '9'),
//     ProductCategoryModel(productId: '015', categoryId: '1'),
//     ProductCategoryModel(productId: '015', categoryId: '9'),
//     ProductCategoryModel(productId: '016', categoryId: '1'),
//     ProductCategoryModel(productId: '016', categoryId: '9'),
//     ProductCategoryModel(productId: '017', categoryId: '1'),
//     ProductCategoryModel(productId: '017', categoryId: '9'),
//     //
//     ProductCategoryModel(productId: '018', categoryId: '1'),
//     ProductCategoryModel(productId: '018', categoryId: '10'),
//     ProductCategoryModel(productId: '019', categoryId: '1'),
//     ProductCategoryModel(productId: '019', categoryId: '10'),
//     ProductCategoryModel(productId: '020', categoryId: '1'),
//     ProductCategoryModel(productId: '020', categoryId: '10'),
//     ProductCategoryModel(productId: '021', categoryId: '1'),
//     ProductCategoryModel(productId: '021', categoryId: '10'),
//     //
//     ProductCategoryModel(productId: '022', categoryId: '5'),
//     ProductCategoryModel(productId: '022', categoryId: '11'),
//     ProductCategoryModel(productId: '023', categoryId: '5'),
//     ProductCategoryModel(productId: '023', categoryId: '11'),
//     ProductCategoryModel(productId: '024', categoryId: '5'),
//     ProductCategoryModel(productId: '024', categoryId: '11'),
//     ProductCategoryModel(productId: '025', categoryId: '5'),
//     ProductCategoryModel(productId: '025', categoryId: '5'),
//     //
//     ProductCategoryModel(productId: '026', categoryId: '5'),
//     ProductCategoryModel(productId: '026', categoryId: '12'),
//     ProductCategoryModel(productId: '027', categoryId: '5'),
//     ProductCategoryModel(productId: '027', categoryId: '12'),
//     ProductCategoryModel(productId: '028', categoryId: '5'),
//     ProductCategoryModel(productId: '028', categoryId: '12'),
//     //
//     ProductCategoryModel(productId: '029', categoryId: '5'),
//     ProductCategoryModel(productId: '029', categoryId: '13'),
//     ProductCategoryModel(productId: '030', categoryId: '5'),
//     ProductCategoryModel(productId: '030', categoryId: '13'),
//     ProductCategoryModel(productId: '031', categoryId: '5'),
//     ProductCategoryModel(productId: '031', categoryId: '13'),
//     ProductCategoryModel(productId: '032', categoryId: '5'),
//     ProductCategoryModel(productId: '032', categoryId: '13'),
//     //
//     ProductCategoryModel(productId: '033', categoryId: '2'),
//     ProductCategoryModel(productId: '033', categoryId: '14'),
//     ProductCategoryModel(productId: '034', categoryId: '2'),
//     ProductCategoryModel(productId: '034', categoryId: '14'),
//     ProductCategoryModel(productId: '035', categoryId: '2'),
//     ProductCategoryModel(productId: '035', categoryId: '14'),
//     ProductCategoryModel(productId: '036', categoryId: '2'),
//     ProductCategoryModel(productId: '036', categoryId: '14'),
//     //
//     ProductCategoryModel(productId: '037', categoryId: '2'),
//     ProductCategoryModel(productId: '037', categoryId: '15'),
//     ProductCategoryModel(productId: '038', categoryId: '2'),
//     ProductCategoryModel(productId: '038', categoryId: '15'),
//     ProductCategoryModel(productId: '039', categoryId: '2'),
//     ProductCategoryModel(productId: '039', categoryId: '15'),
//     // 040 after product 005

//     ProductCategoryModel(productId: '008', categoryId: '2'),
//   ];

//   // --List of all Products
//   static final List<ProductModel> products = [
//     ProductModel(
//       id: '001',
//       title: 'GreenNike Sports shoe',
//       stock: 15,
//       price: 135,
//       isFeatured: true,
//       thumbnail: PImages.productImage1,
//       description: 'Green Nike sports shoe',
//       brand: BrandModel(
//           id: '1',
//           image: PImages.nikeLogo,
//           name: 'Nike',
//           productsCount: 265,
//           isFeatured: true),
//       images: [
//         PImages.productImage1,
//         PImages.productImage23,
//         PImages.productImage9
//       ],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '1',
//       productAttributes: [
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
//         ProductAttributeModel(
//             name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//       ],
//       productType: 'ProductType.variable',
//     ),
//     ProductModel(
//       id: '2',
//       title: 'Blue T-shirt for all ages',
//       stock: 15,
//       price: 35,
//       isFeatured: true,
//       thumbnail: PImages.productImage69,
//       description: 'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing else.',
//       brand: BrandModel(id:'6', image: PImages.zaraLogo, name: 'ZARA'),
//       images: [PImages.productImage68, PImages.productImage69, PImages.productImage5],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId:'',
//      productType: ''),
//   ];
// }
