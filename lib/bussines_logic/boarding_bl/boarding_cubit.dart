import 'package:bloc/bloc.dart';
import 'package:firstapp_fiftychanllenge/data/models/slider_model.dart';
import 'package:meta/meta.dart';

part 'boarding_state.dart';

class BoardingCubit extends Cubit<BoardingState> {
  BoardingCubit() : super(BoardingInitial());
  final boardList = SliderModel.sliderList;
  int pos = 0;
  void pageChanged(int index) {
    pos = index;
    emit(PageChangedState());

  }

  int back() {
    if (pos>0) {
      pos--;
      emit(PageChangedState());
    }
    return pos;
  }

  int next() {
    print(pos);
    if (pos<boardList.length-1) {
      pos++;
      emit(PageChangedState());
    }
    return pos;
  }
}
