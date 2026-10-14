/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ripple_client/src/protocol/apps/app_data.dart' as _iuqtw8zp;
import 'package:ripple_client/src/protocol/apps/app_definition.dart'
    as _i6qgpz30;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'apps/app_data.dart' as _iochtstf;
import 'apps/app_definition.dart' as _i3dhxabv;
import 'apps/magic_link.dart' as _iavfvqqo;
import 'auth/otp_auth_exception.dart' as _ijxnwu0n;
import 'auth/otp_auth_reason.dart' as _imlz7ush;
import 'auth/otp_challenge.dart' as _izfoet1f;
import 'generate/generate_exception.dart' as _isag8fm2;
import 'generate/generate_reason.dart' as _iphkt5ei;
import 'greetings/greeting.dart' as _izw8z7ou;
export 'apps/app_data.dart';
export 'apps/app_definition.dart';
export 'apps/magic_link.dart';
export 'auth/otp_auth_exception.dart';
export 'auth/otp_auth_reason.dart';
export 'auth/otp_challenge.dart';
export 'generate/generate_exception.dart';
export 'generate/generate_reason.dart';
export 'greetings/greeting.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _iochtstf.AppData) {
      return _iochtstf.AppData.fromJson(data) as T;
    }
    if (t == _i3dhxabv.AppDefinition) {
      return _i3dhxabv.AppDefinition.fromJson(data) as T;
    }
    if (t == _iavfvqqo.MagicLink) {
      return _iavfvqqo.MagicLink.fromJson(data) as T;
    }
    if (t == _ijxnwu0n.OtpAuthException) {
      return _ijxnwu0n.OtpAuthException.fromJson(data) as T;
    }
    if (t == _imlz7ush.OtpAuthReason) {
      return _imlz7ush.OtpAuthReason.fromJson(data) as T;
    }
    if (t == _izfoet1f.OtpChallenge) {
      return _izfoet1f.OtpChallenge.fromJson(data) as T;
    }
    if (t == _isag8fm2.GenerateException) {
      return _isag8fm2.GenerateException.fromJson(data) as T;
    }
    if (t == _iphkt5ei.GenerateReason) {
      return _iphkt5ei.GenerateReason.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _isc.getType<_iochtstf.AppData?>()) {
      return (data != null ? _iochtstf.AppData.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i3dhxabv.AppDefinition?>()) {
      return (data != null ? _i3dhxabv.AppDefinition.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iavfvqqo.MagicLink?>()) {
      return (data != null ? _iavfvqqo.MagicLink.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ijxnwu0n.OtpAuthException?>()) {
      return (data != null ? _ijxnwu0n.OtpAuthException.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_imlz7ush.OtpAuthReason?>()) {
      return (data != null ? _imlz7ush.OtpAuthReason.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_izfoet1f.OtpChallenge?>()) {
      return (data != null ? _izfoet1f.OtpChallenge.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_isag8fm2.GenerateException?>()) {
      return (data != null ? _isag8fm2.GenerateException.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iphkt5ei.GenerateReason?>()) {
      return (data != null ? _iphkt5ei.GenerateReason.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == List<_iuqtw8zp.AppData>) {
      return (data as List)
              .map((e) => deserialize<_iuqtw8zp.AppData>(e))
              .toList()
          as T;
    }
    if (t == List<_i6qgpz30.AppDefinition>) {
      return (data as List)
              .map((e) => deserialize<_i6qgpz30.AppDefinition>(e))
              .toList()
          as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _iochtstf.AppData => 'AppData',
      _i3dhxabv.AppDefinition => 'AppDefinition',
      _iavfvqqo.MagicLink => 'MagicLink',
      _ijxnwu0n.OtpAuthException => 'OtpAuthException',
      _imlz7ush.OtpAuthReason => 'OtpAuthReason',
      _izfoet1f.OtpChallenge => 'OtpChallenge',
      _isag8fm2.GenerateException => 'GenerateException',
      _iphkt5ei.GenerateReason => 'GenerateReason',
      _izw8z7ou.Greeting => 'Greeting',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('ripple.', '');
    }

    switch (data) {
      case _iochtstf.AppData():
        return 'AppData';
      case _i3dhxabv.AppDefinition():
        return 'AppDefinition';
      case _iavfvqqo.MagicLink():
        return 'MagicLink';
      case _ijxnwu0n.OtpAuthException():
        return 'OtpAuthException';
      case _imlz7ush.OtpAuthReason():
        return 'OtpAuthReason';
      case _izfoet1f.OtpChallenge():
        return 'OtpChallenge';
      case _isag8fm2.GenerateException():
        return 'GenerateException';
      case _iphkt5ei.GenerateReason():
        return 'GenerateReason';
      case _izw8z7ou.Greeting():
        return 'Greeting';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AppData') {
      return deserialize<_iochtstf.AppData>(data['data']);
    }
    if (dataClassName == 'AppDefinition') {
      return deserialize<_i3dhxabv.AppDefinition>(data['data']);
    }
    if (dataClassName == 'MagicLink') {
      return deserialize<_iavfvqqo.MagicLink>(data['data']);
    }
    if (dataClassName == 'OtpAuthException') {
      return deserialize<_ijxnwu0n.OtpAuthException>(data['data']);
    }
    if (dataClassName == 'OtpAuthReason') {
      return deserialize<_imlz7ush.OtpAuthReason>(data['data']);
    }
    if (dataClassName == 'OtpChallenge') {
      return deserialize<_izfoet1f.OtpChallenge>(data['data']);
    }
    if (dataClassName == 'GenerateException') {
      return deserialize<_isag8fm2.GenerateException>(data['data']);
    }
    if (dataClassName == 'GenerateReason') {
      return deserialize<_iphkt5ei.GenerateReason>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('ripple', this);
    _iacc.Protocol().registerHostProtocol('ripple', this);
  }

  @override
  String getModuleName() => 'ripple';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
