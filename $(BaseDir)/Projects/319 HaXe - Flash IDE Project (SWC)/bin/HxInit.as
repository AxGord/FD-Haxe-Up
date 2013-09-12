package {
	import flash.display.MovieClip;
	
	public class HxInit extends MovieClip {
		
		public function HxInit() {
			super();
			stop();
			Main; haxe.initSwc(this);
		}
		
	}
	
}