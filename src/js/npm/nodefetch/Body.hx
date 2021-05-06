package js.npm.nodefetch;

import haxe.extern.EitherType;
import js.lib.ArrayBuffer;
import js.lib.ArrayBufferView;
import js.lib.Promise;
import js.node.Buffer;
import js.node.stream.Readable;
import js.node.url.URLSearchParams;
import js.npm.FormData;

@:jsRequire("node-fetch", "Body")
extern class Body {
    final size:Int;
    final timeout:Int;
    final body:IReadable;
    final bodyUsed:Bool;
    function arrayBuffer():Promise<ArrayBuffer>;
    function blob():Promise<Blob>;
    function json():Promise<Dynamic>;
    function text():Promise<String>;
    function buffer():Promise<Buffer>;
    function textConverted():Promise<String>;
}

typedef BodyInit = EitherType<ArrayBuffer, EitherType<ArrayBufferView, EitherType<IReadable, EitherType<String, EitherType<URLSearchParams, FormData>>>>>;
