String extractCookieSession(List<String> setCookieHeader) {
  String sessionCookie = '';
  for (String cookie in setCookieHeader) {
    if (cookie.trim().startsWith('connect.sid=') &&
        cookie.trim().endsWith(';')) {
      String cookieValue = cookie.substring(cookie.indexOf('=') + 1);

      String decodeCookieValue = Uri.decodeComponent(cookieValue);
      sessionCookie = decodeCookieValue;

      break;
    }
  }

  return sessionCookie;
}
