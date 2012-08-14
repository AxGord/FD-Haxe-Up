package flash {
	import flash.text.TextFormat;
	import flash.display.MovieClip;
	import flash.Lib;
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.setTimeout;
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	public class Boot extends flash.display.MovieClip {
		public function Boot() : void { if( !flash.Boot.skip_constructor ) {
			super();
		}}
		
		protected function start() : void {
			var c : flash.display.MovieClip = flash.Lib.current;
			try {
				if(c == this && c.stage != null && c.stage.align == "") c.stage.align = "TOP_LEFT";
			}
			catch( e : * ){
			}
			if(c.stage == null) c.addEventListener(flash.events.Event.ADDED_TO_STAGE,this.doInitDelay);
			else if(c.stage.stageWidth == 0) flash.utils.setTimeout(this.start,1);
			else this.init();
		}
		
		protected function doInitDelay(_ : *) : void {
			flash.Lib.current.removeEventListener(flash.events.Event.ADDED_TO_STAGE,this.doInitDelay);
			this.start();
		}
		
		protected function init() : void {
			throw "assert";
		}
		
		static protected var tf : flash.text.TextField;
		static protected var lines : Array;
		static protected var lastError : Error;
		static public var skip_constructor : Boolean = false;
		static public function enum_to_string(e : *) : String {
			if(e.params == null) return e.tag;
			var pstr : Array = [];
			{
				var _g : int = 0, _g1 : Array = e.params;
				while(_g < _g1.length) {
					var p : * = _g1[_g];
					++_g;
					pstr.push(flash.Boot.__string_rec(p,""));
				}
			}
			return e.tag + "(" + pstr.join(",") + ")";
		}
		
		static public function __instanceof(v : *,t : *) : Boolean {
			try {
				if(t == Object) return true;
				return v is t;
			}
			catch( e : * ){
			}
			return false;
		}
		
		static public function __clear_trace() : void {
			if(flash.Boot.tf == null) return;
			flash.Boot.tf.parent.removeChild(flash.Boot.tf);
			flash.Boot.tf = null;
			flash.Boot.lines = null;
		}
		
		static public function __set_trace_color(rgb : uint) : void {
			flash.Boot.getTrace().textColor = rgb;
		}
		
		static public function getTrace() : flash.text.TextField {
			var mc : flash.display.MovieClip = flash.Lib.current;
			if(flash.Boot.tf == null) {
				flash.Boot.tf = new flash.text.TextField();
				var format : flash.text.TextFormat = flash.Boot.tf.getTextFormat();
				format.font = "_sans";
				flash.Boot.tf.defaultTextFormat = format;
				flash.Boot.tf.selectable = false;
				flash.Boot.tf.width = ((mc.stage == null)?800:mc.stage.stageWidth);
				flash.Boot.tf.autoSize = flash.text.TextFieldAutoSize.LEFT;
				flash.Boot.tf.mouseEnabled = false;
			}
			if(mc.stage == null) mc.addChild(flash.Boot.tf);
			else mc.stage.addChild(flash.Boot.tf);
			return flash.Boot.tf;
		}
		
		static public function __trace(v : *,pos : *) : void {
			trace(pos.className + "." + pos.methodName + "(" + pos.lineNumber + "):", v);
		}
		
		static public function __string_rec(v : *,str : String) : String {
			var cname : String = flash.utils.getQualifiedClassName(v);
			switch(cname) {
			case "Object":
			{
				var k : Array = function() : Array {
					var $r : Array;
					$r = new Array();
					for(var $k2 : String in v) $r.push($k2);
					return $r;
				}();
				var s : String = "{";
				var first : Boolean = true;
				{
					var _g1 : int = 0, _g : int = k.length;
					while(_g1 < _g) {
						var i : int = _g1++;
						var key : String = k[i];
						if(first) first = false;
						else s += ",";
						s += " " + key + " : " + flash.Boot.__string_rec(v[key],str);
					}
				}
				if(!first) s += " ";
				s += "}";
				return s;
			}
			break;
			case "Array":
			{
				if(v == Array) return "#Array";
				var s1 : String = "[";
				var i1 : *;
				var first1 : Boolean = true;
				var a : Array = v;
				{
					var _g11 : int = 0, _g2 : int = a.length;
					while(_g11 < _g2) {
						var i2 : int = _g11++;
						if(first1) first1 = false;
						else s1 += ",";
						s1 += flash.Boot.__string_rec(a[i2],str);
					}
				}
				return s1 + "]";
			}
			break;
			default:
			switch(typeof v) {
			case "function":
			return "<function>";
			break;
			}
			break;
			}
			return new String(v);
		}
		
		static protected function __unprotect__(s : String) : String {
			return s;
		}
		
	}
}
