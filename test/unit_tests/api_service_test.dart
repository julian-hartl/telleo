import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:telleo/config.dart';
import 'package:telleo/data/services/telleo_api_service.dart';
import 'package:telleo/domain/core/gateways/api_gateway.dart';
import 'package:telleo/domain/core/services/api_service/api_service.dart';
import 'package:telleo/domain/core/services/logger.dart';
import 'package:telleo/domain/core/services/token_service/token_service.dart';
import 'package:telleo/utils/dependencies.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([ApiGateway, TokenService, ILogger])
void main() {
  late ApiService sut;
  late MockApiGateway apiGateway;
  late MockTokenService tokenService;
  late MockILogger mockLogger;
  setUpAll(() {
    configureDependenices();
  });
  setUp(() {
    apiGateway = MockApiGateway();
    tokenService = MockTokenService();
    mockLogger = MockILogger();
    sut = TelleoApiService(apiGateway, tokenService, mockLogger);
  });
  group('ApiService', () {
    group('POST', () {
      test(
        'it should get a new access token when an error code of 205 is returned and then use that new access token to make the request again',
        () async {
          const refreshToken = 'hPFOnLQfmlbkSHawpHVD';

          final accessTokens = [
            'hPFOnLQfmlbwewwkSHawpHVD',
            'hPFOnLQfmlbwewwkSHawpHVD',
            'hPFOnLQfmlbwewwkSHawpHVDweweww'
          ];
          final compareableAccessTokens = List.from(accessTokens);

          const path = '/auth/v1/something';
          const requestBody = {
            'test': 'Hello',
          };
          final responses = [
            {'error': true, 'message': 'Expired access token', 'code': 205},
            {'error': false, 'accessToken': compareableAccessTokens[2]},
            {'error': false, 'message': 'hello'},
          ];
          final compareableResponses = List.from(responses);

          final headers = [
            {
              'authorization': 'BEARER ${accessTokens[0]}',
              'Content-Type': 'application/json',
            },
            {
              'authorization': 'BEARER ${accessTokens[2]}',
              'Content-Type': 'application/json',
            }
          ];
          final compareableHeaders = List.from(headers);

          when(tokenService.getRefreshToken())
              .thenAnswer((_) async => refreshToken);
          when(tokenService.storeAccessToken(any))
              .thenAnswer((_) async => true);
          when(tokenService.getAccessToken())
              .thenAnswer((_) async => accessTokens.removeAt(0));
          when(apiGateway.post(
                  body: anyNamed('body'),
                  endpoint: anyNamed('endpoint'),
                  header: anyNamed('header')))
              .thenAnswer((_) async => responses.removeAt(0));

          final result = await sut.post(path: path, data: requestBody);

          expect(result, equals(right(compareableResponses[2])));

          verifyInOrder([
            tokenService.getAccessToken(),
            apiGateway.post(
              endpoint: Config.backendUrl + path,
              body: requestBody,
              header: compareableHeaders[0],
            ),
            tokenService.getRefreshToken(),
            tokenService.getAccessToken(),
            apiGateway.post(
              endpoint: Config.backendUrl + '/auth/v1/token',
              body: {
                'refreshToken': refreshToken,
              },
              header: compareableHeaders[0],
            ),
            tokenService.storeAccessToken(compareableAccessTokens[2]),
            tokenService.getAccessToken(),
            apiGateway.post(
              endpoint: Config.backendUrl + path,
              body: requestBody,
              header: compareableHeaders[1],
            ),
          ]);
        },
      );
    });
    /*
    group('RefreshAccessToken()', () {
      test(
        'it should get the current refresh token, make a POST request to auth/v1/token, get the returned access token and store it in local storage',
        () async {
          const refreshToken = 'hPFOnLQfmlbkSHawpHVD';
          const accessToken = 'hPFOnLQfmlbwewwkSHawpHVD';

          when(tokenService.getRefreshToken())
              .thenAnswer((_) async => refreshToken);

          when(
            apiGateway.post(
              endpoint: anyNamed('endpoint'),
              body: anyNamed('body'),
              header: anyNamed('header'),
            ),
          ).thenAnswer(
            (_) async => {
              'error': false,
              'accessToken': accessToken,
            },
          );

          when(tokenService.storeAccessToken(any))
              .thenAnswer((_) async => true);

          final result = await sut.refreshAccessToken();
          verifyInOrder([
            tokenService.getRefreshToken(),
            apiGateway.post(
              endpoint: Config.apiUrl + '/auth/v1/token',
              body: {
                'refreshToken': refreshToken,
              },
              header: any,
            ),
            tokenService.storeAccessToken(accessToken),
          ]);
        },
      );
    });
    */
  });
}
