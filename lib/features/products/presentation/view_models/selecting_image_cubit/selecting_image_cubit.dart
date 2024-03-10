import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selecting_image_state.dart';

class SelectingImageCubit extends Cubit<SelectingImageState> {
  SelectingImageCubit() : super(SelectingImageInitial());
}
