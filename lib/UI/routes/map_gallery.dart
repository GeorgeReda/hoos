import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoos/UI/routes/error_screen.dart';
import 'package:hoos/UTH/blocs/map_bloc/map_bloc.dart';
import 'package:hoos/constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class MapGallery extends StatelessWidget {
  MapGallery({Key key, @required this.title}) : super(key: key);
  final String title;

  final MapBloc _bloc = MapBloc();
  @override
  Widget build(BuildContext context) {
    _bloc.add(OnMapOpen());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
        title: Text(title, style: Theme.of(context).textTheme.headline6,),
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is MapInitial)
            return Constants.circularProgressIndicator;
          else if (state is MapFailure)
            return ErrorScreen(error: state.error);
          else if (state is MapDone)
            return PhotoViewGallery.builder(
              itemCount: state.data.length,
              enableRotation: false,
              scrollPhysics: BouncingScrollPhysics(),
              backgroundDecoration: BoxDecoration(color: Colors.transparent),
              loadFailedChild: ErrorScreen(error: 'حدث خطأ في إيجاد الصورة'),
              loadingBuilder: (context, event) =>
                  Constants.circularProgressIndicator,
              builder: (context, index) => PhotoViewGalleryPageOptions(
                // Todo: change with file image
                //* uncomment this line
                // imageProvider: FileImage(state.data[index]['image']),
                imageProvider: AssetImage(state.data[index]),
                heroAttributes: PhotoViewHeroAttributes(
                    tag: 'map $index', transitionOnUserGestures: true),
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
              ),
            );
          return Container();
        },
      ),
    );
  }
}
