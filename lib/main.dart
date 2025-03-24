
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
  int _selectedIndex= 0;
  int _selectedIndexNavbar = 0;
    final List<String> _categories = [
      'All', 'Sports', 'Politics', 'Business', 'Health', 'Travel', 'Science'
    ];
    final List<NewsItem> _newsItems = [
      NewsItem(
        title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
        source: 'BBC News',
        timeAgo: '14m ago',
        imageUrl: 'assets/news/imgTh1.png',
        category: 'Europe',
        author: 'assets/author/imgType/BBC.png'
      ),
      NewsItem(
        title: 'Her train broke down. Her phone died. And then she met her..',
        source: 'CNN',
        timeAgo: '1h ago',
        imageUrl: 'assets/news/imgTh2.png',
        category: 'Travel',
        author:'assets/author/imgType/CNN.png'
      ),
      NewsItem(
        title: 'Russian warship: Moskva sinks in Black Sea',
        source: 'BBC News',
        timeAgo: '4h ago',
        imageUrl: 'assets/news/imgTh3.png',
        category: 'Europe',
        author: 'assets/author/imgType/BBC.png'
      ),
      NewsItem(
        title: 'Wind power produced more electricity than coal and nucle...',
        source: 'USA Today',
        timeAgo: '4h ago',
        imageUrl: 'assets/news/imgTh4.png',
        category: 'Money',
        author: 'assets/author/imgType/USA.png'
      ),
      NewsItem(
        title: '\'We keep rising to new challenges:\' For churches hit by',
        source: 'USA Today',
        timeAgo: '4h ago',
        imageUrl: 'assets/news/imgTh5.png',
        category: 'Life',
        author:'assets/author/imgType/USA.png'
      ),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: Padding(padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/navbar/Vector.svg',
              width: 99,
              height: 30,
            ),

            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12, // Màu nhạt hơn để làm mờ viền
                      blurRadius: 13, // Tăng để làm mờ viền tốt hơn
                      spreadRadius: -4.2,

                    )
                  ]
              ),
              child: SizedBox(
                width: 45,
                height: 30,
                child: SvgPicture.asset(
                  'assets/navbar/Frame.svg',
                  fit: BoxFit.cover, // This will ensure it fills the SizedBox
                ),
              ),
            )
          ],
        ),

        )
      ) ,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 16, right: 5, top: 25  , bottom: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Latest',
              style: TextStyle(
              fontSize: 20,
                fontWeight: FontWeight.bold
              ),),


              TextButton(onPressed: (){}, child: Text('See all',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13,

              ),))
            ],
            ),),
            SizedBox(
              height: 40,
              child: SingleChildScrollView( // Ngăn overflow
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 9.5), // Đẩy toàn bộ danh sách sang trái 16px
                  child: Row(
                    children: List.generate(_categories.length, (index) {
                      // Đo kích thước chữ
                      TextPainter textPainter = TextPainter(
                        text: TextSpan(
                          text: _categories[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        textDirection: TextDirection.ltr,
                      )..layout();
                      double textWidth = textPainter.width;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.7), // Giữ khoảng cách giữa các chữ
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                _categories[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: _selectedIndex == index ? Colors.black : Colors.black87,
                                  fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 4),
                              if (_selectedIndex == index)
                                Container(
                                  height: 2,
                                  width: textWidth, // Gạch chân dài bằng chữ
                                  color: Colors.blue,
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _newsItems.length,
                itemBuilder: (context, index) {
                  return NewsCard(newsItem: _newsItems[index]);
                },
              ),
            ),




          ],

      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12, // Màu của shadow
              blurRadius: 10, // Độ mờ của shadow
             // Phạm vi lan rộng của shadow

            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Làm trong suốt để hiện shadow
          elevation: 0, // Loại bỏ shadow mặc định
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          onTap: (index) {
            setState(() {
              _selectedIndexNavbar = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/navbar/bottomNavbar/home.svg',
                  width: 24,
                  height: 24,
                  color: _selectedIndexNavbar == 0 ? Colors.blue : Colors.black,
                ),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/navbar/bottomNavbar/explore.svg',
                  width: 24,
                  height: 24,
                  color: _selectedIndexNavbar == 1 ? Colors.blue : Colors.black,
                ),
                label: "Explore"
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/navbar/bottomNavbar/bookmark.svg',
                  width: 24,
                  height: 24,
                  color: _selectedIndexNavbar == 2 ? Colors.blue : Colors.black,
                ),
                label: "Bookmark"
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/navbar/bottomNavbar/profile.svg',
                  width: 24,
                  height: 24,
                  color: _selectedIndexNavbar == 3 ? Colors.blue : Colors.black,
                ),
                label: "Profile"
            ),
          ],
        ),
      ),
    );
  }




}


class NewsCard extends StatelessWidget{
  final NewsItem newsItem;
  const NewsCard({
    Key? key,
    required this.newsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16.4),
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(newsItem.imageUrl),
      SizedBox(width: 5),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsItem.category,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            Text(
              newsItem.title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Image.asset(newsItem.author),
                SizedBox(width: 4),
                Text(
                  newsItem.source,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.access_time,
                  color: Colors.black87,
                  size: 12,
                ),
                SizedBox(width: 2),
                Text(
                  newsItem.timeAgo,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text('...')
              ],
            ),
          ],
        ),

      ),

    ],
    ));
  }


}