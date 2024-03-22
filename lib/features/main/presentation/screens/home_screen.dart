import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:uzum_market/features/main/domain/entities/seller_entity.dart';
import 'package:uzum_market/features/main/presentation/widgets/product_card_widget.dart';

import '../../../../core/widgets/search_field_widget.dart';
import '../../domain/entities/product_entity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _controllerSearch;

  List<String> bannersImages = [
    "https://images.uzum.uz/cno1tt04idugcqeh7j90/main_page_banner.jpg",
    "https://images.uzum.uz/cnknre5bl7rtgkb9apmg/main_page_banner.jpg",
    "https://images.uzum.uz/cnkq2ldbl7rtgkb9bh70/main_page_banner.jpg",
    "https://images.uzum.uz/cnrt86tbl7rj55mgk9b0/main_page_banner.jpg",
    "https://images.uzum.uz/cnknum04idugcqegibig/main_page_banner.jpg",
    "https://images.uzum.uz/cnkoaflbl7rtgkb9av3g/main_page_banner.jpg",
  ];

  List<ProductEntity> products = [
    ProductEntity(
      id: 1,
      images: [
        "https://images.uzum.uz/cn9mar3ifoubkc6sjo90/original.jpg",
        "https://images.uzum.uz/cn9maurifoubkc6sjofg/original.jpg",
        "https://images.uzum.uz/cn9manp25kub33f4cfqg/original.jpg",
      ],
      title: "Национальная женская сумка GoldSilk",
      stars: 0,
      countReviews: 0,
      orders: 9,
      price: 69000,
      oldPrice: 189000,
      priceInstallments: 7762,
      inStock: 30,
      boughtWeek: 3,
      description:
          "Качественная сумочка для женщин и девочек от бренда GoldSilk. Можно сказать, что эта сумка, способная сочетать в себе национализм и современность, несомненно, понравится каждой женщине и девушке. Благодаря великолепному дизайну эту сумку можно использовать с любым нарядом. Эта сумка станет вашим идеальным спутником в путешествии, учебе или работе. Потому что в сумке можно носить все: от косметики до книг. Эта сумка изготовлена ​​из 100% чистого хлопка. Высота 22 см, ширина 26 см. Длина веревки ручки 43 см. Внутри сумки имеется 1 небольшой карман на молнии для хранения мелочей.Сделано вручную.",
      seller: SellerEntity(
          name: "Gold Silk",
          stars: 4.6,
          assessment: 5,
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs17_soF0Jp6VCroEpJwbnXBA4W1HU189-GA&usqp=CAU"),
    ),
    ProductEntity(
      id: 2,
      images: [
        "https://images.uzum.uz/cc8ru0eha88139ljb7og/original.jpg",
        "https://images.uzum.uz/cc8ru0eha88139ljb7pg/original.jpg",
        "https://images.uzum.uz/cc8ru0eha88139ljb7p0/original.jpg",
      ],
      title: " Шампунь для волос Garnier Fructis SOS, восстановление, 400 мл ",
      stars: 4.9,
      countReviews: 319,
      orders: 4000,
      price: 44000,
      oldPrice: 49000,
      priceInstallments: 4950,
      inStock: 529,
      boughtWeek: 65,
      description:
          "Шампунь с кератином и маслом амлы эффективно устраняет повреждения волос, вызванные сушкой горячим феном, термоукладкой, стайлингом и другими агрессивными внешними факторами. Кератин в формуле проникает глубоко в структуру волоса и восстанавливает ее изнутри. Масло амлы «запечатывает» секущиеся кончики и сглаживает поверхность волоса по всей длине. Активный концентрат фруктов оказывает укрепляющее действие на волосяные луковицы, придает волосам плотность и здоровый блеск.",
      seller: SellerEntity(
        name: "Garnier",
        stars: 4.9,
        assessment: 3363,
        image:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fm.facebook.com%2FGarnierIndia%2F&psig=AOvVaw2ccRvEWfwbeauhy4mClslX&ust=1711191335752000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJiK89Lah4UDFQAAAAAdAAAAABAD",
      ),
    ),

  ];

  @override
  void initState() {
    _controllerSearch = TextEditingController();
    super.initState();
  }

  @override
  void deactivate() {
    _controllerSearch.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SearchFieldWidget(
                  hintText: "searchFieldTitle".tr(),
                  onSubmitted: (String) {},
                  controller: _controllerSearch,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlutterCarousel(
                        options: CarouselOptions(
                          enableInfiniteScroll: true,
                          height: 194.h,
                          clipBehavior: Clip.antiAlias,
                          showIndicator: false,
                          initialPage: bannersImages.length ~/ 2,
                        ),
                        items: [
                          ...List.generate(
                            bannersImages.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      bannersImages[index],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, top: 15.h),
                        child: Text(
                          "titleAllProducts".tr(),
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: products.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.5,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 15.h),
                        itemBuilder: (context, index) => ProductCardWidget(
                          productEntity: products[index],
                          onTapAdd: () {},
                          onTapActiveFavorite: () {},
                          onTap: () {},
                          onTapInActiveFavorite: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
