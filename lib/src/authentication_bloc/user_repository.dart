import 'dart:async';
import 'dart:convert'; // for the utf8.encode method
import 'package:OilPos/src/common/general.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;
import 'package:pointycastle/digests/sha1.dart';

import 'package:meta/meta.dart';

import 'package:jose/jose.dart';

class UserRepository {
  var user;
  String token;
  String username;

  final GraphQLClient client = GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: 'http://127.0.0.1:3000/graphql/public'));

  String getJsonFromJWT(String splittedToken) {
    String normalizedSource = base64Url.normalize('MY_SECRET');
    print('normalizedSource = ' + normalizedSource.toString());
    print('base64Url.decode(normalizedSource) = ' +
        base64Url.decode(normalizedSource).toString());
    print('utf8.decode(base64Url.decode(normalizedSource)) = ' +
        utf8.decode(base64Url.decode(normalizedSource)).toString());
    return utf8.decode(base64Url.decode(normalizedSource));
  }

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    username = username;
    token = 'token';
    return token;
  }

  Future<String> signInWithCredentials(String email, String password) async {
    var bytes = utf8.encode(password); // data being hashed
    var sha1 = SHA1Digest();
    print('bytes = ' + bytes.toString());
    print('sha1 = ' + sha1.toString());
    var digest = sha1.process(bytes);
    print('digest = ' + digest.toString());
    var result = await http.post('http://127.0.0.1:3000/login',
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
            {'username': email, 'password': formatBytesAsHexString(digest)}));
    print('result.body = ' + result.body);
    print('json.decode(result.body) = ' + json.decode(result.body));
    var jsonResponse = json.decode(result.body);
    this.token = jsonResponse['token'];
    var claims = parseJwt(this.token);
    print('claims = ' + claims.toString());
    this.username = claims['sub'];
    return this.token;
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  Future<bool> isSignedIn() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return token == 'token';
  }

  getUser() {
    return {'username': this.username, 'token': this.token};
  }

  Future<bool> signOut() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    token = '';

    return true;
  }

  Future<List> signUp(String email, String firstName, String lastName,
      String idCard, String passport, String address) async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    token = '';

    return [email, firstName, lastName, idCard, passport, address];
  }
}
