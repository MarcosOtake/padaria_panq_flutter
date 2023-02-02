/* import 'package:cargomais/core/dto/response-model.dart';
import 'package:cargomais/core/storage/database/abstractions/repository-command-abstract.dart';
import 'package:cargomais/core/storage/database/hive/repository-base-hive.dart';


abstract class RespositoryCommandHive<T> extends  RespositoryCommandAbstract<T>{

    ///Propertiers
    final BaseBoxHive _db;

    ///Construtor
    RespositoryCommandHive(this._db);

    @override
    Future<ResponseModel<T>> save(T object) async {

        var responseModel = ResponseModel<T>();
      
        if (this._db.boxIsClosed) {
            responseModel.error = true;
            responseModel.message = "Closed box";
            return responseModel;
        }

        return responseModel;
    }

    Future<void> insert(T object);

    Future<void> update(T object);

} */
