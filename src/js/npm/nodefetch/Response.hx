package js.npm.nodefetch;

import js.npm.nodefetch.Body;
import js.npm.nodefetch.Headers;

@:jsRequire("node-fetch", "Response")
extern class Response extends Body {
    function new(?body:BodyInit, ?init:ResponseInit);
    final url:String;
    final status:Int;
    final ok:Bool;
    final redirected:Bool;
    final statusText:String;
    final headers:Headers;
    function clone():Response;
}

typedef ResponseInit = {
    var ?url:String;
    var ?status:Int;
    var ?statusText:String;
    var ?headers:HeadersInit;
    var ?counter:Int;
}
