// import 'package:finalproject/features/auth/domain/usecases/auth_usecase.dart';
// import 'package:finalproject/features/auth/presentation/navigator/dashboard_navigator.dart';
// import 'package:finalproject/features/auth/presentation/navigator/login_navigator.dart';
// import 'package:finalproject/features/auth/presentation/navigator/register_navigator.dart';
// import 'package:finalproject/features/auth/presentation/state/auth_state.dart';
// import 'package:finalproject/features/auth/presentation/viewmodel/auth_view_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'auth_test.mocks.dart';
//
// @GenerateNiceMocks([
//   MockSpec<AuthUseCase>(),
//   MockSpec<LoginViewNavigator>(),
//   MockSpec<RegisterViewNavigator>(),
//   MockSpec<DashboardViewNavigator>(),
// ])
// void main() {
//   late AuthUseCase mockAuthUseCase;
//   late LoginViewNavigator mockLoginViewNavigator;
//   late RegisterViewNavigator mockRegisterViewNavigator;
//   late DashboardViewNavigator mockDashboardViewNavigator;
//
//   late ProviderContainer container;
//
//   setUp(() {
//     mockAuthUseCase = MockAuthUseCase();
//     mockLoginViewNavigator = MockLoginViewNavigator();
//     mockRegisterViewNavigator = MockRegisterViewNavigator();
//     mockDashboardViewNavigator = MockDashboardViewNavigator();
//
//     TestWidgetsFlutterBinding.ensureInitialized();
//
//     container = ProviderContainer(
//       overrides: [
//         authViewModelProvider.overrideWith(
//               (ref) => AuthViewModel(
//             mockDashboardViewNavigator,
//             mockRegisterViewNavigator,
//             mockLoginViewNavigator,
//             mockAuthUseCase,
//           ),
//         ),
//       ],
//     );
//   });
//
//   tearDown(() {
//     container.dispose();
//   });
//
//   test('Initial state is AuthState.initial()', () {
//     final viewModel = container.read(authViewModelProvider);
//     expect(viewModel, AuthState.initial());
//   });
//
//   // Add more tests to cover different scenarios
// }
