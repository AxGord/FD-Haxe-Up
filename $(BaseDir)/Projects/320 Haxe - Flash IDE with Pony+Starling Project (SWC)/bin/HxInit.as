package {
	import flash.display.MovieClip;
	
	public class HxInit extends MovieClip {
		
		public function HxInit() {
			stop();
			Main; haxe.initSwc(this);
			super();
		}
		
	}
	
}