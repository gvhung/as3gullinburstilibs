package cc.gullinbursti.fx {
	
	//] includes [!]>
	//]=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~.
	import cc.gullinbursti.lang.Numbers;
	import cc.gullinbursti.math.probility.Randomness;
	
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.filters.DisplacementMapFilter;
	import flash.filters.DisplacementMapFilterMode;
	import flash.geom.Point;

	//]~=~=~=~=~=~=~=~=~=~=~=~=~=~[]~=~=~=~=~=~=~=~=~=~=~=~=~=~[
	
	/**
	 * 
	 **/
	// <[!] class delaration [!]>
	public class FloppyJiggleFX {
	//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
		
		//] class properties ]>
		//]=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~.
		// noise matte
		private var noise_bmp:BitmapData;
		
		// noise params
		private static var filter_mode:String = DisplacementMapFilterMode.CLAMP;
		private var noise_seed:Number;
		private var noise_oct:int;
		private var size_pt:Point;
		private var map_pt:Point;
		private var base_pt:Point;
		private var str_pt:Point;
		private var comp_pt:Point;
		private var spdMult_pt:Point;
		private var offsetPts_arr:Array;
		private var offsetInc_arr:Array;
		
		// fixes the noise displacement offset
		private var offset_flt:DisplacementMapFilter;
		private var offset_bmp:BitmapData;
		// <[=-=-=-=-=-=-=-=-=-=-=-=][=-=-=-=-=-=-=-=-=-=-=-=]>
		
		/**
		 * 
		 **/
		// <*] class constructor [*>
		public function FloppyJiggleFX (dim:Point, oct:int=2, base:Point=null, str:Point=null, spdMult:Point=null, map:Point=null, seed_max:int=2048) {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			if (!base)
				base = new Point(8, 32);
			
			if (!str)
				str = new Point(2, 0.5);
			
			if (!map)
				map = new Point();
			
			if (!spdMult)
				spdMult = new Point(1, 1);
			
			
			size_pt = dim;
			noise_oct = oct;
			base_pt = base;
			str_pt = str;
			comp_pt = new Point(BitmapDataChannel.RED, BitmapDataChannel.GREEN);
			map_pt = map;
			spdMult_pt = spdMult;
			noise_seed = Randomness.generateInt(0, seed_max);
			
			offsetPts_arr = new Array();
			offsetInc_arr = new Array();
			
			initNoiseMap();
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		//]~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=[>
		//]~=~=~=~=~=~=~=~=~=[>
		
		
		private function initNoiseMap():void {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			// populate the offset array
			for (var i:int=0; i<noise_oct; i++)
				offsetPts_arr.push(new Point());
			
			// populate the speed array
            offsetInc_arr.push(new Point(spdMult_pt.x, -spdMult_pt.y));
            offsetInc_arr.push(new Point(spdMult_pt.x, spdMult_pt.y));
            offsetInc_arr.push(new Point(spdMult_pt.x, -spdMult_pt.y));
            offsetInc_arr.push(new Point(spdMult_pt.x, spdMult_pt.y));
            
            // create the bitmap datas
            offset_bmp = new BitmapData(size_pt.x, size_pt.y);
            noise_bmp = new BitmapData(size_pt.x, size_pt.y);
            
            // offset coords from noise displace (-x & -y strength)
            offset_flt = new DisplacementMapFilter(offset_bmp, map_pt, comp_pt.x, comp_pt.y, -str_pt.x, -str_pt.y, filter_mode);
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		public function returnFilterFX():Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			// return array
			var arr:Array = new Array();
			
			// increment the noise movement
			for (var i:int=0; i<offsetPts_arr.length; i++) {
				offsetPts_arr[i].x += offsetInc_arr[i].x;
            	offsetPts_arr[i].y += offsetInc_arr[i].y;	
			}
			
			// render the noise map
            noise_bmp.perlinNoise(base_pt.x, base_pt.y, offsetPts_arr.length, noise_seed, false, true, 10, true, offsetPts_arr);
            var noise_flt:DisplacementMapFilter = new DisplacementMapFilter(noise_bmp, map_pt, comp_pt.x, comp_pt.y, str_pt.x, str_pt.y, filter_mode);
            
            // push the filters to the return array
            arr.push(offset_flt);
            arr.push(noise_flt);
            
            return (arr);
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
	}
}