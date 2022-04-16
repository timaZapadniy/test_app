import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/albums_bloc/albums_bloc.dart';
import 'package:test_app/screens/album_list_screen/album_pre_item.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums'),),
      body: BlocBuilder<AlbumsBloc, AlbumsState>(builder: (context, state) {
        if (state is AlbumsInitial) {
          return const SizedBox();
        }

        if (state is LoadingAlbumsState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LoadedAlbumsState) {
          return Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: state.albumsList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < state.albumsList!.length) {
                      return Center(
                        child: AlbumPreviewItem(
                          album: state.albumsList![index],
                        ),
                      );
                    } else {
                      return //Shimmer.fromColors(child:
                          Card(
                        color: Colors.purple[100],
                        child: Center(child: Container()),
                      );
                      //baseColor: Colors.transparent, highlightColor: Colors.white);

                    }
                  }));
        }

        if (state is ErrorLoadAlbumsState) {
          return const Center(child: Center(child: Text('')));
        }
        return const SizedBox();
      }),
    );
  }
}
