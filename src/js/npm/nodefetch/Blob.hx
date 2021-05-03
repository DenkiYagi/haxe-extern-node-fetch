package js.npm.nodefetch;

import haxe.extern.EitherType;
import js.lib.ArrayBuffer;
import js.lib.ArrayBufferView;
import js.lib.Promise;
import js.node.stream.Readable;

@:jsRequire("node-fetch", "Blob")
extern class Blob {
    function new(?blobParts:Array<BlobPart>, ?options:BlobOptions);
    final size:Int;
    final type:String;
    function text():Promise<String>;
    function arrayBuffer():Promise<ArrayBuffer>;
    function stream():IReadable;
    function slice(?start:Int, ?end:Int):Blob;
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
