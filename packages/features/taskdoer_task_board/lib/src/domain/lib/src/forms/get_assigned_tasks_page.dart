import 'package:base/base.dart';

class GetAssignedTasksPage<T> implements BasePage<T> {
  @override
  final T page;

  @override
  final int pageSize;

  GetAssignedTasksPage({required this.page, required this.pageSize,});
}
