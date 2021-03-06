part of 'tabs.dart';

class ListStore extends StatefulWidget {
  const ListStore({Key? key}) : super(key: key);

  @override
  _ListStoreState createState() => _ListStoreState();
}

class _ListStoreState extends State<ListStore> {
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VapestoreBloc(StoreService())..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: Text(
          'Vapestore',
          style: TextStyle(color: Colors.black),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              // SizedBox(height: 10,),
              Expanded(
                child: BlocBuilder<VapestoreBloc, VapestoreState>(
                  builder: (context, state) {
                    if (state is VapestoreInitial){
                      return Center(child: CircularProgressIndicator(strokeWidth: 5,),);
                    }else if (state is VapestoreLoaded){
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.store.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: ListTile(
                              title: Text(
                                  state.store[index].namatoko??"error"), //Text(StoreService().storeList[index].namatoko??"Title"),
                              leading: Image.network(state.store[index].imgurl??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzj3zuwqgcuIdnxN0PaGXlbTNgYadtrKmuMQ&usqp=CAU"),
                              // trailing: IconButton(
                              //   icon: Icon(Icons.star),
                              //   onPressed: () {},
                              // ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailStore(
                                              store: state.store[index],
                                            )));
                              },
                            ),
                          );
                        });
                    }
                    return Container();
                    
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
