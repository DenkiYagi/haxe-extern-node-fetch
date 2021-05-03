package js.npm;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import js.lib.ArrayBuffer;
import js.lib.ArrayBufferView;
import js.lib.Promise;
import js.node.Buffer;
import js.node.http.Agent;
import js.node.stream.Readable;
import js.node.url.URL;
import js.node.url.URLSearchParams;
import js.npm.FormData;

@:jsRequire("node-fetch")
extern class NodeFetch {
    @:selfCall
    static function fetch(url:RequestInfo, ?init:RequestInit):Promise<Response>;
    static function isRedirect(code:Int):Bool;
}

@:jsRequire("node-fetch", "Request")
extern class Request extends Body {
    function new(input:RequestInfo, ?init:RequestInit);
    final context:RequestContext;
    final headers:Headers;
    final method:String;
    final redirect:RequestRedirect;
    final referrer:String;
    final url:String;
    final agent:Null<EitherType<Agent, (parsedUrl:URL)->Agent>>;
    final compress:Bool;
    final counter:Int;
    final follow:Int;
    final hostname:String;
    final port:Null<Int>;
    final protocol:String;
    function clone():Request;
}

typedef RequestInit = {
    var ?body:BodyInit;
    var ?headers:HeadersInit;
    var ?method:String;
    var ?redirect:RequestRedirect;
    var ?signal:AbortSignal;
    var ?agent:EitherType<Agent, (parsedUrl:URL) -> Agent>;
    var ?compress:Bool;
    var ?follow:Int;
    var ?size:Int;
    var ?timeout:Int;
}

enum abstract RequestContext(String) {
    var Audio = "audio";
    var Beacon = "beacon";
    var Cspreport = "cspreport";
    var Download = "download";
    var Embed = "embed";
    var Eventsource = "eventsource";
    var Favicon = "favicon";
    var Fetch = "fetch";
    var Font = "font";
    var Form = "form";
    var Frame = "frame";
    var Hyperlink = "hyperlink";
    var Iframe = "iframe";
    var Image = "image";
    var Imageset = "imageset";
    var Import = "import";
    var Internal = "internal";
    var Location = "location";
    var Manifest = "manifest";
    var Object = "object";
    var Ping = "ping";
    var Plugin = "plugin";
    var Prefetch = "prefetch";
    var Script = "script";
    var Serviceworker = "serviceworker";
    var Sharedworker = "sharedworker";
    var Style = "style";
    var Subresource = "subresource";
    var Track = "track";
    var Video = "video";
    var Worker = "worker";
    var Xmlhttprequest = "xmlhttprequest";
    var Xslt = "xslt";
}

enum abstract RequestMode(String) {
    var Cors = "cors";
    var NoCors = "no-cors";
    var SameOrigin = "same-origin";
}

enum abstract RequestRedirect(String) {
    var Error = "error";
    var Follow = "follow";
    var Manual = "manual";
}

enum abstract RequestCredentials(String) {
    var Omit = "omit";
    var Include = "include";
    var SameOrigin = "same-origin";
}

enum abstract RequestCache(String) {
    var Default = "default";
    var ForceCache = "force-cache";
    var NoCache = "no-cache";
    var NoStore = "no-store";
    var OnlyIfCached = "only-if-cached";
    var Reload = "reload";
}

@:jsRequire("node-fetch", "Headers")
extern class Headers {
    function new(?init:HeadersInit);
    function append(name:String, value:String):Void;
    function delete(name:String):Void;
    function get(name:String):Null<String>;
    function has(name:String):Bool;
    function set(name:String, value:String):Void;
    function forEach(callback:(value:String, name:String)->Void):Void;
    function entries():js.lib.Iterator<js.lib.KeyValue<String, String>>;
    function keys():js.lib.Iterator<String>;
    function values():js.lib.Iterator<String>;
}

@:jsRequire("node-fetch", "Response")
extern class Response extends Body {
    function new(?body:BodyInit, ?init:ResponseInit);
    final headers:Headers;
    final ok:Bool;
    final redirected:Bool;
    final status:Int;
    final statusText:String;
    final type:ResponseType;
    final url:String;
    function clone():Response;
    static function error():Response;
    static function redirect(url:String, status:Int):Response;
}

typedef ResponseInit = {
    var ?headers:HeadersInit;
    var ?size:Int;
    var ?status:Int;
    var ?statusText:String;
    var ?timeout:Int;
    var ?url:String;
}

enum abstract ResponseType(String) {
    var Basic = "basic";
    var Cors = "cors";
    var Default = "default";
    var Error = "error";
    var Opaque = "opaque";
    var OpaqueRedirect = "opaqueredirect";
}

@:jsRequire("node-fetch", "Body")
extern class Body {
    final body:IReadable;
    final bodyUsed:Bool;
    final size:Int;
    final timeout:Int;
    function arrayBuffer():Promise<ArrayBuffer>;
    function blob():Promise<Blob>;
    function buffer():Promise<Buffer>;
    function json():Promise<Any>;
    function text():Promise<String>;
    function textConverted():Promise<String>;
}

typedef RequestInfo = EitherType<String, EitherType<URLLike, Request>>;
typedef HeadersInit = EitherType<Headers, EitherType<Array<Array<String>>, Dynamic<String>>>;
typedef BodyInit = EitherType<ArrayBuffer, EitherType<ArrayBufferView, EitherType<IReadable, EitherType<String, EitherType<URLSearchParams, FormData>>>>>;

typedef URLLike = {
    var href:String;
}

@:jsRequire("node-fetch", "Blob")
extern class Blob {
    final type:String;
    final size:Int;
    function new(?blobParts:Array<BlobPart>, ?options:BlobOptions);
    function slice(?start:Int, ?end:Int):Blob;
    function text():Promise<String>;
}

typedef BlobPart = EitherType<ArrayBuffer, EitherType<ArrayBufferView, EitherType<Blob, String>>>;

typedef BlobOptions = {
    var ?type:String;
    var ?endings:EndingTypes;
}

enum abstract EndingTypes(String) {
    var Transparent = "transparent";
    var Native = "native";
}

typedef AbortSignal = {
    var aborted:Bool;
    var onabort:Function;
    function addEventListener(type:String, listener:haxe.Constraints.Function, ?options:EitherType<AddEventListenerOptions, Bool>):Void;
    function removeEventListener(type:String, listener:Function, ?options:EitherType<EventListenerOptions, Bool>):Void;
}

typedef EventListenerOptions = {
    var ?capture:Bool;
}

typedef AddEventListenerOptions = EventListenerOptions & {
    var ?once:Bool;
    var ?passive:Bool;
}

@:jsRequire("node-fetch", "FetchError")
extern class FetchError extends js.lib.Error {
    function new(message:String, type:String, ?systemError:SystemError);
    var type:String;
    var code:Null<String>;
    var errno:Null<String>;
}

typedef SystemError = {
    var message:String;
    var name:String;
    var stack(default, null):String;
    var ?code:String;
}
