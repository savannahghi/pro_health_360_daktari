// Mocks generated by Mockito 5.2.0 from annotations
// in prohealth360_daktari/test/unit_tests/application/redux/actions/communities/delete_group_action_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:dio/dio.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stream_chat/stream_chat.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeStreamChatClient_0 extends _i1.Fake implements _i2.StreamChatClient {
}

class _FakeSendMessageResponse_1 extends _i1.Fake
    implements _i2.SendMessageResponse {}

class _FakeUpdateMessageResponse_2 extends _i1.Fake
    implements _i2.UpdateMessageResponse {}

class _FakeEmptyResponse_3 extends _i1.Fake implements _i2.EmptyResponse {}

class _FakeSendFileResponse_4 extends _i1.Fake implements _i2.SendFileResponse {
}

class _FakeSendImageResponse_5 extends _i1.Fake
    implements _i2.SendImageResponse {}

class _FakeSearchMessagesResponse_6 extends _i1.Fake
    implements _i2.SearchMessagesResponse {}

class _FakeSendReactionResponse_7 extends _i1.Fake
    implements _i2.SendReactionResponse {}

class _FakePartialUpdateChannelResponse_8 extends _i1.Fake
    implements _i2.PartialUpdateChannelResponse {}

class _FakeUpdateChannelResponse_9 extends _i1.Fake
    implements _i2.UpdateChannelResponse {}

class _FakeAcceptInviteResponse_10 extends _i1.Fake
    implements _i2.AcceptInviteResponse {}

class _FakeRejectInviteResponse_11 extends _i1.Fake
    implements _i2.RejectInviteResponse {}

class _FakeAddMembersResponse_12 extends _i1.Fake
    implements _i2.AddMembersResponse {}

class _FakeInviteMembersResponse_13 extends _i1.Fake
    implements _i2.InviteMembersResponse {}

class _FakeRemoveMembersResponse_14 extends _i1.Fake
    implements _i2.RemoveMembersResponse {}

class _FakeSendActionResponse_15 extends _i1.Fake
    implements _i2.SendActionResponse {}

class _FakeChannelState_16 extends _i1.Fake implements _i2.ChannelState {}

class _FakeQueryRepliesResponse_17 extends _i1.Fake
    implements _i2.QueryRepliesResponse {}

class _FakeQueryReactionsResponse_18 extends _i1.Fake
    implements _i2.QueryReactionsResponse {}

class _FakeGetMessagesByIdResponse_19 extends _i1.Fake
    implements _i2.GetMessagesByIdResponse {}

class _FakeTranslateMessageResponse_20 extends _i1.Fake
    implements _i2.TranslateMessageResponse {}

class _FakeQueryMembersResponse_21 extends _i1.Fake
    implements _i2.QueryMembersResponse {}

class _FakeQueryBannedUsersResponse_22 extends _i1.Fake
    implements _i2.QueryBannedUsersResponse {}

