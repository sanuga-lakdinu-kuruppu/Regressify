import 'package:flutter/material.dart';

class CreatedModelInDetailsPage extends StatefulWidget {
  const CreatedModelInDetailsPage({super.key});

  @override
  State<CreatedModelInDetailsPage> createState() =>
      _CreatedModelInDetailsPageState();
}

class _CreatedModelInDetailsPageState extends State<CreatedModelInDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Icon(
            Icons.leaderboard,
            color: Colors.teal,
          ),
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.teal, // border color
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3), // border width
              child: Container(
                // or ClipRRect if you need to clip the content
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent, // inner circle color
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ), // inner content
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, right: 25.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?pid=ImgDet&rs=1')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://th.bing.com/th/id/OIP.E0yEvGDqXof63L66vR1r3AHaEK?pid=ImgDet&rs=1'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 35),
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Final Result',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal)),
                        Text('The model you have created',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.teal)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0,
                              offset: Offset(0, 4),
                              blurRadius: 2,
                              color: Colors.grey)
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('y = f(x) = wx + b',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lets make some predictins',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0,
                              offset: Offset(0, 4),
                              blurRadius: 2,
                              color: Colors.grey)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
