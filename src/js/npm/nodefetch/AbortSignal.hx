package js.npm.nodefetch;

import haxe.Constraints.Function;
import haxe.extern.EitherType;

typedef AbortSignal = {
    var aborted:Bool;
    var onabort:Function;
    function addEventListener(type:String, listener:Function, ?options:EitherType<AddEventListenerOptions, Bool>):Void;
    function removeEventListener(type:String, listener:Function, ?options:EitherType<EventListenerOptions, Bool>):Void;
}

typedef EventListenerOptions = {
    var ?capture:Bool;
}

typedef AddEventListenerOptions = EventListenerOptions & {
    var ?once:Bool;
    var ?passive:Bool;
}
