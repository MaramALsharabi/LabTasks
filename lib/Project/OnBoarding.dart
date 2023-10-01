import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Login.dart';
class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  @override
  State<OnBoarding> createState() => _OnBoarding();
}
class _OnBoarding extends State<OnBoarding> {
  final int numPages=2;
  final PageController _pageController=PageController(initialPage:0);
  int currentPage=0;

  Widget _indicator(bool isActive){
    return AnimatedContainer(
        duration: Duration(milliseconds:  800),
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 4.0,
        width: isActive ? 20.0:4.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        )
    );
  }

  List<Widget> _buildPageIndicator(){
    List<Widget>list=[];
    for (int i =0;i< numPages;i++){
      list.add(i==currentPage? _indicator(true):_indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: Column(
            children:[
              Container(
                height: 480,
                child: PageView(
                  physics:ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page){
                    setState(() {
                      currentPage=page;
                    });
                  },
                  children:[firstPage(), secondPage(),],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: _buildPageIndicator()
                  ,),
              ),
              tail(context: context, currentPage: currentPage, numPages: numPages, pageController: _pageController)
            ],
          ),
        ),
      ),
    );
  }
}

Widget firstPage()=>Column(
  children: [
    Center(child: Image.asset("Images/teaching.png",width: 400,height: 350,)),
    Padding(
      padding: const EdgeInsets.only(right: 260,left: 20),
      child: Text('Explore your new skills today',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
    ),
    SizedBox(height: 15,),
    Padding(
      padding: const EdgeInsets.only(right: 260,left: 20),
      child: Text('you can learn various kinds of courses in your hand',style:TextStyle(fontWeight: FontWeight.normal,color: Colors.white60,fontSize: 15)),
    ),
  ],
);

Widget secondPage()=>Column(
  children: [
    Center(child: Image.asset("Images/group.png",width: 400,height: 350,)),
    Padding(
      padding: const EdgeInsets.only(right: 180,left: 20),
      child: Text('Empower your education to next level',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
    ),
    SizedBox(height: 15,),
    Padding(
      padding: const EdgeInsets.only(right: 240,left: 20),
      child: Text('Learn new things and develop your problem solving skills',style:TextStyle(fontWeight: FontWeight.normal,color: Colors.white60,fontSize: 15)),
    ),
  ],
);

Widget tail({required BuildContext context,required int currentPage,required int numPages ,required PageController pageController})=>Expanded(
  child: Row(
    mainAxisAlignment:MainAxisAlignment.spaceBetween,
    children:[
      Container(
        width: 100,
        height: 40,
        margin: EdgeInsets.only(left: 40),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(5),
          color: Colors.black38,
        ),
        child: Center(
          child: GestureDetector(
            child:Text('Next', style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,),),
            onTap: (){
              currentPage!=numPages-1?pageController.nextPage(duration: Duration(milliseconds: 2000),curve:Curves.ease):
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Login()));
            },
          ),
        ),
      ),
      TextButton(
        child: Container(
            width: 100,
            height: 40,
            margin: EdgeInsets.only(right: 10),
            child: Center(child: Text('Skip', style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,),))
        ),
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Login()));
        },
      )
    ],
  ),
);