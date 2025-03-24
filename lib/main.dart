




import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab1_homepage/data/models/NewsItem.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ảnh SVG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: NewsHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class NewsHomePage extends StatefulWidget{
  @override
  _NewsHomePageState createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage>{
    final List<String> _categories = [
      'All', 'Sports', 'Politics', 'Business', 'Health', 'Travel', 'Science'
    ];
    final List<NewsItem> _newsItems = [
      NewsItem(
        title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid for Russian oil',
        source: 'BBC News',
        timeAgo: '14m ago',
        imageUrl: 'assets/ukraine.jpg',
        category: 'Europe',
      ),
      NewsItem(
        title: 'Her train broke down. Her phone died. And then she met her...',
        source: 'CNN',
        timeAgo: '1h ago',
        imageUrl: 'assets/train.jpg',
        category: 'Travel',
      ),
      NewsItem(
        title: 'Russian warship: Moskva sinks in Black Sea',
        source: 'BBC News',
        timeAgo: '4h ago',
        imageUrl: 'assets/warship.jpg',
        category: 'Europe',
      ),
      NewsItem(
        title: 'Wind power produced more electricity than coal and nuclear for first time in US',
        source: 'USA Today',
        timeAgo: '4h ago',
        imageUrl: 'assets/windpower.jpg',
        category: 'Money',
      ),
      NewsItem(
        title: '\'We keep rising to new challenges\': For churches hit by disasters, Easter brings hope',
        source: 'USA Today',
        timeAgo: '4h ago',
        imageUrl: 'assets/church.jpg',
        category: 'Life',
      ),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/navbar/Vector.svg',
              width: 99,
              height: 30,
            ),

            const Spacer(),
            SizedBox(
              width: 32, // Đặt chiều rộng đủ để Stack chứa icon
              height: 32, // Đặt chiều cao đủ để tránh icon bị mất
              child: Stack(
                alignment: Alignment.center, // Giúp canh giữa icon trong Stack
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.0000000001,
                          spreadRadius: 0.003,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      'assets/navbar/Bel.svg',
                      width: 18,
                      height: 21.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ) ,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 16, right: 5, top: 8, bottom: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Lastest',
              style: TextStyle(
              fontSize: 20,
                fontWeight: FontWeight.bold
              ),),


              TextButton(onPressed: (){}, child: Text('See all',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,

              ),))
            ],
            ),)
          ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
          'assets/navbar/bottomNavbar/home.svg',
          width: 24,
          height: 24),
            label: "Home"
          ),
          BottomNavigationBarItem(

              icon: SvgPicture.asset(
                  'assets/navbar/bottomNavbar/explore.svg',
                  width: 24,
                  height: 24),
              label: "Explore"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  'assets/navbar/bottomNavbar/bookmark.svg',
                  width: 24,
                  height: 24),
              label: "Bookmark"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  'assets/navbar/bottomNavbar/profile.svg',
                  width: 24,
                  height: 24),
              label: "Profile"
          ),
        ],
      ),
    );
  }




}