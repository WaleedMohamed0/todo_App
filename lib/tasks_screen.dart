import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/add_task.dart';
import 'package:todo/task.dart';

class TasksScreen extends StatelessWidget {
  double business = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: Drawer(
          backgroundColor: HexColor('101e52'),
          child: Container(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      margin: const EdgeInsets.only(right: 17),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: HexColor('101e52'),
                        boxShadow: [
                          const BoxShadow(color: Colors.grey, spreadRadius: 1),
                        ],
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.only(left: 7),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    )),
                Container(
                  height: 100,
                  width: 166,
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green,width: 2.3),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/myPhoto.jpg'),
                    ),

                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35),
                  width: 200,
                  child: const Text(
                    'Waleed Mohamed',
                    style: TextStyle(
                      letterSpacing: 1.1,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: DrawerItems(context),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: HexColor('f9fafe'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey[600]),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What\'s Up, Joy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'CATEGORIES',
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('40 Tasks'),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Business',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SliderTheme(
                          data: const SliderThemeData(
                            thumbColor: Colors.purple,
                            activeTrackColor: Colors.purple,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 7),
                          ),
                          child: Slider(
                              value: business,
                              min: 0,
                              max: 100,
                              onChanged: (x) {}),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('18 Tasks'),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Personal',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SliderTheme(
                          data: const SliderThemeData(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 7),
                          ),
                          child: Slider(
                              value: business,
                              min: 0,
                              max: 100,
                              onChanged: (x) {}),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'TODAY\'S TASKS',
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Tasks(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTask()),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}

Widget DrawerItems(context) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.temple_buddhist_outlined,
                color: Colors.white,
              ),
              label: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Templates',
                  style: TextStyle(color: Colors.grey[400], fontSize: 18),
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.category_outlined,
                color: Colors.white,
              ),
              label: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  'Categories',
                  style: TextStyle(color: Colors.grey[400], fontSize: 18),
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.analytics_outlined,
                color: Colors.white,
              ),
              label: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  'Analytics',
                  style: TextStyle(color: Colors.grey[400], fontSize: 18),
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
              onPressed: () {},
              icon: Container(
                margin: const EdgeInsets.only(right: 18),
                child: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
              ),
              label: Text(
                'Settings',
                style: TextStyle(color: Colors.grey[300], fontSize: 18),
              )),
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                const Text(
                  'Consistency',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
