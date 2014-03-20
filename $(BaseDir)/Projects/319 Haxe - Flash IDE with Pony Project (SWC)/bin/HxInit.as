package {
	import flash.display.MovieClip;
	
	public class HxInit extends MovieClip {
		
		public function HxInit() {
			Main; haxe.initSwc(this);
			super();
			stop();
		}
		
	}
	
}