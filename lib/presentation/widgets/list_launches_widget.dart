import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:flutter/material.dart';

class ListLaunchesWidget extends StatelessWidget {
  final List<Launch> _launches;
  final Function(Launch) _onTapLaunch;
  final Future<void> Function() _onRefresh;

  const ListLaunchesWidget(
      {List<Launch> launches,
      Function(Launch) onTapLaunch,
      Future<void> Function() onRefresh})
      : _launches = launches,
        _onTapLaunch = onTapLaunch,
        _onRefresh = onRefresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: _launches == null || _launches.isEmpty
          ? _EmptyListWidget()
          : RefreshIndicator(
              onRefresh: _onRefresh,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: _launches.length,
                itemBuilder: (context, index) {
                  final launch = _launches[index];

                  return InkWell(
                    onTap: () => _onTapLaunch(launch),
                    child: Card(
                      key: Key(launch.id),
                      clipBehavior: Clip.antiAlias,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image(
                                image: NetworkImage(launch.patchImageSmall),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                launch.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class _EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }
}
