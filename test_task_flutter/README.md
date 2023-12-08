# test_task_flutter

Flutter project based on the test task.
Provides information about users, which it get from API using Dio and Retrofit.
App supports multiple states, like: data loading, data is loaded, errors occured, app is offline, using Bloc.
Also, to prevent empty screen when user don't have internet connection, users info is cached at local storage using Hive.

Stack: Clean, bloc, dio, retrofit, hive.
