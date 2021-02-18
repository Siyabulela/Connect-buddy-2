import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

// void main() => runApp(communityPage());

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'communityPage',
      // home: Sample(),
      debugShowCheckedModeBanner: false,
              home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                  leading: Builder(builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      color: Colors.orangeAccent,
                      onPressed: () {},
                    );
                  }),
                  title: Text("Community"),
                  centerTitle: true,
                  backgroundColor: const Color(0xFF052638),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.orangeAccent,
                      onPressed: () {},
                    ),
                  ]),
              body: SafeArea(
                  child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.orangeAccent,
                    height: MediaQuery.of(context).size.height / 600.1,
                  ),
                  PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: TabBar(
                      labelColor: Colors.black,
                      indicator: BoxDecoration(
                        color: Colors.orangeAccent,
                      ),
                      tabs: [
                        Tab(
                          text: 'Articles',
                        ),
                        Tab(
                          text: 'Ratings and Reviews',
                        ),
                        Tab(
                          text: 'FAQ',
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Container(
                          color: const Color(0xFF052638),
                          child: Center(
                              child: Container(
                            width: 350,
                            height: 500,
                            color: Colors.white,
                            child: ListView(
                              children: [
                                CarouselSlider(
                                  items: [
                                    Container(
                                      margin: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://www.itnewsafrica.com/wp-content/uploads/2020/04/Cell-Towers-UK.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    //2nd Image of Slider
                                    Container(
                                      margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://images.theconversation.com/files/338921/original/file-20200601-95054-ngsue6.jpg?ixlib=rb-1.1.0&rect=7%2C7%2C4985%2C3330&q=45&auto=format&w=496&fit=clip"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    //3rd Image of Slider
                                    Container(
                                      margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://images.unsplash.com/photo-1490135900376-2e86d918a23b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    //4th Image of Slider
                                    Container(
                                      margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://media2.govtech.com/images/940*627/052914-telecom.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    //5th Image of Slider
                                    Container(
                                      margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://images.nappy.co/uploads/large/27721609544423fxefnmhfyz2qjwszpaicn16m3aewuj2trbrlcmeq6r6cwhjx2x151egobsgm3ncemblpxwegeggndn2leu70y8ubzxsg2pluehom.jpg?auto=format&fm=jpg&w=2000"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],

                                  //Slider Container properties
                                  options: CarouselOptions(
                                    height: 280.0,
                                    enlargeCenterPage: true,
                                    // autoPlay: true,
                                    aspectRatio: 14 / 9,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: true,
                                    // autoPlayAnimationDuration: Duration(milliseconds: 800),
                                    viewportFraction: 0.8,
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                        Container(
                          color: const Color(0xFF052638),
                          child: Center(child: Text('Tab2')),
                        ),
                        Container(
                          color: const Color(0xFF052638),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Container(
                                    width: 370,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 370,
                                    height: 100,
                                     decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 370,
                                    height: 100,
                                     decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 370,
                                    height: 100,
                                     decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 370,
                                    height: 100,
                                     decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 370,
                                    height: 100,
                                     decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                            )
                          ),
                        ) // class name
                      ],
                    ),
                  ),
                ],
              )),
            ))
    );
  }
}

final tab = new TabBar(tabs: <Tab>[
  new Tab(icon: new Icon(Icons.arrow_forward)),
  new Tab(icon: new Icon(Icons.arrow_downward)),
  new Tab(icon: new Icon(Icons.arrow_back)),
]);

// class Sample extends StatefulWidget {
//   @override
//   State<Sample> createState() => SampleState();
// }


// class SampleState extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: DefaultTabController(
//             length: 3,
//             child: Scaffold(
//               appBar: AppBar(
//                   leading: Builder(builder: (BuildContext context) {
//                     return IconButton(
//                       icon: Icon(Icons.arrow_back_ios_rounded),
//                       color: Colors.orangeAccent,
//                       onPressed: () {},
//                     );
//                   }),
//                   title: Text("Community"),
//                   centerTitle: true,
//                   backgroundColor: const Color(0xFF052638),
//                   actions: <Widget>[
//                     IconButton(
//                       icon: Icon(Icons.search),
//                       color: Colors.orangeAccent,
//                       onPressed: () {},
//                     ),
//                   ]),
//               body: SafeArea(
//                   child: Column(
//                 children: <Widget>[
//                   Container(
//                     color: Colors.orangeAccent,
//                     height: MediaQuery.of(context).size.height / 600.1,
//                   ),
//                   PreferredSize(
//                     preferredSize: Size.fromHeight(50.0),
//                     child: TabBar(
//                       labelColor: Colors.black,
//                       indicator: BoxDecoration(
//                         color: Colors.orangeAccent,
//                       ),
//                       tabs: [
//                         Tab(
//                           text: 'Articles',
//                         ),
//                         Tab(
//                           text: 'Ratings and Reviews',
//                         ),
//                         Tab(
//                           text: 'FAQ',
//                         )
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: TabBarView(
//                       children: [
//                         Container(
//                           color: const Color(0xFF052638),
//                           child: Center(
//                               child: Container(
//                             width: 350,
//                             height: 500,
//                             color: Colors.white,
//                             child: ListView(
//                               children: [
//                                 CarouselSlider(
//                                   items: [
//                                     Container(
//                                       margin: EdgeInsets.all(8.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               "https://www.itnewsafrica.com/wp-content/uploads/2020/04/Cell-Towers-UK.jpg"),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),

//                                     //2nd Image of Slider
//                                     Container(
//                                       margin: EdgeInsets.all(6.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               "https://images.theconversation.com/files/338921/original/file-20200601-95054-ngsue6.jpg?ixlib=rb-1.1.0&rect=7%2C7%2C4985%2C3330&q=45&auto=format&w=496&fit=clip"),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),

//                                     //3rd Image of Slider
//                                     Container(
//                                       margin: EdgeInsets.all(6.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               "https://images.unsplash.com/photo-1490135900376-2e86d918a23b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80"),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),

//                                     //4th Image of Slider
//                                     Container(
//                                       margin: EdgeInsets.all(6.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               "https://media2.govtech.com/images/940*627/052914-telecom.jpg"),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),

//                                     //5th Image of Slider
//                                     Container(
//                                       margin: EdgeInsets.all(6.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               "https://images.nappy.co/uploads/large/27721609544423fxefnmhfyz2qjwszpaicn16m3aewuj2trbrlcmeq6r6cwhjx2x151egobsgm3ncemblpxwegeggndn2leu70y8ubzxsg2pluehom.jpg?auto=format&fm=jpg&w=2000"),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                   ],

//                                   //Slider Container properties
//                                   options: CarouselOptions(
//                                     height: 280.0,
//                                     enlargeCenterPage: true,
//                                     // autoPlay: true,
//                                     aspectRatio: 14 / 9,
//                                     autoPlayCurve: Curves.fastOutSlowIn,
//                                     enableInfiniteScroll: true,
//                                     // autoPlayAnimationDuration: Duration(milliseconds: 800),
//                                     viewportFraction: 0.8,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )),
//                         ),
//                         Container(
//                           color: const Color(0xFF052638),
//                           child: Center(child: Text('Tab2')),
//                         ),
//                         Container(
//                           color: const Color(0xFF052638),
//                           child: Center(child: Text('Tab3')),
//                         ) // class name
//                       ],
//                     ),
//                   ),
//                 ],
//               )),
//             )));
//   }
// }