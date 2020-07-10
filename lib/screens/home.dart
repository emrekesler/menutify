import 'package:flutter/material.dart';
import 'package:menutify/models/Category.dart';
import 'package:menutify/models/MenuItem.dart';
import 'package:menutify/models/Restaurant.dart';
import 'package:menutify/widgets/category_card.dart';
// import 'package:menutify/widgets/category_card.dart';

import 'package:menutify/widgets/restaurant_card.dart';
import 'package:menutify/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Restaurant> restaurants = List<Restaurant>();

    restaurants.add(
      Restaurant(
        name: "Cef Burger",
        address: " Kağıthane (Gürsel Mah.)",
        distince: "1.2 km",
        firstCat: "Fastfood",
        image:
            "https://scontent.fist11-1.fna.fbcdn.net/v/t1.0-9/77218130_128188681952958_7057501273083346944_o.jpg?_nc_cat=103&_nc_sid=8bfeb9&_nc_ohc=I2ZUWQmfOcgAX-GrvQU&_nc_ht=scontent.fist11-1.fna&oh=594ad73c65b14e2f442bf7334643d775&oe=5F2457A9",
        menus: <MenuItem>[
          MenuItem(
            name: "Vodafone Menüsü (Chef Burger X)",
            category: Category(
              id: 1,
              name: "Burgerler",
            ),
            image:
                "https://cdn.yemeksepeti.com/ProductImages/TR_ISTANBUL/yesen_burger/yesenburgerbayrampasayildirimmah._3luminiburger3x50gr._20190128120126_big.jpg",
            explanation:
                "Chef Burger X + Patates Kızartması + Kutu İçecek (Kampanya koşulları için restoranın Promosyonlar bölümüne göz atınız. İndirimli fiyat ürün sepete eklendikten sonra uygulanır.)",
            price: "26,00 TL",
          ),
          MenuItem(
            name: "Seçilmiş Menü (Chef Burger No.11)",
            category: Category(
              id: 1,
              name: "Burgerler",
            ),
            image:
                "https://b.zmtcdn.com/data/pictures/9/19278449/e8eb3ce445a0fe632cc7f67a47aa085a.jpg",
            explanation:
                "Chef Burger No.11 + Patates Kızartması + Coca-Cola (33 cl.)",
            price: "29,25 TL",
          ),
          MenuItem(
            name: "Double Et Bol Mantar Cheeseburger",
            category: Category(
              id: 1,
              name: "Burgerler",
            ),
            image:
                "https://1spcburger.com/wp-content/uploads/2019/03/Snapseed.jpg",
            explanation:
                "180 gr. burger köftesi, 2 dilim cheddar peyniri, domates, kültür mantarı, karamelize soğan. Patates kızartması ile",
            price: "26,50 TL",
          ),
          MenuItem(
            name: "Boğaz Kumru Sandviç Menü",
            category: Category(
              id: 2,
              name: "Sandviç",
            ),
            image:
                "https://cdn.yemek.com/mnresize/940/940/uploads/2014/11/kumru-yeni.jpg",
            explanation: "Boğaz Kumru Sandviç + Günün Tatlısı + Kutu İçecek",
            price: "28,50 TL",
          ),
          MenuItem(
            name: "Ekmek Arası Kasap Köfte Menü",
            category: Category(
              id: 2,
              name: "Sandviç",
            ),
            image:
                "https://icdn.tgrthaber.com.tr/images/haberler/2019_12/buyuk/kumru-leziz-kumru-tarifi-kumru-tarifi-ve-kumru-nasil-yapilir-1577456805.jpg",
            explanation:
                "Ekmek Arası Kasap Köfte + Günün Tatlısı + Kutu İçecek",
            price: "26,50 TL",
          )
        ],
      ),
    );

    restaurants.add(
      Restaurant(
        name: "ChinaStix ",
        address: "Etiler",
        distince: "2.5 km",
        firstCat: "Çin Mutfağı",
        image:
            "https://d3hne3c382ip58.cloudfront.net/files/uploads/bookmundi/resized/cmsfeatured/best-foods-in-china-feature-image-1569232894-785X440.jpg",
        menus: <MenuItem>[
          MenuItem(
            name: "1. Wonton Çorbası / Wonton Soup",
            category: Category(
              id: 3,
              name: "Çorbalar",
            ),
            image:
                "https://cdn.yemeksepeti.com//productimages/TR_ISTANBUL/china_stix_sushi/1_WONTON_cORBASI_big.jpg",
            explanation:
                "Mantı, yumurta, taze soğan / Dumpling, egg, fresh onion",
            price: "19,00 TL",
          ),
          MenuItem(
            name: "2. Dana Etli Acılı Ekşili Çorba / Hot & Sour Soup",
            category: Category(
              id: 3,
              name: "Çorbalar",
            ),
            image:
                "https://cdn.yemeksepeti.com/ProductImages/TR_ISTANBUL/china_stix_sushi/dana_eksili_acili_corba_big.jpg",
            explanation:
                "Salatalık, havuç, yumurta, dana eti, soya filizi / Cucumber, carrot, egg, beef, soybean sprouts",
            price: "19,00 TL",
          ),
          MenuItem(
            name: "General Tso Tavuk",
            category: Category(
              id: 4,
              name: "Beyaz Etler",
            ),
            image:
                "https://cdn.yemeksepeti.com/productimages/TR_ISTANBUL/china_stix_sushi/42_KARIsIK_SEBZEL%C4%B0_TAVUK_big.jpg",
            explanation: "Taze soğan, susam, acı sos, tatlı ekşi sos",
            price: "40,85 TL",
          ),
          MenuItem(
            name: "Karışık Sebzeli Tavuk / Chicken with Vegetables",
            category: Category(
              id: 4,
              name: "Beyaz Etler",
            ),
            image:
                "https://cdn.yemeksepeti.com/productimages/TR_ISTANBUL/china_stix_sushi/44_BROKOLiLi_TAVUK_big.jpg",
            explanation:
                "Kabak, kuru soğan, havuç, brokoli, soya filizi, mantar, mısır, yeşilbiber / Courgette, onion, carrot, broccoli, soybean sprouts, mushroom, corn, green pepper",
            price: "38,50 TL",
          ),
          MenuItem(
            name: "Karışık Sebzeli Karides / Shrimps with Vegetables",
            category: Category(
              id: 5,
              name: "Deniz Ürünleri",
            ),
            image:
                "https://cdn.yemeksepeti.com/productimages/TR_ISTANBUL/china_stix_sushi/71_KARIsIK_SEBZEL%C4%B0_KARiDES_big.jpg",
            explanation:
                "Kabak, kuru soğan, havuç, brokoli, soya filizi, mantar, mısır, yeşilbiber / Courgette, onion, carrot, broccoli, soybean sprouts, mushroom, corn, green pepper",
            price: "54,15 TL",
          )
        ],
      ),
    );

    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBar(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "Trending Restaurants",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF222455)),
              ),
            ),
            Container(
              height: size.height * 0.40,
              child: ListView.builder(
                  itemCount: restaurants.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Restaurant restaurant = restaurants[index];
                    return RestaurantCard(
                      restaurant: restaurant,
                    );
                  }

                  // child: Row(
                  //   children: <Widget>[
                  //     RestaurantCard(
                  //       heroTag: "1",
                  //       pictureUrl:
                  //           "https://a.cdn-hotels.com/gdcs/production39/d1302/033aaf60-493f-4b6d-9284-e9f6266e3888.jpg",
                  //     ),
                  //     RestaurantCard(
                  //       heroTag: "2",
                  //       pictureUrl:
                  //           "https://www.sanpellegrino.com/media//international/news/2018/Sanpellegrino_post_WORLD50BEST_2018.jpg",
                  //     ),
                  //     RestaurantCard(
                  //       heroTag: "3",
                  //       pictureUrl:
                  //           "https://a.cdn-hotels.com/gdcs/production167/d673/4e5ce4ec-4663-4df9-8e44-49ae277c8291.jpg",
                  //     ),
                  //   ],
                  // ),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Category",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF222455)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Card(
                      child: CategoryCard(
                        pictureUrl:
                            "https://www.englishclub.com/images/vocabulary/food/italian/italian-food-640.jpg",
                        text: "Italian",
                        colors: [
                          Color(0xFFFF5673).withOpacity(0.5),
                          Color(0xFFFF8C48).withOpacity(0.5)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: CategoryCard(
                        pictureUrl:
                            "https://static.toiimg.com/thumb/73579687.cms?width=680&height=512&imgsize=425618",
                        text: "Chinese ",
                        colors: [
                          Color(0xFFFF4665).withOpacity(0.5),
                          Color(0xFF832BF6).withOpacity(0.5)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: CategoryCard(
                        pictureUrl:
                            "https://img1.mashed.com/img/gallery/mexican-foods-you-need-to-try-before-you-die/intro-1585677665.jpg",
                        text: "Mexican",
                        colors: [
                          Color(0xFF2DCEF8).withOpacity(0.5),
                          Color(0xFF3B40FE).withOpacity(0.5)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
