import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/photos_bloc/photos_bloc.dart';
import 'package:test_app/model/album.dart';
import 'package:test_app/screens/album_details_screen/album_details.dart';

class AlbumPreviewItem extends StatelessWidget {
  const AlbumPreviewItem({Key? key, required this.album}) : super(key: key);
  final Album album;
  @override
  Widget build(BuildContext context) {
    final PhotosBloc photosBloc = BlocProvider.of<PhotosBloc>(context);
    photosBloc.add(GetPhotosEvent(albumId: album.id));
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 4, right: 4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF522e23)),
          borderRadius: BorderRadius.circular(10),
          color: Colors.brown[200],
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 3,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) =>  AlbumDetails(album: album,)));
          },
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<PhotosBloc, PhotosState>(
                      builder: (context, state) {
                    if (state is PhotosInitial) {
                      return const SizedBox();
                    }

                    if (state is LoadingPhotosState) {
                      return const Center(
                          child: CircularProgressIndicator());
                    }
                    if (state is LoadedPhotosState) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Center(child: Image.network('${state.photosList![0].thumbnailUrl}',fit: BoxFit.contain,)),
                      );
                    }

                    if (state is ErrorLoadPhotosState) {
                      return const Center(child: Center(child: Text('')));
                    }
                    return const SizedBox();
                  }),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      height: 30,
                      child: Text(
                        '${album.title}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
