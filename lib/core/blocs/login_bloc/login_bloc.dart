import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {

    on<Login>((event, emit) {
      emit(state.copyWith( isLogged: event.isLogged ));
    });

    on<OpenLogin>((event, emit) {
      emit(state.copyWith( openLogin: event.openLogin ));
    });

    on<ChangeNameLogin>((event, emit) {
      emit(state.copyWith( name: event.name ));
    });

    on<ChangePasswordLogin>((event, emit) {
      emit(state.copyWith( password: event.password ));
    });

    on<LogOut>((event, emit) {
      emit(state.copyWith( name: event.name, password: event.password ));
    });

  }

  login() {
    bool exito = false;
    switch (state.name) {
      case 'maria':
        if (state.password == 'password') {
          exito = true;
        } else {
          exito = false;
        }
        break;
      case 'pedro':
        if (state.password == '123456') {
          exito = true;
        } else {
          exito = false;
        }
        break;
      default: exito = false;
    }
    return exito;
  }

  logout() {
    add( Login(false) );
    add( OpenLogin(false));
    add( LogOut(name: '', password: '') );
  }

  initDB() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'userDb.db');

    Database dataBase = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE User(
            userLogged INTEGER
          )
          '''
        );
      }
    );
  }
  

}
