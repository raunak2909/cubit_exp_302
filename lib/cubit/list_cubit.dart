import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_state.dart';

class ListCubit extends Cubit<ListState>{
  ListCubit() : super(ListState(mData: [])); ///initial state

  ///[
  /// {},
  /// {},
  ///]

  ///events
  void addMap(Map<String, dynamic> newMap){
    List<Map<String, dynamic>> currentData = state.mData;
    currentData.add(newMap);
    emit(ListState(mData: currentData));
  }

  void updateMap(Map<String, dynamic> updatedData, int index){
    List<Map<String, dynamic>> currentData = state.mData;
    currentData[index] = updatedData;
    emit(ListState(mData: currentData));
  }

  void deleteMap(int index){
    List<Map<String, dynamic>> currentData = state.mData;
    currentData.removeAt(index);
    emit(ListState(mData: currentData));
  }

}