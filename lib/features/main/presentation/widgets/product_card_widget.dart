import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets.dart';
import '../../domain/entities/product_entity.dart';

class ProductCardWidget extends StatefulWidget {
  final ProductEntity productEntity;
  final Function() onTapAdd;
  final Function() onTapActiveFavorite;
  final Function() onTapInActiveFavorite;
  final Function() onTap;
  const ProductCardWidget(
      {super.key,
      required this.productEntity,
      required this.onTapAdd,
      required this.onTapActiveFavorite,
      required this.onTap,
      required this.onTapInActiveFavorite});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(12.r),
      splashColor: Colors.grey.withOpacity(0.1),
      child: Ink(
        height: 377.664.h,
        width: 181.25.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Ink(
              height: 241.664,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.productEntity.images[0],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isSelected = !isSelected;
                          });

                          isSelected
                              ? widget.onTapActiveFavorite.call()
                              : widget.onTapInActiveFavorite.call();
                        },
                        icon: SvgPicture.asset(
                          Assets.tAddFavorite,
                          colorFilter: isSelected
                              ? ColorFilter.mode(
                                  Color(0xff7000FF),
                                  BlendMode.srcIn,
                                )
                              : null,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.productEntity.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.deepOrangeAccent,
                          size: 14,
                        ),
                        Text(
                          " ${widget.productEntity.stars} (${"titleCountOrders".tr(args: [
                                widget.productEntity.orders.toString()
                              ])})",
                          style: TextStyle(
                            fontSize: 11.2.sp,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff8B8E99),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Colors.yellowAccent,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          "titlePriceMonth".tr(args: [
                            widget.productEntity.priceInstallments.toString()
                          ]),
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${"titleSum".tr(args: [
                                    widget.productEntity.oldPrice.toString()
                                  ])}",
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8B8E99),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              "${"titleSum".tr(args: [
                                    widget.productEntity.price.toString()
                                  ])}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: widget.onTapAdd,
                          borderRadius: BorderRadius.circular(100.r),
                          child: Ink(
                            height: 32.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xff8B8E99),
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                Assets.tAdd,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
