import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:flutter/material.dart';

class ListLaunchesWidget extends StatelessWidget {
  final List<Launch> _launches;

  ListLaunchesWidget(this._launches);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: _launches == null || _launches.isEmpty
          ? _EmptyListWidget()
          : ListView.builder(
              itemCount: _launches.length,
              itemBuilder: (context, index) {
                var launch = _launches[index];

                return Card(
                  key: Key(launch.id),
                  clipBehavior: Clip.hardEdge,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(launch.patchImageSmall),
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            launch.name,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class _EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
