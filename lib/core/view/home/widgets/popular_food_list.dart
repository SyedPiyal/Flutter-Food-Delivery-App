import 'package:flutter/material.dart';
import 'package:food_app/utils/api_consts.dart';
import 'package:provider/provider.dart';

import '../../../../common/cards/medium/restaurant_info_medium_card.dart';
import '../../../../common/scalton/medium_card_scalton.dart';
import '../../../../utils/constants.dart';
import '../../../provider/food_provider.dart';
import '../../details/details_screen.dart';

class PopularFoodList extends StatefulWidget {
  const PopularFoodList({super.key});

  @override
  _PopularFoodListState createState() => _PopularFoodListState();
}

class _PopularFoodListState extends State<PopularFoodList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Fetch popular food list when the widget initializes
      final provider = Provider.of<FoodProvider>(context, listen: false);
      provider.fetchPopularFoods();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 254,
          child: provider.isLoading
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      2,
                      (index) => const Padding(
                        padding: EdgeInsets.only(left: defaultPadding),
                        child: MediumCardScalton(),
                      ),
                    ),
                  ),
                )
              : provider.errorMessage != null
                  ? Center(
                      child: Text(provider.errorMessage!),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          provider.popularProducts?.products?.length ?? 0,
                      itemBuilder: (context, index) {
                        final product =
                            provider.popularProducts?.products?[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            left: defaultPadding,
                            right: (provider.popularProducts!.products!.length -
                                        1) ==
                                    index
                                ? defaultPadding
                                : 0,
                          ),
                          child: RestaurantInfoMediumCard(
                            image: AppApiConstants.suchiImage,
                            name: product?.name ?? "",
                            location: product?.location ?? "",
                            delivertTime: 25,
                            rating: 0,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailsScreen(),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}
