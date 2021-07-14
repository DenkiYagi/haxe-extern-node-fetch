package js.npm;

import js.lib.Promise;
import js.npm.nodefetch.Request;
import js.npm.nodefetch.Response;

@:jsRequire("node-fetch")
extern class NodeFetch {
    #if nodefetch_always_require
    public static inline function fetch(url:RequestInfo, ?init:RequestInit):Promise<Response> {
        return js.Lib.require("node-fetch")(url, init);
    }
    #else
    @:selfCall
    static function fetch(url:RequestInfo, ?init:RequestInit):Promise<Response>;
    #end

    static function isRedirect(code:Int):Bool;
}
