import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:graphqlflutter/models/character.dart';

class ListarPersonages extends StatelessWidget {
  const ListarPersonages({@required this.list, @required this.onRefresh});

  final List<Character> list;
  final onRefresh;
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Swiper(
          itemCount: this.list.length,
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemBuilder: (BuildContext context, index) {
            return Hero(
                tag: this.list[index].id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: Card(
                          elevation: 3,
                          color: Colors.grey[50],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(children: [
                            Container(
                              height: 300,
                              child: Image.network(
                                this.list[index].image,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(this.list[index].name)
                          ]),
                        ),
                      )),
                ));
          }),
    );

    // return ListView.builder(
    //   itemCount: this.list.length,
    //   itemBuilder: (BuildContext context, index) {
    //     return InkWell(
    //       onTap: () {},
    //       child: ListTile(
    //         leading: Image.network(this.list[index]['image']),
    //         title: Text(this.list[index]['name']),
    //         trailing: Icon(Icons.keyboard_arrow_right),
    //       ),
    //     );
    //   },
    // );
  }
}
