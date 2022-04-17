import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/albums_bloc/albums_bloc.dart';
import 'package:test_app/screens/album_list_screen/album_pre_item.dart';
import 'package:test_app/screens/album_list_screen/albums_screen.dart';
import 'package:test_app/screens/user_details_screen/components/header_btn.dart';

class UserAlbums extends StatelessWidget {
  const UserAlbums({ Key? key, required this.userId }) : super(key: key);
  final int userId;
  @override
  Widget build(BuildContext context) {
    final AlbumsBloc albumsBloc = BlocProvider.of<AlbumsBloc>(context);
    albumsBloc.add(GetAlbumsEvent(userId: userId));
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: BlocBuilder<AlbumsBloc, AlbumsState>(
      builder: (context, state) {
      if (state is AlbumsInitial) {
      return const SizedBox();
        }

        if (state is LoadingAlbumsState) {
      return const Center(child: CircularProgressIndicator());
        }
        if (state is LoadedAlbumsState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            const Text('Albums:', style: TextStyle(fontSize: 20, color: Color(0xFF522e23), fontWeight: FontWeight.bold),),
            const Spacer(),
             HeaderButton(
               onTap:(){
               Navigator.push(context, MaterialPageRoute(builder: (context) => const AlbumsScreen()));
             } ,text: 'View all...',)
          ],
        ),
      ),
          Row(children: [
                    Expanded(child: AlbumPreviewItem(album: state.albumsList![0])),
                    Expanded(child: AlbumPreviewItem(album: state.albumsList![1])),
                    Expanded(child: AlbumPreviewItem(album: state.albumsList![2])),
                  ],),
        ],
      );
        }

        if (state is ErrorLoadAlbumsState) {
      return const Center(child: Center(child: Text('')));
        }
        return const SizedBox();
      }),
    );
  }
}
