package cc.gullinbursti.searching {
	
	//] includes [!]>
	//]=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~.
	import flash.geom.Point;
	//]~=~=~=~=~=~=~=~=~=~=~=~=~=~[]~=~=~=~=~=~=~=~=~=~=~=~=~=~[
	
	// <[!] interface delaration [¡]>
	public interface ISearcher {
	//]~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~._	
		
		//]~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~._
		function isContaining(val_obj:Object):Boolean;
		//]~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~·¯
		
		//]~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~._
		function locatedAtInd(val_obj:Object):int;
		//]~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~·¯	
	}
}