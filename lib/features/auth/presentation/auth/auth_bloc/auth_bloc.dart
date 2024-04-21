import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>(_onAuthOLoginEvent);
  }

  _onAuthOLoginEvent(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    if (event.login == "chelovekpauk@gmail.com" && event.password == "12345678") {
      emit(const AuthLoaded());
    } else {
      emit(const AuthError("Неправильный логин или пароль"));
    }
  }
}
