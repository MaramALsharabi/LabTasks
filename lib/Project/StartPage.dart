import 'package:flutter/material.dart';
import 'package:pro_login/Models/Recommended.dart';
import '../Models/InProgress.dart';
import 'AccountPage.dart';
import 'CertificationPage.dart';
import 'EbookPage.dart';

class StartPage extends StatefulWidget {
  StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  List<InProgress> progressCourses=InProgress.getCourses();
  List<Recommended> recommendedCourses=Recommended.getCourses();
  int _currentIndex=0;

  Widget StartPagee()=>ListView(
      padding: EdgeInsets.only(bottom: 20),
      children: [
        appBar(),
        const SizedBox(height: 10,),
        _searchField(),
        const SizedBox(height: 40,),
        _progressCoursesSelection(),
        const SizedBox(height: 40,),
        _recommendedCoursesSelection(),
        const SizedBox(height: 30,),
      ]);
  List <Widget> listPages=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listPages.add(StartPagee());
    listPages.add(EbookPage());
    listPages.add(CertificationPage());
    listPages.add(AccountPage());
  }

  void changePage(int selectedIndex) {
    setState(() {
      _currentIndex=selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:listPages[_currentIndex] ,
      bottomNavigationBar:bottomNavigationBar() ,
    );
  }

  Widget appBar()=>Container(
    margin: EdgeInsets.only(left: 25,right: 25,top: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome !',style: TextStyle(fontSize: 20.0,color:Colors.white,fontWeight: FontWeight.w900)),
              SizedBox(height: 5,),
              Text('Maroom',style: TextStyle(fontSize: 18.0,color:Colors.white)),
            ],
          ),
      Container(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.notifications_none_rounded,color: Colors.white,),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.menu_rounded,color: Colors.white,),
              onPressed: (){},
            ),
          ],
        ),
      )
          ],
        ),
  );

  Container _searchField() {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 40,left: 40,right: 40),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff1D1617).withOpacity(0.11),
              blurRadius: 40,
            )
          ]
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor:  Color(0xfff1f1f1),
          contentPadding: const EdgeInsets.only(left: 30),
          hintText: 'Search',
          hintStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 16
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(Icons.search),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }

  Column _progressCoursesSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left:40),
          child: Text(
            'Course in progress',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(height: 35),
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: progressCourses.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 50, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 25,),
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      child: Image.asset(progressCourses[index].imgPath),
                      ),
                    SizedBox(height: 10,),
                    Text(
                      progressCourses[index].title,
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    )
                  ],
                ),
              );
            },
          ),


        )
      ],
    );
  }

  Column _recommendedCoursesSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left:40),
          child: Text(
            'Recommended',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(height: 30,),
        SizedBox(
          height: 150,
          child: ListView.separated(
            itemCount: progressCourses.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 50, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 25,),
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      margin: EdgeInsets.only(right: 10),
                      child: Image.asset(recommendedCourses[index].imgPath),
                    ),
                    SizedBox(height: 15),
                     Container(
                          width: 100,
                          height: 40,
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            recommendedCourses[index].title,
                            style: const TextStyle(color: Colors.white70, fontSize: 13),
                           ),
                     )

                  ],
                ),
              );
            },
          ),


        )
      ],
    );
  }

  Widget bottomNavigationBar()=>Container(
    width: 50,
    height: 70,
    margin: EdgeInsets.only(left: 40,right: 40,bottom: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child:Padding(
      padding: const EdgeInsets.only(left: 8,right: 8,top: 10,bottom: 3.5),
      child: BottomNavigationBar(
        currentIndex:_currentIndex,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.grey.shade800,size: 26,),label: "",backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.book,color: Colors.grey.shade800,size: 26,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper_sharp,color:Colors.grey.shade800,size: 26,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.manage_accounts,color: Colors.grey.shade800,size: 26,),label: ""),
        ],
        // selectedIconTheme: IconThemeData(color:Colors.grey.shade900 ),
        // backgroundColor:Colors.white,
        elevation: 0,
        onTap: (int selectedIndex)=>changePage(selectedIndex),
      ),
    ),
  );

}

void main()=>runApp(StartPage());