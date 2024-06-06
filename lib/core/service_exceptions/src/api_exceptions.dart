import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../exceptions.dart';

part 'api_exceptions.freezed.dart';

@freezed
class ApiExceptions with _$ApiExceptions {
  const factory ApiExceptions.requestCancelled() = RequestCancelled;

  const factory ApiExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory ApiExceptions.badRequest() = BadRequest;

  const factory ApiExceptions.errorResponse({required String error}) =
      ErrorResponse;

  const factory ApiExceptions.notFound(String reason) = NotFound;

  const factory ApiExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory ApiExceptions.notAcceptable() = NotAcceptable;

  const factory ApiExceptions.requestTimeout() = RequestTimeout;

  const factory ApiExceptions.sendTimeout() = SendTimeout;

  const factory ApiExceptions.conflict() = Conflict;

  const factory ApiExceptions.internalServerError() = InternalServerError;

  const factory ApiExceptions.notImplemented() = NotImplemented;

  const factory ApiExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory ApiExceptions.noInternetConnection() = NoInternetConnection;

  const factory ApiExceptions.formatException() = FormatException;

  const factory ApiExceptions.unableToProcess() = UnableToProcess;

  const factory ApiExceptions.defaultError(String error) = DefaultError;

  const factory ApiExceptions.unexpectedError() = UnexpectedError;

  const factory ApiExceptions.serverException() = ServerError;

  const factory ApiExceptions.cacheException() = CacheError;

  const factory ApiExceptions.fireBaseAuthException(String error) =
      FireBaseAuthError;

  ///[getDioException] will be used on the reposiroty implementation.
  static ApiExceptions? getDioException(error) {
    if (error is Exception) {
      try {
        ApiExceptions? networkExceptions;
        if (error is FirebaseException) {
          networkExceptions = ApiExceptions.fireBaseAuthException(
              error.message ?? 'Firebase error');
        }

        if (error is SocketException) {
          networkExceptions = const ApiExceptions.noInternetConnection();
        } else if (error is ServerException) {
          networkExceptions = const ApiExceptions.serverException();
        } else if (error is CacheException) {
          networkExceptions = const ApiExceptions.cacheException();
        } else {
          networkExceptions = const ApiExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException {
        // Helper.printError(e.toString());
        return const ApiExceptions.formatException();
      } catch (_) {
        return const ApiExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains('Is not a subtype of')) {
        return const ApiExceptions.unableToProcess();
      } else {
        return const ApiExceptions.unexpectedError();
      }
    }
  }

  // ignore: lines_longer_than_80_chars
  ///[getErrormessage] will be used in the presentation layer most preferbly in the logic folder where the SM leaves in..
  static String getErrorMessage(ApiExceptions apiExceptions) {
    var errorMessage = '';
    apiExceptions.when(
      notImplemented: () {
        errorMessage = 'Not Implemented';
      },
      requestCancelled: () {
        errorMessage = 'Request Cancelled';
      },
      internalServerError: () {
        errorMessage = 'Internal Server Error';
      },
      notFound: (String reason) {
        errorMessage = reason;
      },
      serviceUnavailable: () {
        errorMessage = 'Service unavailable';
      },
      methodNotAllowed: () {
        errorMessage = 'Method Allowed';
      },
      badRequest: () {
        errorMessage = 'Bad request';
      },
      unauthorisedRequest: () {
        errorMessage = 'Unauthorised request';
      },
      unexpectedError: () {
        errorMessage = 'Unexpected error occurred';
      },
      requestTimeout: () {
        errorMessage = 'Connection request timeout';
      },
      noInternetConnection: () {
        errorMessage = 'No internet connection';
      },
      conflict: () {
        errorMessage = 'Error due to a conflict';
      },
      sendTimeout: () {
        errorMessage = 'Send timeout in connection with API server';
      },
      unableToProcess: () {
        errorMessage = 'Unable to process the data';
      },
      defaultError: (String error) {
        errorMessage = error;
      },
      errorResponse: (String error) {
        errorMessage = error;
      },
      formatException: () {
        errorMessage = 'Unexpected error occurred.';
      },
      serverException: () {
        errorMessage =
            'Unexpected error occurred trying to connect with server';
      },
      cacheException: () {
        errorMessage =
            'Unexpected error occurred trying to access local storage';
      },
      notAcceptable: () {
        errorMessage = 'Not acceptable';
      },
      fireBaseAuthException: (String error) {
        errorMessage = error;
      },
    );
    return errorMessage;
  }
}

extension ApiError on ApiExceptions {
  String get message => ApiExceptions.getErrorMessage(this);
}
