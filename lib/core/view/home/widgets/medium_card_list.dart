import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/cards/medium/restaurant_info_medium_card.dart';
import '../../../../common/scalton/medium_card_scalton.dart';
import '../../../../utils/constants.dart';
import '../../../provider/product_provider.dart';
import '../../details/details_screen.dart';

class MediumCardList extends StatefulWidget {
  const MediumCardList({super.key});

  @override
  _MediumCardListState createState() => _MediumCardListState();
}

class _MediumCardListState extends State<MediumCardList> {
  @override
  void initState() {
    super.initState();
    // Fetch popular products when the widget initializes
    final provider = Provider.of<PopularProductProvider>(context, listen: false);
    provider.fetchPopularProducts();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PopularProductProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 254,
          child: provider.isLoading
              ? buildFeaturedPartnersLoadingIndicator()
              : provider.errorMessage != null
              ? Center(child: Text(provider.errorMessage!))
              : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.popularProducts?.products?.length ?? 0,
            itemBuilder: (context, index) {
              final product = provider.popularProducts!.products![index];
              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding,
                  right: (provider.popularProducts!.products!.length - 1) == index ? defaultPadding : 0,
                ),
                child: RestaurantInfoMediumCard(
                  image: product.img??"", // Assuming your Product model has an image field
                  name: product.name??"", // Assuming your Product model has a name field
                  location: product.location??"", // Add the correct field from your Product model
                  delivertTime: 25,
                  rating: 0, // Assuming your Product model has a rating field
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

  SingleChildScrollView buildFeaturedPartnersLoadingIndicator() {
    return SingleChildScrollView(
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
    );
  }
}
