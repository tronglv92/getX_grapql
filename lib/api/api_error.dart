import 'dart:async';

import 'package:get_grapql_master/models/response/error_response.dart';
import 'package:get_grapql_master/shared/utils/app_log.dart';





mixin ApiError {
  /// This function was called when trigger safeCallApi
  /// and apiError = true as default
  Future<int> onApiError(dynamic error);

  /// Call api safety with error handling.
  /// Required:
  /// - dioApi: call async dio function
  /// Optional:
  /// - onStart: the function executed before api, can be null
  /// - onError: the function executed in case api crashed, can be null
  /// - onCompleted: the function executed after api or before crashing, can be null
  /// - onFinally: the function executed end of function, can be null
  /// - skipOnError: false as default if you want to forward the error to onApiError
  Future<T?> apiCallSafety<T>(
      Future<T> Function() dioApi, {
        Future<void> Function()? onStart,
        Future<void> Function(dynamic error)? onError,
        Future<void> Function(bool status, T? res)? onCompleted,
        Future<void> Function()? onFinally,
        bool skipOnError = false,
      }) async {
    try {
      /// On start, use for show loading
      if (onStart != null) {
        await onStart();
      }

      /// Execute api
      final T res = await dioApi();

      /// On completed, use for hide loading
      if (onCompleted != null) {
        await onCompleted(true, res);
      }

      /// Return api response
      return res;
    } catch (error) {
      /// In case error:
      /// On completed, use for hide loading
      if (onCompleted != null) {

        await onCompleted(false, null);
      }

      /// On inline error
      if (onError != null) {
        await onError(error);
      }

      /// Call onApiError
      if (skipOnError == false) {
        onApiError(error);
      }

      return null;
    } finally {
      /// Call finally function
      if (onFinally != null) {
        await onFinally();
      }
    }
  }
  ErrorResponse parseApiErrorType(dynamic error) {
    if (error is ErrorResponse) {
      return error;
    }
    else
    {
      logPretty.e('error ',error);
    }

    return ErrorResponse();
  }

}