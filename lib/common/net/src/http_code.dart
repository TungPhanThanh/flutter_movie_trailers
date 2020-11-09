part of net;

/// Server response
const int successful = 200;
const int unauthorized = 401;
const int forbidden = 403; // The server understood the request but refuses to authorize it
const int authentication_required = 407; // Proxy authentication required
const int internal_server_error = 500;
const int service_unavailable = 503;

/// Client Response
const int net_error = 1000;
const int parse_error = 1001;
const int socket_error = 1002;
const int http_error = 1003;
const int timeout_error = 1004;
const int cancel_error = 1005;
const int force_logout = 1006;
const int client_unknown_error = 9999;