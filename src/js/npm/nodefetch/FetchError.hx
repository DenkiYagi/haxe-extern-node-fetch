package js.npm.nodefetch;

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
