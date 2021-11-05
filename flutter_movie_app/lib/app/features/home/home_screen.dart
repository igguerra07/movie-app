import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/constants/api_constants.dart';
import 'package:flutter_movie_app/app/di/get_it.dart';
import 'package:flutter_movie_app/app/features/home/cubit/home_cubit.dart';
import 'package:flutter_movie_app/app/features/home/cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  final HomeCubit _homeCubit = getIt();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MovieApp")),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit..getTrending(),
         builder: (context, state) {
           if(state is HomeLoadingState) {
             return const Center(child: CircularProgressIndicator());
           }
           if(state is HomeSuccessState) {
             return ListView.builder(
               shrinkWrap: true,
               itemCount: state.movies.length,
               itemBuilder: (context, index) => Container(
                 padding: const EdgeInsets.all(16),
                 child: Column(
                   children: [
                     SizedBox(
                       height: 120,
                       width: 80,
                       child: Image.network("${ApiConstants.baseImgUrl}/${state.movies[index].posterPath}"),
                     ),
                     const SizedBox(height: 8),
                     Text(
                       state.movies[index].title,
                       style: const TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 18
                       ),
                     ),
                     const SizedBox(height: 8),
                     Text(state.movies[index].overview),
                   ],
                 ),
               )
             );
           }
           if(state is HomeFailureState) {
             return const Center(child: Text("Deu bad"));
           }
           return const SizedBox.shrink();
         },
      )
    );
  }
}
