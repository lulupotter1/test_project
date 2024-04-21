import 'package:global_test_project/core/app/app_injection.dart';
import 'package:global_test_project/features/auth/presentation/auth/auth_bloc/auth_bloc.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/blocs/profile_bloc/profile_bloc.dart';
import 'package:global_test_project/features/auth/presentation/main_screen/blocs/transaction_bloc/transaction_bloc.dart';

class CoreBlocs {
  static final transaction = sl.get<TransactionBloc>();
  static final auth = sl.get<AuthBloc>();
  static final profile = sl.get<ProfileBloc>();
}
