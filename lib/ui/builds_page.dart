import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:mon/model/build_entity.dart';
import 'package:mon/store/state/app_state.dart';
import 'package:mon/ui/widget/loading_widget.dart';

class BuildsPage extends StatefulWidget {
  @override
  createState() {
    return BuildsState();
  }
}

class BuildsState extends State<BuildsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Store<AppState> _store;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_store == null) {
      _store = StoreProvider.of<AppState>(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text('mon'),
          ),
          key: _scaffoldKey,
          body: StoreConnector(
              converter: _ViewModel.fromStore,
              builder: (context, viewModel) {
                var list = viewModel.builds;
                return ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      return _buildRow(list[i], viewModel);
                    });
              }),
        ),
        LoadingWidget(),
      ],
    );
  }

  Widget _buildRow(BuildEntity entity, _ViewModel viewModel) {
    return Container(
      key: ObjectKey(entity.reponame),
      child: Column(
        children: <Widget>[
          ListTile(
              title: Text(
                "#${entity.buildNum}: ${entity.username} / ${entity.reponame}",
                style: _biggerFont,
              ),
              subtitle: Text(entity.subject)
            ),
          Divider(),
        ],
      ),
    );
  }
}

class _ViewModel {
  final bool loading;
  final List<BuildEntity> builds;

  _ViewModel({@required this.loading, @required this.builds});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        loading: store.state.isLoading,
        builds: store.state.builds
      );
  }

  @override
  int get hashCode => loading.hashCode ^ builds.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel && runtimeType == other.runtimeType && loading == other.loading && builds == other.builds;
}
