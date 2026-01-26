import 'package:base/base.dart';

class GetCreatedTasksPage<T> implements BasePage<T> {
  @override
  final T page;

  @override
  final int pageSize;
  
  GetCreatedTasksPage({required this.page, required this.pageSize,});
}
