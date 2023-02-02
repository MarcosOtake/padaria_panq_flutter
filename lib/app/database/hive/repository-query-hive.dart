/* import 'package:cargomais/core/storage/database/abstractions/repository-query-abstract.dart';
import 'package:cargomais/core/storage/database/hive/repository-base-hive.dart';


abstract class RespositoryQueryHive<T> implements RespositoryQueryAbstract<T>{

    ///Propertiers
    final BaseBoxHive _db;

    ///Construtor
    RespositoryQueryHive(this._db);

    @override
    Future<T> find(dynamic id) async {
        
        if (this._db.boxIsClosed) {
            return null;
        }

        return this._db.box.get(id);
    }

} */
