package js.npm.nodefetch;

import haxe.extern.EitherType;

@:jsRequire("node-fetch", "Headers")
extern class Headers {
    function new(?init:HeadersInit);
    function get(name:String):Null<String>;
    function forEach(callback:(value:String, name:String)->Void):Void;
    function set(name:String, value:String):Void;
    function append(name:String, value:String):Void;
    function has(name:String):Bool;
    function delete(name:String):Void;
    function raw():Dynamic<String>;
    function keys():js.lib.Iterator<String>;
    function values():js.lib.Iterator<String>;
    function entries():js.lib.Iterator<js.lib.KeyValue<String, String>>;
}

typedef HeadersInit = EitherType<Headers, EitherType<Array<Array<String>>, Dynamic<String>>>;
