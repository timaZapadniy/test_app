import 'package:animated_image_list/AnimatedImageList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/photos_bloc/photos_bloc.dart';
import 'package:test_app/model/album.dart';

class AlbumDetails extends StatelessWidget {
  const AlbumDetails({Key? key, required this.album}) : super(key: key);
  final Album album;
  @override
  Widget build(BuildContext context) {
    final PhotosBloc photosBloc = BlocProvider.of<PhotosBloc>(context);
    photosBloc.add(GetPhotosEvent(albumId: album.id));
    return Scaffold(
      appBar: AppBar(title: Text('${album.title}'),),
      body: BlocBuilder<PhotosBloc, PhotosState>(builder: (context, state) {
        if (state is PhotosInitial) {
          return const SizedBox();
        }

        if (state is LoadingPhotosState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LoadedPhotosState) {
          return AnimatedImageList(
            images: state.photosList!.map((e) => e.url.toString()).toList(),
            builder: (context, index, progress) {
              return Positioned.directional(
                  textDirection: TextDirection.ltr,
                  bottom: 15,
                  start: 25,
                  child: Opacity(
                    opacity: progress > 1 ? (2 - progress) : progress,
                    child: Text(
                      state.photosList![index].title ?? 'No title',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ));
            },
            scrollDirection: Axis.vertical,
            itemExtent: 100,
            maxExtent: 400,
          );
        }

        if (state is ErrorLoadPhotosState) {
          return const Center(child: Center(child: Text('')));
        }
        return const SizedBox();
      }),
    );
  }
}
