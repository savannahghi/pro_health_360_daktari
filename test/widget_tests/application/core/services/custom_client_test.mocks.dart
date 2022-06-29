// Mocks generated by Mockito 5.1.0 from annotations
// in prohealth360_daktari/test/widget_tests/application/core/services/custom_client_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:convert' as _i2;
import 'dart:typed_data' as _i5;

import 'package:http/http.dart' as _i4;
import 'package:http/src/base_request.dart' as _i7;
import 'package:http/src/byte_stream.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEncoding_0 extends _i1.Fake implements _i2.Encoding {}

class _FakeUri_1 extends _i1.Fake implements Uri {}

class _FakeByteStream_2 extends _i1.Fake implements _i3.ByteStream {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

class _FakeResponse_4 extends _i1.Fake implements _i4.Response {}

/// A class which mocks [Request].
///
/// See the documentation for Mockito's code generation for more information.
class MockRequest extends _i1.Mock implements _i4.Request {
  MockRequest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get contentLength =>
      (super.noSuchMethod(Invocation.getter(#contentLength), returnValue: 0)
          as int);
  @override
  set contentLength(int? value) =>
      super.noSuchMethod(Invocation.setter(#contentLength, value),
          returnValueForMissingStub: null);
  @override
  _i2.Encoding get encoding => (super.noSuchMethod(Invocation.getter(#encoding),
      returnValue: _FakeEncoding_0()) as _i2.Encoding);
  @override
  set encoding(_i2.Encoding? value) =>
      super.noSuchMethod(Invocation.setter(#encoding, value),
          returnValueForMissingStub: null);
  @override
  _i5.Uint8List get bodyBytes =>
      (super.noSuchMethod(Invocation.getter(#bodyBytes),
          returnValue: _i5.Uint8List(0)) as _i5.Uint8List);
  @override
  set bodyBytes(List<int>? value) =>
      super.noSuchMethod(Invocation.setter(#bodyBytes, value),
          returnValueForMissingStub: null);
  @override
  String get body =>
      (super.noSuchMethod(Invocation.getter(#body), returnValue: '') as String);
  @override
  set body(String? value) => super.noSuchMethod(Invocation.setter(#body, value),
      returnValueForMissingStub: null);
  @override
  Map<String, String> get bodyFields =>
      (super.noSuchMethod(Invocation.getter(#bodyFields),
          returnValue: <String, String>{}) as Map<String, String>);
  @override
  set bodyFields(Map<String, String>? fields) =>
      super.noSuchMethod(Invocation.setter(#bodyFields, fields),
          returnValueForMissingStub: null);
  @override
  String get method =>
      (super.noSuchMethod(Invocation.getter(#method), returnValue: '')
          as String);
  @override
  Uri get url =>
      (super.noSuchMethod(Invocation.getter(#url), returnValue: _FakeUri_1())
          as Uri);
  @override
  Map<String, String> get headers =>
      (super.noSuchMethod(Invocation.getter(#headers),
          returnValue: <String, String>{}) as Map<String, String>);
  @override
  bool get persistentConnection =>
      (super.noSuchMethod(Invocation.getter(#persistentConnection),
          returnValue: false) as bool);
  @override
  set persistentConnection(bool? value) =>
      super.noSuchMethod(Invocation.setter(#persistentConnection, value),
          returnValueForMissingStub: null);
  @override
  bool get followRedirects => (super
          .noSuchMethod(Invocation.getter(#followRedirects), returnValue: false)
      as bool);
  @override
  set followRedirects(bool? value) =>
      super.noSuchMethod(Invocation.setter(#followRedirects, value),
          returnValueForMissingStub: null);
  @override
  int get maxRedirects =>
      (super.noSuchMethod(Invocation.getter(#maxRedirects), returnValue: 0)
          as int);
  @override
  set maxRedirects(int? value) =>
      super.noSuchMethod(Invocation.setter(#maxRedirects, value),
          returnValueForMissingStub: null);
  @override
  bool get finalized =>
      (super.noSuchMethod(Invocation.getter(#finalized), returnValue: false)
          as bool);
  @override
  _i3.ByteStream finalize() =>
      (super.noSuchMethod(Invocation.method(#finalize, []),
          returnValue: _FakeByteStream_2()) as _i3.ByteStream);
  @override
  _i6.Future<_i4.StreamedResponse> send() =>
      (super.noSuchMethod(Invocation.method(#send, []),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i6.Future<_i4.StreamedResponse>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i4.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i2.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i5.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i5.Uint8List>.value(_i5.Uint8List(0)))
          as _i6.Future<_i5.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i7.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
