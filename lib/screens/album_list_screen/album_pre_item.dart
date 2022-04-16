import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/photos_bloc/photos_bloc.dart';
import 'package:test_app/model/album.dart';

class AlbumPreviewItem extends StatelessWidget {
  const AlbumPreviewItem({Key? key, required this.album}) : super(key: key);
  final Album album;
  @override
  Widget build(BuildContext context) {
    final PhotosBloc photosBloc = BlocProvider.of<PhotosBloc>(context);
    photosBloc.add(GetPhotosEvent(albumId: album.id));
    return Expanded(
      child: Padding(
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
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserDetails(user: user,)));
            },
            child: SizedBox(
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
                          child: Image.network('${state.photosList![0].thumbnailUrl}'),
                        );
                      }

                      if (state is ErrorLoadPhotosState) {
                        return const Center(child: Center(child: Text('')));
                      }
                      return const SizedBox();
                    }),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '${album.title}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
