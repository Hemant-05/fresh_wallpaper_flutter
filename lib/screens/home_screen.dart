import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fresh_wallpaper/controller/simple_ui_controller.dart';
import 'package:fresh_wallpaper/service/api_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SearchController searchCon = SearchController();
  SimpleUIController simpleUIController = Get.put(SimpleUIController());
  String url = 'https://api.unsplash.com/photos/?per_page=30&order_by=populer&client_id=G8HoKJF0m0ecx2XoRZWb2M31CKCIbLcyEt-V-Mcl308';

  bool isDark = false;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    APIService().getMethod(url);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            MyAppBar(size: size),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(flex: 1, child: _tabBuilder()),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 12,
                    child: _gridBuilder(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _gridBuilder() {
    return GridView.custom(
      padding: EdgeInsets.symmetric(horizontal: 6),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        pattern: [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 2),
        ],
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8)
            ),
          );
        },
      ),
    );
  }

  Widget _tabBuilder() {
    return ListView.builder(
      itemCount: simpleUIController.orders.length,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Obx(
          () => GestureDetector(
            onTap: () {
              simpleUIController.selectedIndex.value = index;
            },
            child: AnimatedContainer(
              width: 100,
              margin: EdgeInsets.symmetric(horizontal: 8),
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: (simpleUIController.selectedIndex.value == index)
                      ? Colors.black
                      : Colors.grey),
              child: Center(
                child: Text(
                  simpleUIController.orders[index],
                  style: TextStyle(
                      color: (simpleUIController.selectedIndex.value == index)
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: size.width,
        height: size.height * .3,
        decoration: const BoxDecoration(
            image: DecorationImage(
                // colorFilter: ColorFilter.mode(Colors.red, BlendMode.darken),
                image: AssetImage('assets/images/back.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Which type of WallPaper \n do you want ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * .036,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.all(12),
              width: size.width,
              height: 50,
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon:
                        Icon(Icons.search, size: 20, color: Colors.black38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search here'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
