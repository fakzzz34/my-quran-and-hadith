import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../modules/error_page/views/error_page_view.dart';

const String baseQuranUrl = 'https://api.quran.gading.dev';
const String baseHadithUrl = 'https://api.hadith.gading.dev';

class ApiProvider {
  final Dio _dioQuran = Dio(
    BaseOptions(
        baseUrl: baseQuranUrl,
        headers: {"Accept": "application/json"},
        connectTimeout: const Duration(minutes: 1), // 60 seconds
        receiveTimeout: const Duration(minutes: 1) // 60 seconds
        ),
  );

  final Dio _dioHadith = Dio(
    BaseOptions(
        baseUrl: baseHadithUrl,
        headers: {"Accept": "application/json"},
        connectTimeout: const Duration(minutes: 1), // 60 seconds
        receiveTimeout: const Duration(minutes: 1) // 60 seconds
        ),
  );

  ApiProvider init() {
    initializeInterceptors();

    return this;
  }

  void initializeInterceptors() {
    _dioQuran.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // You can add headers or modify the request here if needed
        return handler.next(options); // continue
      },
      onResponse: (response, handler) {
        return handler.next(response); // continue
      },
      onError: (DioException e, handler) async {
        // Handle errors
        String errorMessage = await _handleError(e);
        _navigateToErrorPage(errorMessage);
        return handler.next(e); // continue
      },
    ));

    _dioHadith.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // You can add headers or modify the request here if needed
        return handler.next(options); // continue
      },
      onResponse: (response, handler) {
        return handler.next(response); // continue
      },
      onError: (DioException e, handler) async {
        // Handle errors
        String errorMessage = await _handleError(e);
        _navigateToErrorPage(errorMessage);
        return handler.next(e); // continue
      },
    ));
  }

  Future<String> _handleError(DioException e) async {
    String errorMessage;

    // Check for internet connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult
        .any((element) => element == ConnectivityResult.none)) {
      errorMessage = "No internet connection. Please check your settings.";
    } else {
      // Handle different error types
      switch (e.type) {
        case DioExceptionType.cancel:
          errorMessage = "Request to API server was cancelled.";
          break;
        case DioExceptionType.connectionTimeout:
          errorMessage = "Connection timeout with the server.";
          break;
        case DioExceptionType.sendTimeout:
          errorMessage = "Send timeout in connection with API server.";
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = "Receive timeout in connection with API server.";
          break;
        case DioExceptionType.badResponse:
          // Handle specific HTTP status codes
          switch (e.response?.statusCode) {
            case 400:
              errorMessage = "Bad request. Please try again.";
              break;
            case 401:
              errorMessage = "Unauthorized. Please log in again.";
              break;
            case 403:
              errorMessage =
                  "Forbidden. You don't have access to this resource.";
              break;
            case 404:
              errorMessage = "Not found. The resource could not be found.";
              break;
            case 500:
              errorMessage = "Internal server error. Please try again later.";
              break;
            default:
              errorMessage = "Unexpected error occurred. Please try again.";
          }
          break;
        case DioExceptionType.badCertificate:
          errorMessage =
              "Bad certificate. Please check your SSL configuration.";
          break;
        case DioExceptionType.connectionError:
          errorMessage = "Connection error. Please check your network.";
          break;
        case DioExceptionType.unknown:
          errorMessage = "An unexpected error occurred. Please try again.";
          break;
      }
    }

    return errorMessage;
  }

  void _navigateToErrorPage(String errorMessage) {
    // Use GetX to navigate to the error page
    getx.Get.to(() => ErrorPageView(message: errorMessage));
  }

  //  QURAN
  Future<Response> listSurah() => _dioQuran.get('/surah');

  Future<Response> detailSurah(int surah) => _dioQuran.get('/surah/$surah');

  Future<Response> detailJuz(int juz) => _dioQuran.get('/juz/$juz');

  // HADITH

  Future<Response> listBook() => _dioHadith.get('/books');

  Future<Response> hadithRange(String name, int start, int end) =>
      _dioHadith.get(
        '/books/$name',
        queryParameters: {'range': '$start-$end'},
      );

  Future<Response> detailHadith(String name, int hadith) =>
      _dioHadith.get('/books/$name/$hadith');
}