/// A class which mocks [Channel].
///
/// See the documentation for Mockito's code generation for more information.
class MockChannel extends _i1.Mock implements _i2.Channel {
  MockChannel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set state(_i2.ChannelClientState? _state) =>
      super.noSuchMethod(Invocation.setter(#state, _state),
          returnValueForMissingStub: null);
  @override
  set cooldownStartedAt(DateTime? _cooldownStartedAt) => super.noSuchMethod(
      Invocation.setter(#cooldownStartedAt, _cooldownStartedAt),
      returnValueForMissingStub: null);
  @override
  set name(String? name) => super.noSuchMethod(Invocation.setter(#name, name),
      returnValueForMissingStub: null);
  @override
  set image(String? image) =>
      super.noSuchMethod(Invocation.setter(#image, image),
          returnValueForMissingStub: null);
  @override
  set extraData(Map<String, Object?>? extraData) =>
      super.noSuchMethod(Invocation.setter(#extraData, extraData),
          returnValueForMissingStub: null);
  @override
  bool get isMuted =>
      (super.noSuchMethod(Invocation.getter(#isMuted), returnValue: false)
          as bool);
  @override
  _i3.Stream<bool> get isMutedStream =>
      (super.noSuchMethod(Invocation.getter(#isMutedStream),
          returnValue: Stream<bool>.empty()) as _i3.Stream<bool>);
  @override
  bool get isGroup =>
      (super.noSuchMethod(Invocation.getter(#isGroup), returnValue: false)
          as bool);
  @override
  bool get isDistinct =>
      (super.noSuchMethod(Invocation.getter(#isDistinct), returnValue: false)
          as bool);
  @override
  _i3.Stream<_i2.ChannelConfig?> get configStream =>
      (super.noSuchMethod(Invocation.getter(#configStream),
              returnValue: Stream<_i2.ChannelConfig?>.empty())
          as _i3.Stream<_i2.ChannelConfig?>);
  @override
  _i3.Stream<_i2.Member?> get membershipStream =>
      (super.noSuchMethod(Invocation.getter(#membershipStream),
          returnValue: Stream<_i2.Member?>.empty()) as _i3.Stream<_i2.Member?>);
  @override
  _i3.Stream<_i2.User?> get createdByStream =>
      (super.noSuchMethod(Invocation.getter(#createdByStream),
          returnValue: Stream<_i2.User?>.empty()) as _i3.Stream<_i2.User?>);
  @override
  bool get frozen =>
      (super.noSuchMethod(Invocation.getter(#frozen), returnValue: false)
          as bool);
  @override
  _i3.Stream<bool> get frozenStream =>
      (super.noSuchMethod(Invocation.getter(#frozenStream),
          returnValue: Stream<bool>.empty()) as _i3.Stream<bool>);
  @override
  bool get disabled =>
      (super.noSuchMethod(Invocation.getter(#disabled), returnValue: false)
          as bool);
  @override
  _i3.Stream<bool> get disabledStream =>
      (super.noSuchMethod(Invocation.getter(#disabledStream),
          returnValue: Stream<bool>.empty()) as _i3.Stream<bool>);
  @override
  bool get hidden =>
      (super.noSuchMethod(Invocation.getter(#hidden), returnValue: false)
          as bool);
  @override
  _i3.Stream<bool> get hiddenStream =>
      (super.noSuchMethod(Invocation.getter(#hiddenStream),
          returnValue: Stream<bool>.empty()) as _i3.Stream<bool>);
  @override
  _i3.Stream<DateTime?> get truncatedAtStream =>
      (super.noSuchMethod(Invocation.getter(#truncatedAtStream),
          returnValue: Stream<DateTime?>.empty()) as _i3.Stream<DateTime?>);
  @override
  int get cooldown =>
      (super.noSuchMethod(Invocation.getter(#cooldown), returnValue: 0) as int);
  @override
  _i3.Stream<int> get cooldownStream =>
      (super.noSuchMethod(Invocation.getter(#cooldownStream),
          returnValue: Stream<int>.empty()) as _i3.Stream<int>);
  @override
  _i3.Stream<DateTime?> get createdAtStream =>
      (super.noSuchMethod(Invocation.getter(#createdAtStream),
          returnValue: Stream<DateTime?>.empty()) as _i3.Stream<DateTime?>);
  @override
  _i3.Stream<DateTime?> get lastMessageAtStream =>
      (super.noSuchMethod(Invocation.getter(#lastMessageAtStream),
          returnValue: Stream<DateTime?>.empty()) as _i3.Stream<DateTime?>);
  @override
  _i3.Stream<DateTime?> get updatedAtStream =>
      (super.noSuchMethod(Invocation.getter(#updatedAtStream),
          returnValue: Stream<DateTime?>.empty()) as _i3.Stream<DateTime?>);
  @override
  _i3.Stream<DateTime?> get deletedAtStream =>
      (super.noSuchMethod(Invocation.getter(#deletedAtStream),
          returnValue: Stream<DateTime?>.empty()) as _i3.Stream<DateTime?>);
  @override
  _i3.Stream<int?> get memberCountStream =>
      (super.noSuchMethod(Invocation.getter(#memberCountStream),
          returnValue: Stream<int?>.empty()) as _i3.Stream<int?>);
  @override
  String get type =>
      (super.noSuchMethod(Invocation.getter(#type), returnValue: '') as String);
  @override
  Map<String, Object?> get extraData =>
      (super.noSuchMethod(Invocation.getter(#extraData),
          returnValue: <String, Object?>{}) as Map<String, Object?>);
  @override
  List<String> get ownCapabilities =>
      (super.noSuchMethod(Invocation.getter(#ownCapabilities),
          returnValue: <String>[]) as List<String>);
  @override
  _i3.Stream<List<String>> get ownCapabilitiesStream => (super.noSuchMethod(
      Invocation.getter(#ownCapabilitiesStream),
      returnValue: Stream<List<String>>.empty()) as _i3.Stream<List<String>>);
  @override
  _i3.Stream<Map<String, Object?>> get extraDataStream =>
      (super.noSuchMethod(Invocation.getter(#extraDataStream),
              returnValue: Stream<Map<String, Object?>>.empty())
          as _i3.Stream<Map<String, Object?>>);
  @override
  _i3.Stream<String?> get nameStream =>
      (super.noSuchMethod(Invocation.getter(#nameStream),
          returnValue: Stream<String?>.empty()) as _i3.Stream<String?>);
  @override
  _i3.Stream<String?> get imageStream =>
      (super.noSuchMethod(Invocation.getter(#imageStream),
          returnValue: Stream<String?>.empty()) as _i3.Stream<String?>);
  @override
  _i2.StreamChatClient get client =>
      (super.noSuchMethod(Invocation.getter(#client),
          returnValue: _FakeStreamChatClient_0()) as _i2.StreamChatClient);
  @override
  _i3.Future<bool> get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  void cancelAttachmentUpload(String? attachmentId, {String? reason}) =>
      super.noSuchMethod(
          Invocation.method(
              #cancelAttachmentUpload, [attachmentId], {#reason: reason}),
          returnValueForMissingStub: null);
  @override
  _i3.Future<void> retryAttachmentUpload(
          String? messageId, String? attachmentId) =>
      (super.noSuchMethod(
          Invocation.method(#retryAttachmentUpload, [messageId, attachmentId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<_i2.SendMessageResponse> sendMessage(_i2.Message? message,
          {bool? skipPush = false, bool? skipEnrichUrl = false}) =>
      (super.noSuchMethod(
              Invocation.method(#sendMessage, [message],
                  {#skipPush: skipPush, #skipEnrichUrl: skipEnrichUrl}),
              returnValue: Future<_i2.SendMessageResponse>.value(
                  _FakeSendMessageResponse_1()))
          as _i3.Future<_i2.SendMessageResponse>);
  @override
  _i3.Future<_i2.UpdateMessageResponse> updateMessage(_i2.Message? message,
          {bool? skipEnrichUrl = false}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #updateMessage, [message], {#skipEnrichUrl: skipEnrichUrl}),
              returnValue: Future<_i2.UpdateMessageResponse>.value(
                  _FakeUpdateMessageResponse_2()))
          as _i3.Future<_i2.UpdateMessageResponse>);
  @override
  _i3.Future<_i2.UpdateMessageResponse> partialUpdateMessage(
          _i2.Message? message,
          {Map<String, Object?>? set,
          List<String>? unset,
          bool? skipEnrichUrl = false}) =>
      (super.noSuchMethod(
              Invocation.method(#partialUpdateMessage, [message],
                  {#set: set, #unset: unset, #skipEnrichUrl: skipEnrichUrl}),
              returnValue: Future<_i2.UpdateMessageResponse>.value(
                  _FakeUpdateMessageResponse_2()))
          as _i3.Future<_i2.UpdateMessageResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> deleteMessage(_i2.Message? message,
          {bool? hard}) =>
      (super.noSuchMethod(
              Invocation.method(#deleteMessage, [message], {#hard: hard}),
              returnValue:
                  Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.UpdateMessageResponse> pinMessage(_i2.Message? message,
          {Object? timeoutOrExpirationDate}) =>
      (super.noSuchMethod(
              Invocation.method(#pinMessage, [message],
                  {#timeoutOrExpirationDate: timeoutOrExpirationDate}),
              returnValue: Future<_i2.UpdateMessageResponse>.value(
                  _FakeUpdateMessageResponse_2()))
          as _i3.Future<_i2.UpdateMessageResponse>);
  @override
  _i3.Future<_i2.UpdateMessageResponse> unpinMessage(_i2.Message? message) =>
      (super.noSuchMethod(Invocation.method(#unpinMessage, [message]),
              returnValue: Future<_i2.UpdateMessageResponse>.value(
                  _FakeUpdateMessageResponse_2()))
          as _i3.Future<_i2.UpdateMessageResponse>);
  @override
  _i3.Future<_i2.SendFileResponse> sendFile(_i2.AttachmentFile? file,
          {_i4.ProgressCallback? onSendProgress,
          _i4.CancelToken? cancelToken,
          Map<String, Object?>? extraData}) =>
      (super.noSuchMethod(
              Invocation.method(#sendFile, [
                file
              ], {
                #onSendProgress: onSendProgress,
                #cancelToken: cancelToken,
                #extraData: extraData
              }),
              returnValue:
                  Future<_i2.SendFileResponse>.value(_FakeSendFileResponse_4()))
          as _i3.Future<_i2.SendFileResponse>);
  @override
  _i3.Future<_i2.SendImageResponse> sendImage(_i2.AttachmentFile? file,
          {_i4.ProgressCallback? onSendProgress,
          _i4.CancelToken? cancelToken,
          Map<String, Object?>? extraData}) =>
      (super.noSuchMethod(
              Invocation.method(#sendImage, [
                file
              ], {
                #onSendProgress: onSendProgress,
                #cancelToken: cancelToken,
                #extraData: extraData
              }),
              returnValue: Future<_i2.SendImageResponse>.value(
                  _FakeSendImageResponse_5()))
          as _i3.Future<_i2.SendImageResponse>);
  @override
  _i3.Future<_i2.SearchMessagesResponse> search(
          {String? query,
          _i2.Filter? messageFilters,
          List<_i2.SortOption<dynamic>>? sort,
          _i2.PaginationParams? paginationParams}) =>
      (super.noSuchMethod(
              Invocation.method(#search, [], {
                #query: query,
                #messageFilters: messageFilters,
                #sort: sort,
                #paginationParams: paginationParams
              }),
              returnValue: Future<_i2.SearchMessagesResponse>.value(
                  _FakeSearchMessagesResponse_6()))
          as _i3.Future<_i2.SearchMessagesResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> deleteFile(String? url,
          {_i4.CancelToken? cancelToken, Map<String, Object?>? extraData}) =>
      (super.noSuchMethod(
              Invocation.method(#deleteFile, [url],
                  {#cancelToken: cancelToken, #extraData: extraData}),
              returnValue:
                  Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> deleteImage(String? url,
          {_i4.CancelToken? cancelToken, Map<String, Object?>? extraData}) =>
      (super.noSuchMethod(
              Invocation.method(#deleteImage, [url],
                  {#cancelToken: cancelToken, #extraData: extraData}),
              returnValue:
                  Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> sendEvent(_i2.Event? event) =>
      (super.noSuchMethod(Invocation.method(#sendEvent, [event]),
              returnValue:
                  Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.SendReactionResponse> sendReaction(
          _i2.Message? message, String? type,
          {int? score = 1,
          Map<String, Object?>? extraData = const {},
          bool? enforceUnique = false}) =>
      (super.noSuchMethod(
              Invocation.method(#sendReaction, [
                message,
                type
              ], {
                #score: score,
                #extraData: extraData,
                #enforceUnique: enforceUnique
              }),
              returnValue: Future<_i2.SendReactionResponse>.value(
                  _FakeSendReactionResponse_7()))
          as _i3.Future<_i2.SendReactionResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> deleteReaction(
          _i2.Message? message, _i2.Reaction? reaction) =>
      (super.noSuchMethod(
              Invocation.method(#deleteReaction, [message, reaction]),
              returnValue:
                  Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.PartialUpdateChannelResponse> updateName(String? name) =>
      (super.noSuchMethod(Invocation.method(#updateName, [name]),
              returnValue: Future<_i2.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_8()))
          as _i3.Future<_i2.PartialUpdateChannelResponse>);
  @override
  _i3.Future<_i2.PartialUpdateChannelResponse> updateImage(String? image) =>
      (super.noSuchMethod(Invocation.method(#updateImage, [image]),
              returnValue: Future<_i2.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_8()))
          as _i3.Future<_i2.PartialUpdateChannelResponse>);
  @override
  _i3.Future<_i2.UpdateChannelResponse> update(
          Map<String, Object?>? channelData,
          [_i2.Message? updateMessage]) =>
      (super.noSuchMethod(
              Invocation.method(#update, [channelData, updateMessage]),
              returnValue: Future<_i2.UpdateChannelResponse>.value(
                  _FakeUpdateChannelResponse_9()))
          as _i3.Future<_i2.UpdateChannelResponse>);
  @override
  _i3.Future<_i2.PartialUpdateChannelResponse> updatePartial(
          {Map<String, Object?>? set, List<String>? unset}) =>
      (super.noSuchMethod(
              Invocation.method(#updatePartial, [], {#set: set, #unset: unset}),
              returnValue: Future<_i2.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_8()))
          as _i3.Future<_i2.PartialUpdateChannelResponse>);
  @override
  _i3.Future<_i2.PartialUpdateChannelResponse> enableSlowMode(
          {int? cooldownInterval}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #enableSlowMode, [], {#cooldownInterval: cooldownInterval}),
              returnValue: Future<_i2.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_8()))
          as _i3.Future<_i2.PartialUpdateChannelResponse>);
  @override
  _i3.Future<_i2.PartialUpdateChannelResponse> disableSlowMode() =>
      (super.noSuchMethod(Invocation.method(#disableSlowMode, []),
              returnValue: Future<_i2.PartialUpdateChannelResponse>.value(
                  _FakePartialUpdateChannelResponse_8()))
          as _i3.Future<_i2.PartialUpdateChannelResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> delete() => (super.noSuchMethod(
          Invocation.method(#delete, []),
          returnValue: Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
      as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> truncate(
          {_i2.Message? message, bool? skipPush, DateTime? truncatedAt}) =>
      (super.noSuchMethod(
              Invocation.method(#truncate, [], {
                #message: message,
                #skipPush: skipPush,
                #truncatedAt: truncatedAt
              }),
              returnValue:
                  Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.AcceptInviteResponse> acceptInvite([_i2.Message? message]) =>
      (super.noSuchMethod(Invocation.method(#acceptInvite, [message]),
              returnValue: Future<_i2.AcceptInviteResponse>.value(
                  _FakeAcceptInviteResponse_10()))
          as _i3.Future<_i2.AcceptInviteResponse>);
  @override
  _i3.Future<_i2.RejectInviteResponse> rejectInvite([_i2.Message? message]) =>
      (super.noSuchMethod(Invocation.method(#rejectInvite, [message]),
              returnValue: Future<_i2.RejectInviteResponse>.value(
                  _FakeRejectInviteResponse_11()))
          as _i3.Future<_i2.RejectInviteResponse>);
  @override
  _i3.Future<_i2.AddMembersResponse> addMembers(List<String>? memberIds,
          [_i2.Message? message]) =>
      (super.noSuchMethod(Invocation.method(#addMembers, [memberIds, message]),
              returnValue: Future<_i2.AddMembersResponse>.value(
                  _FakeAddMembersResponse_12()))
          as _i3.Future<_i2.AddMembersResponse>);
  @override
  _i3.Future<_i2.InviteMembersResponse> inviteMembers(List<String>? memberIds,
          [_i2.Message? message]) =>
      (super.noSuchMethod(
              Invocation.method(#inviteMembers, [memberIds, message]),
              returnValue: Future<_i2.InviteMembersResponse>.value(
                  _FakeInviteMembersResponse_13()))
          as _i3.Future<_i2.InviteMembersResponse>);
  @override
  _i3.Future<_i2.RemoveMembersResponse> removeMembers(List<String>? memberIds,
          [_i2.Message? message]) =>
      (super.noSuchMethod(
              Invocation.method(#removeMembers, [memberIds, message]),
              returnValue: Future<_i2.RemoveMembersResponse>.value(
                  _FakeRemoveMembersResponse_14()))
          as _i3.Future<_i2.RemoveMembersResponse>);
  @override
  _i3.Future<_i2.SendActionResponse> sendAction(
          _i2.Message? message, Map<String, dynamic>? formData) =>
      (super.noSuchMethod(Invocation.method(#sendAction, [message, formData]),
              returnValue: Future<_i2.SendActionResponse>.value(
                  _FakeSendActionResponse_15()))
          as _i3.Future<_i2.SendActionResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> markRead({String? messageId}) => (super
      .noSuchMethod(Invocation.method(#markRead, [], {#messageId: messageId}),
          returnValue:
              Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3())) as _i3
      .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.ChannelState> watch() => (super.noSuchMethod(
          Invocation.method(#watch, []),
          returnValue: Future<_i2.ChannelState>.value(_FakeChannelState_16()))
      as _i3.Future<_i2.ChannelState>);
  @override
  _i3.Future<_i2.EmptyResponse> stopWatching() => (super.noSuchMethod(
          Invocation.method(#stopWatching, []),
          returnValue: Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
      as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.QueryRepliesResponse> getReplies(String? parentId,
          {_i2.PaginationParams? options, bool? preferOffline = false}) =>
      (super.noSuchMethod(
              Invocation.method(#getReplies, [parentId],
                  {#options: options, #preferOffline: preferOffline}),
              returnValue: Future<_i2.QueryRepliesResponse>.value(
                  _FakeQueryRepliesResponse_17()))
          as _i3.Future<_i2.QueryRepliesResponse>);
  @override
  _i3.Future<_i2.QueryReactionsResponse> getReactions(String? messageId,
          {_i2.PaginationParams? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getReactions, [messageId], {#pagination: pagination}),
              returnValue: Future<_i2.QueryReactionsResponse>.value(
                  _FakeQueryReactionsResponse_18()))
          as _i3.Future<_i2.QueryReactionsResponse>);
  @override
  _i3.Future<_i2.GetMessagesByIdResponse> getMessagesById(
          List<String>? messageIDs) =>
      (super.noSuchMethod(Invocation.method(#getMessagesById, [messageIDs]),
              returnValue: Future<_i2.GetMessagesByIdResponse>.value(
                  _FakeGetMessagesByIdResponse_19()))
          as _i3.Future<_i2.GetMessagesByIdResponse>);
  @override
  _i3.Future<_i2.TranslateMessageResponse> translateMessage(
          String? messageId, String? language) =>
      (super.noSuchMethod(
              Invocation.method(#translateMessage, [messageId, language]),
              returnValue: Future<_i2.TranslateMessageResponse>.value(
                  _FakeTranslateMessageResponse_20()))
          as _i3.Future<_i2.TranslateMessageResponse>);
  @override
  _i3.Future<_i2.ChannelState> create() => (super.noSuchMethod(
          Invocation.method(#create, []),
          returnValue: Future<_i2.ChannelState>.value(_FakeChannelState_16()))
      as _i3.Future<_i2.ChannelState>);
  @override
  _i3.Future<_i2.ChannelState> query(
          {bool? state = true,
          bool? watch = false,
          bool? presence = false,
          _i2.PaginationParams? messagesPagination,
          _i2.PaginationParams? membersPagination,
          _i2.PaginationParams? watchersPagination,
          bool? preferOffline = false}) =>
      (super.noSuchMethod(
              Invocation.method(#query, [], {
                #state: state,
                #watch: watch,
                #presence: presence,
                #messagesPagination: messagesPagination,
                #membersPagination: membersPagination,
                #watchersPagination: watchersPagination,
                #preferOffline: preferOffline
              }),
              returnValue:
                  Future<_i2.ChannelState>.value(_FakeChannelState_16()))
          as _i3.Future<_i2.ChannelState>);
  @override
  _i3.Future<_i2.QueryMembersResponse> queryMembers(
          {_i2.Filter? filter,
          List<_i2.SortOption<dynamic>>? sort,
          _i2.PaginationParams? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#queryMembers, [],
                  {#filter: filter, #sort: sort, #pagination: pagination}),
              returnValue: Future<_i2.QueryMembersResponse>.value(
                  _FakeQueryMembersResponse_21()))
          as _i3.Future<_i2.QueryMembersResponse>);
  @override
  _i3.Future<_i2.QueryBannedUsersResponse> queryBannedUsers(
          {_i2.Filter? filter,
          List<_i2.SortOption<dynamic>>? sort,
          _i2.PaginationParams? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#queryBannedUsers, [],
                  {#filter: filter, #sort: sort, #pagination: pagination}),
              returnValue: Future<_i2.QueryBannedUsersResponse>.value(
                  _FakeQueryBannedUsersResponse_22()))
          as _i3.Future<_i2.QueryBannedUsersResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> mute({Duration? expiration}) => (super
          .noSuchMethod(
              Invocation.method(#mute, [], {#expiration: expiration}),
              returnValue:
                  Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
      as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> unmute() => (super.noSuchMethod(
          Invocation.method(#unmute, []),
          returnValue: Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
      as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> banMember(
          String? userID, Map<String, dynamic>? options) =>
      (super.noSuchMethod(Invocation.method(#banMember, [userID, options]),
              returnValue:
                  Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> unbanMember(String? userID) =>
      (super.noSuchMethod(Invocation.method(#unbanMember, [userID]),
              returnValue:
                  Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> shadowBan(
          String? userID, Map<String, dynamic>? options) =>
      (super.noSuchMethod(Invocation.method(#shadowBan, [userID, options]),
              returnValue:
                  Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> removeShadowBan(String? userID) =>
      (super.noSuchMethod(Invocation.method(#removeShadowBan, [userID]),
              returnValue:
                  Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
          as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> hide({bool? clearHistory = false}) => (super
      .noSuchMethod(Invocation.method(#hide, [], {#clearHistory: clearHistory}),
          returnValue:
              Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3())) as _i3
      .Future<_i2.EmptyResponse>);
  @override
  _i3.Future<_i2.EmptyResponse> show() => (super.noSuchMethod(
          Invocation.method(#show, []),
          returnValue: Future<_i2.EmptyResponse>.value(_FakeEmptyResponse_3()))
      as _i3.Future<_i2.EmptyResponse>);
  @override
  _i3.Stream<_i2.Event> on(
          [String? eventType,
          String? eventType2,
          String? eventType3,
          String? eventType4]) =>
      (super.noSuchMethod(
          Invocation.method(
              #on, [eventType, eventType2, eventType3, eventType4]),
          returnValue: Stream<_i2.Event>.empty()) as _i3.Stream<_i2.Event>);
  @override
  _i3.Future<void> keyStroke([String? parentId]) =>
      (super.noSuchMethod(Invocation.method(#keyStroke, [parentId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> stopTyping([String? parentId]) =>
      (super.noSuchMethod(Invocation.method(#stopTyping, [parentId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}
