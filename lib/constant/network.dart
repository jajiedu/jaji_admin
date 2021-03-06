/// socket constant value
//https://shinrojp-server.herokuapp.com
const String basURL = 'http://192.168.1.101:3000';
//const String basURL = 'https://jaloserver.herokuapp.com';
const String nameSpase = '/game-namespace';
const String default_ns = '/';
const String china_word_ns = '/china_word_ns';
const String vocabulary_ns = '/vocabulary_ns';
const String grammar_ns = '/grammar_ns';
const String bearer = 'Bearer';

//default evenst of socket io

const String connect = 'connect';
const String connect_error = 'connect_error';
const String connect_timeout = 'connect_timeout';
const String connecting = 'connecting';
const String disconnect = 'disconnect';
const String error = 'error';
const String reconnect = 'reconnect';
const String reconnect_attempt = 'reconnect_attempt';
const String reconnect_failed = 'reconnect_failed';
const String reconnect_error = 'reconnect_error';
const String reconnecting = 'reconnecting';
const String ping = 'ping';
const String pong = 'pong';

///additton
const String message = 'message';
const String client_send_message = 'client_send_message';
const String server_send_message = 'server_send_message';
const String start_game = 'start_game';
const String server_send_rooms = 'server_send_rooms';
const String client_get_rooms = 'client_get_rooms';
const String join_room = 'join_room';
const String creat_room = 'creat_room';
const String server_send_room = 'server_send_room';
const String leave = 'leave';
const String joined_room = 'joined_room';
const String ready = 'ready';
const String get_client_in_room = 'get_client_in_room';
const String send_client_in_room = 'send_client_in_room';
const String get_quizzes = 'get_quizzes';
const String send_quizzes = 'send_quizzes';
const String check_answer = 'check_answer';
const String next_question = 'next_question';
const String update_room = 'update_room';
const String add_friends = 'add_friends';

const create_socket_private = 'create_socket_private';
const invite_into = 'invite_into';
//event test

const String get_room = 'get_room';
const String check_info_room = 'check_info_room';
const String result_check_room = 'result_check_room';
