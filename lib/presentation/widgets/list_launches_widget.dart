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
                      borderRadius: BorderRadius.circular(2)),
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Column(
                    children: [
                      Image(
                        image: NetworkImage(launch.patchImageSmall),
                        fit: BoxFit.fill,
                      ),
                      Text(launch.name)
                    ],
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
