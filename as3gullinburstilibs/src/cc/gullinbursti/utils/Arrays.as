package cc.gullinbursti.utils {
	
	//] includes [!]>
	//]=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~.
	import cc.gullinbursti.math.probility.ListScrambler;
	import cc.gullinbursti.sorting.BasicSorting;
	
	import flash.display.BitmapData;
	//]~=~=~=~=~=~=~=~=~=~=~=~=~=~[]~=~=~=~=~=~=~=~=~=~=~=~=~=~[
	
	// <[!] class delaration [!]>
	public class Arrays {
	//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
		
		//] class properties ]>
		//]=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~.
		// <[=-=-=-=-=-=-=-=-=-=-=-=][=-=-=-=-=-=-=-=-=-=-=-=]>
		
		
		public static function elementObjCopy(in_arr:Array=null):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._	
			
			return(elementTypeCopy(Object, in_arr));
			
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		public static function elementTypeCopy(class_obj:Class, in_arr:Array=null):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			// return array
			var ret_arr:Array = new Array();
			
			// has elements
			if (in_arr) {
				
				// loop thru input array 1x1
				for (var i:int=0; i<in_arr.length; i++) {
					
					// push method
					switch (class_obj) {
						
						// as bmp data
						case BitmapData:
							var bmpData:BitmapData = in_arr[i] as BitmapData;
							ret_arr.push(bmpData.clone());
							break;
							
						
						//* any other class
						default:
							ret_arr.push(in_arr[i] as class_obj);
							break;
					}
				}
			}
			
			// new / dup'd array
			return (ret_arr);
		
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		/**
		 * Determines whether the specified array contains the param value.
		 */
		public static function containsValue(in_arr:Array, val:Object, start:int=0):Boolean {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._	
			return (in_arr.indexOf(val, start) != -1);
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		/**
		 * Remove all instances of the specified value from the array.
		 */
		public static function purgeValue(in_arr:Array, val:Object):void {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			// length of array
			var len:uint = in_arr.length;
			
			// loop thru array
			for (var i:int=len; i>-1; i--) {
				
				// found value, drop it
				if (in_arr[i] === val)
					in_arr.splice(i, 1);
			}					
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		/**
		* Tallies duplicate elements, returns an array of 
		 * values and occurances.
		 * 
		 */
		public static function tallyDups(in_arr:Array):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			// returned array
			var dup_arr:Array = new Array();
			
			// counters
			var itm_cnt:int = 1;
			var dup_tot:int = 0;
			
			// loop thru array 1st time…
			for (var i:int=0; i<in_arr.length-1; i++) {
				
				// array has the val beyond it's index
				if (containsValue(in_arr, in_arr[i], i+1)) {
					itm_cnt++;
				
				// no dup found, reset
				} else {
					itm_cnt = 1;
					continue;
				}
				
				// has at least 1 dup
				if (itm_cnt > 1) {
					
					// 1st dup occurance
					if (itm_cnt == 2) {
						dup_arr.push([in_arr[i], itm_cnt]);
						dup_tot++;
					
					// found previously
					} else
						dup_arr[dup_tot-1][1] = itm_cnt;
				}
			}
			
			
			
			return (dup_arr);
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		/**
		 * Produces a new array in a new memory location, 
		 * can be used to remove duplicate elements.
		 */
		public static function xerox(in_arr:Array, hasRepeats:Boolean=false):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._	
			
			// new array to return
			var xeroxed_arr:Array = new Array();
			
			// loop thru the input array
			for (var i:int=0; i<in_arr.length; ++i) {
				
				// grab each element as an Object
				var item_obj:Object = Object(in_arr[i]);
				
				// test to see if it already is in there
				if (Arrays.containsValue(xeroxed_arr, item_obj)) {
					
					// dups ok, push it
					if (hasRepeats)
						xeroxed_arr.push(item_obj);
				
				
				// not in there yet
				} else
					xeroxed_arr.push(item_obj);
			}
			
			
			return (xeroxed_arr);
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		/**
		* Generates a copy of the array, w/ references to the orginal items.
		 */
		public static function ptMemRef(in_arr:Array, hasRepeats:Boolean=true):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			// reference array
			var ref_arr:Array;
			
			// allowing repeats
			if (hasRepeats)
				ref_arr = in_arr.slice();
			
			// drop duplicate elements
			else
				ref_arr = in_arr.slice();
			
			
			return (ref_arr);
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		/**
		 * Compares two arrays & returns T/F depending on if they
		 * contain the same element values at the same indexes.
		 */
		public static function isEqualTo(base_arr:Array, test_arr:Array):Boolean {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			// lengths ain't equal
			if (base_arr.length != test_arr.length)
				return (false);
			
			
			// loop thru the base array
			for(var i:int=0; i<base_arr.length; i++) {
				
				// elements @ index don't match
				if(base_arr[i] !== test_arr[i])
					return (false);
			}
			
			// passed loop test
			return (true);
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		
		public static function sortByNumber(in_arr:Array, isAscending:Boolean=true):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			return (BasicSorting.binary(in_arr, isAscending));
			
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		public static function sortByAlpha(in_arr:Array, isAscending:Boolean=true):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			return (unicodeConvert(BasicSorting.binary(unicodeConvert(in_arr), isAscending), false));
			
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		public static function lengthCompare(isMax:Boolean=true, ... args):int {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			// init w/ -1 (no change / same len)
			var ind:int = -1;
			
			// prime the top array
			var top_arr:Array = args[0] as Array;
			
			
			// loop thru the args
			for (var i:int=0; i<args.length; i++) {
				
				// cast each arg & reset flag
				var arg_arr:Array = args[i] as Array;
				var isNewTop:Boolean = false;
				
				// going for max items
				if (isMax) {
					
					// current array has more items
					if (arg_arr.length > top_arr.length)
						isNewTop = true;
				
				// going for min items
				} else {
					
					// current array has less items
					if (arg_arr.length < top_arr.length)
						isNewTop = true;
				}
				
				// update the top array & index
				if (isNewTop) {
					top_arr = arg_arr;
					ind = i;
				}
			}
			
			
			// return the top index / -1
			return (ind);
			
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		
		
		
		public static function reverse(in_arr:Array):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			var tot:int = in_arr.length;
			var ret_arr:Array = new Array();
			
			for (var i:int=0; i<tot; i++) {
				ret_arr[i] = in_arr[tot - i];
			}
			
			return (ret_arr);
			
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		public static function unicodeConvert(in_arr:Array, isAlpha:Boolean=true):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			// converted to unicode
			var convert_arr:Array = new Array();
			
			// each item
			var itm_str:String;
			var itm_arr:Array;
			
			
			// loop thru all the elements
			for (var i:int=0; i<in_arr.length; i++) {
				
				// going to unicode
				if (isAlpha) {
				
					// pull each element
					itm_str = String(in_arr[i]);
					itm_arr = new Array();
					
					// loop thru each element & convert
					for (var j:int=0; j<itm_str.length; j++)
						itm_arr.push(in_arr[i].charCodeAt(j));
					
					// push into array
					convert_arr.push(itm_arr);
				
				
				// coming from unicode
				} else {
					
					// pull each element & convert to chars
					itm_arr = in_arr[i] as Array;
					itm_str = String.fromCharCode(in_arr[i] as Array);
					
					// push into array
					convert_arr.push(itm_str);
				}
			}
			
			
			// return the converted array
			return (convert_arr);
			
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		public static function chain(hasRepeats:Boolean, ... args):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			// returned array
			var append_arr:Array = new Array();
			
			// loop thru the args
			for (var i:int=0; i<args.length; i++) {
				
				// pull each element as an array
				var arg_arr:Array = args[i] as Array;
				
				//trace (i, "arg_arr.length:["+arg_arr.length+"]");
				
				// loop thru each arg, & push val
				for (var j:int=0; j<arg_arr.length; j++)
					append_arr.push(arg_arr[j]);
			}
			
			// allowing duplicate elements
			if (hasRepeats)
				return (append_arr);
				
			else
				return (Arrays.xerox(append_arr, false));
			
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		public static function scrambleExisting(in_arr:Array):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			return(ListScrambler.randomizeArray(in_arr));
				
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		public static function scrambleNew(len:int=1):Array {
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
			
			return(ListScrambler.newRandomIndexes(len));
				
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		
		/**
		 * Swaps the values of two elements in an array.
		 */
		public static function swap(in_arr:Array, ind1:int, ind2:int):void {
		//]~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~._		
			
			var tmp_obj:Object = Object(in_arr[ind1]);
			
			in_arr[ind1] = in_arr[ind2];
			in_arr[ind2] = tmp_obj;
			
		}//]~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		
		// <*] class constructor [*>
		public function Arrays() {/*..\(^_^)/..*/}
		//~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~~*~._
	}
}