package js.npm.nodefetch;

import haxe.extern.EitherType;
import js.node.Url;
import js.node.http.Agent;
import js.npm.nodefetch.Body;
import js.npm.nodefetch.Headers;

@:jsRequire("node-fetch", "Request")
extern class Request extends Body {
    function new(input:RequestInfo, ?init:RequestInit);
    final follow:Int;
    final compress:Bool;
    final counter:Int;
    final agent:Null<EitherType<Agent, (parsedUrl:Url)->Agent>>;
    final method:String;
    final url:String;
    final headers:Headers;
    final redirect:RequestRedirect;
    final signal:Null<AbortSignal>;
    function clone():Request;
}

typedef RequestInit = {
    var ?method:String;
    var ?body:BodyInit;
    var ?timeout:Int;
    var ?size:Int;
    var ?headers:HeadersInit;
    var ?redirect:RequestRedirect;
    var ?signal:AbortSignal;
    var ?follow:Int;
    var ?compress:Bool;
    var ?counter:Int;
    var ?agent:EitherType<Agent, (parsedUrl:Url) -> Agent>;
}

typedef RequestInfo = EitherType<String, EitherType<URLLike, Request>>;

typedef URLLike = {
    var href:String;
}

enum abstract RequestRedirect(String) {
    var Error = "error";
    var Follow = "follow";
    var Manual = "manual";
}
