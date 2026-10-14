/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../apps/app_data_endpoint.dart' as _iz501qtj;
import '../apps/app_endpoint.dart' as _i6a3eul5;
import '../apps/share_endpoint.dart' as _izifs5t1;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../greetings/greeting_endpoint.dart' as _il624ik7;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'appData': _iz501qtj.AppDataEndpoint()
        ..initialize(
          server,
          'appData',
          null,
        ),
      'app': _i6a3eul5.AppEndpoint()
        ..initialize(
          server,
          'app',
          null,
        ),
      'share': _izifs5t1.ShareEndpoint()
        ..initialize(
          server,
          'share',
          null,
        ),
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'greeting': _il624ik7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['appData'] = _is.EndpointConnector(
      name: 'appData',
      endpoint: endpoints['appData']!,
      methodConnectors: {
        'putData': _is.MethodConnector(
          name: 'putData',
          params: {
            'appId': _is.ParameterDescription(
              name: 'appId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'dataKey': _is.ParameterDescription(
              name: 'dataKey',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'dataValue': _is.ParameterDescription(
              name: 'dataValue',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['appData'] as _iz501qtj.AppDataEndpoint).putData(
                    session,
                    appId: params['appId'],
                    dataKey: params['dataKey'],
                    dataValue: params['dataValue'],
                  ),
        ),
        'getData': _is.MethodConnector(
          name: 'getData',
          params: {
            'appId': _is.ParameterDescription(
              name: 'appId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'dataKey': _is.ParameterDescription(
              name: 'dataKey',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['appData'] as _iz501qtj.AppDataEndpoint).getData(
                    session,
                    appId: params['appId'],
                    dataKey: params['dataKey'],
                  ),
        ),
        'getAllData': _is.MethodConnector(
          name: 'getAllData',
          params: {
            'appId': _is.ParameterDescription(
              name: 'appId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['appData'] as _iz501qtj.AppDataEndpoint)
                  .getAllData(
                    session,
                    params['appId'],
                  ),
        ),
        'deleteData': _is.MethodConnector(
          name: 'deleteData',
          params: {
            'appId': _is.ParameterDescription(
              name: 'appId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'dataKey': _is.ParameterDescription(
              name: 'dataKey',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['appData'] as _iz501qtj.AppDataEndpoint)
                  .deleteData(
                    session,
                    appId: params['appId'],
                    dataKey: params['dataKey'],
                  ),
        ),
      },
    );
    connectors['app'] = _is.EndpointConnector(
      name: 'app',
      endpoint: endpoints['app']!,
      methodConnectors: {
        'createApp': _is.MethodConnector(
          name: 'createApp',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'uiDefinition': _is.ParameterDescription(
              name: 'uiDefinition',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i6a3eul5.AppEndpoint).createApp(
                session,
                name: params['name'],
                description: params['description'],
                uiDefinition: params['uiDefinition'],
              ),
        ),
        'listMyApps': _is.MethodConnector(
          name: 'listMyApps',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i6a3eul5.AppEndpoint).listMyApps(
                session,
              ),
        ),
        'getApp': _is.MethodConnector(
          name: 'getApp',
          params: {
            'appId': _is.ParameterDescription(
              name: 'appId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i6a3eul5.AppEndpoint).getApp(
                session,
                params['appId'],
              ),
        ),
        'updateApp': _is.MethodConnector(
          name: 'updateApp',
          params: {
            'appId': _is.ParameterDescription(
              name: 'appId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'uiDefinition': _is.ParameterDescription(
              name: 'uiDefinition',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'isPublished': _is.ParameterDescription(
              name: 'isPublished',
              type: _is.getType<bool?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i6a3eul5.AppEndpoint).updateApp(
                session,
                appId: params['appId'],
                name: params['name'],
                description: params['description'],
                uiDefinition: params['uiDefinition'],
                isPublished: params['isPublished'],
              ),
        ),
        'deleteApp': _is.MethodConnector(
          name: 'deleteApp',
          params: {
            'appId': _is.ParameterDescription(
              name: 'appId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i6a3eul5.AppEndpoint).deleteApp(
                session,
                params['appId'],
              ),
        ),
        'listPublished': _is.MethodConnector(
          name: 'listPublished',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i6a3eul5.AppEndpoint)
                  .listPublished(session),
        ),
      },
    );
    connectors['share'] = _is.EndpointConnector(
      name: 'share',
      endpoint: endpoints['share']!,
      methodConnectors: {
        'createMagicLink': _is.MethodConnector(
          name: 'createMagicLink',
          params: {
            'appId': _is.ParameterDescription(
              name: 'appId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'validDays': _is.ParameterDescription(
              name: 'validDays',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['share'] as _izifs5t1.ShareEndpoint)
                  .createMagicLink(
                    session,
                    appId: params['appId'],
                    validDays: params['validDays'],
                  ),
        ),
        'openWithMagicLink': _is.MethodConnector(
          name: 'openWithMagicLink',
          params: {
            'token': _is.ParameterDescription(
              name: 'token',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['share'] as _izifs5t1.ShareEndpoint)
                  .openWithMagicLink(
                    session,
                    params['token'],
                  ),
        ),
        'revokeMagicLink': _is.MethodConnector(
          name: 'revokeMagicLink',
          params: {
            'token': _is.ParameterDescription(
              name: 'token',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['share'] as _izifs5t1.ShareEndpoint)
                  .revokeMagicLink(
                    session,
                    params['token'],
                  ),
        ),
      },
    );
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['greeting'] = _is.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['greeting'] as _il624ik7.GreetingEndpoint).hello(
                    session,
                    params['name'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeEndpoints(server);
  }
}
