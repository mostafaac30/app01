import 'package:flutter/material.dart';

class messengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://scontent.fcai20-4.fna.fbcdn.net/v/t1.6435-9/131038582_3532664946959245_4444823145987413321_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=174925&_nc_ohc=94N4lU9OPisAX_RdJ2p&_nc_ht=scontent.fcai20-4.fna&oh=7c49538283027be7ce59a851d06d2564&oe=60F02749'),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Chats',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          titleSpacing: 20.0,
          actions: [
            IconButton(
              icon: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.camera_alt,
                    size: 16.0,
                    color: Colors.white,
                  )),
              onPressed: () {},
            ),
            IconButton(
              icon: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.edit,
                    size: 16.0,
                    color: Colors.white,
                  )),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //search
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10.0),
                      Text('search')
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                //stories
                Container(
                  height: 95.0,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildStoryItem(),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: 10),
                ),
                SizedBox(
                  height: 20.0,
                ),

                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildChatItem(),
                    itemCount: 10),
              ],
            ),
          ),
        ));
  }
}

Widget buildStoryItem() => Column(
      children: [
        //image
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://scontent.fcai20-4.fna.fbcdn.net/v/t1.6435-9/129139322_2838546126390503_2878078425531866469_n.png?_nc_cat=1&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=s82tsmTKw9EAX-p4a4p&_nc_ht=scontent.fcai20-4.fna&oh=cb153258e81552f821035520db0bb314&oe=60F0888E'),
            ),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    CircleAvatar(
                      radius: 9.0,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 7.0,
                      backgroundColor: Colors.green,
                    ),
                  ],
                )),
          ],
        ),
        Container(
          width: 60,
          child: Text(
            'Ahmed Mahmoud Ahmed',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );

Widget buildChatItem() => Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://scontent.fcai20-4.fna.fbcdn.net/v/t1.6435-9/129139322_2838546126390503_2878078425531866469_n.png?_nc_cat=1&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=s82tsmTKw9EAX-p4a4p&_nc_ht=scontent.fcai20-4.fna&oh=cb153258e81552f821035520db0bb314&oe=60F0888E'),
              ),
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        radius: 9.0,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 7.0,
                        backgroundColor: Colors.green,
                      ),
                    ],
                  )),
            ],
          ),
        ),
        //user name
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed Mahmoud Ahmed ',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 3.0,
              ),
              Row(children: [
                //message text
                Expanded(
                  child: Text(
                    'An optional maximum number of lines for the text to span.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                //dot
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  width: 6.0,
                  height: 6.0,
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                ),
                Text('02:20 PM')
              ])
            ],
          ),
        )
      ],
    );
