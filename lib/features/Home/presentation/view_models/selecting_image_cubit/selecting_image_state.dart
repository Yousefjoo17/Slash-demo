part of 'selecting_image_cubit.dart';

@immutable
sealed class SelectingImageState {}

final class SelectingImageInitial extends SelectingImageState {}

final class SelectingImage extends SelectingImageState {
  final int currIndex;
  SelectingImage({required this.currIndex});
}

