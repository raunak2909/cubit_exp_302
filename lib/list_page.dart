import 'package:cubit_exp_302/cubit/list_cubit.dart';
import 'package:cubit_exp_302/cubit/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List with Cubit'),
      ),
      body: BlocBuilder<ListCubit, ListState>(
        builder: (_, state){
          List<Map<String, dynamic>> data = state.mData;

          return data.isNotEmpty ? ListView.builder(
            itemCount: data.length,
              itemBuilder: (_, index){

              return ListTile(
                title: Text(data[index]['name']),
                subtitle: Text(data[index]['mobNo']),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        context.read<ListCubit>().updateMap({
                          "name" : "Updated Contact",
                          "mobNo" : "7777888877"
                        }, index);
                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: (){
                        context.read<ListCubit>().deleteMap(index);
                      }, icon: Icon(Icons.delete_outlined), color: Colors.red,),
                    ],
                  ),
                ),
              );

          }) : Center(
            child: Text('No Data Found!!'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(
           appBar: AppBar(
             title: Text('Add Note'),
           ),
           body: Center(
             child: ElevatedButton(
               onPressed: (){
                 context.read<ListCubit>().addMap({
                   "name" : "Abhishek",
                   "mobNo" : "9747246735"
                 });
                 Navigator.pop(context);
               },
               child: Text('Add'),
             ),
           ),
         ),));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
