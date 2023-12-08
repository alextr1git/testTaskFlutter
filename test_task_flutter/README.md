# test_task_flutter

Flutter project based on a test task. It retrieves information about users from an API using Dio and Retrofit.
The app supports multiple states, such as data loading, data is loaded, errors occurred, and the app is offline, using Bloc. 
Additionally, to prevent an empty screen when the user doesn't have an internet connection, user information is cached locally using Hive.

Stack: Clean, bloc, dio, retrofit, hive.
