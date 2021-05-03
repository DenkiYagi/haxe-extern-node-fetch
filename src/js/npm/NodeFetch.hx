package js.npm;

import js.lib.Promise;
import js.npm.nodefetch.Request;
import js.npm.nodefetch.Response;

@:jsRequire("node-fetch")
extern class NodeFetch {
    @:selfCall
    static function fetch(url:RequestInfo, ?init:RequestInit):Promise<Response>;
    static function isRedirect(code:Int):Bool;
}
