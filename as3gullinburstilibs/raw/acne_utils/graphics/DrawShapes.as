package utils.graphics {	import flash.display.Graphics;	import flash.geom.Point;	public class DrawShapes {				public static function drawRect(graphics:Graphics, w:Number, h:Number, color:Number, alpha:Number):void {			graphics.beginFill(color, alpha);			graphics.drawRect(0, 0, w, h);			graphics.endFill();		}				public static function drawPosRect(graphics:Graphics, x:Number, y:Number, w:Number, h:Number, color:Number, alpha:Number):void {			graphics.beginFill(color, alpha);			graphics.drawRect(x, y, w, h);			graphics.endFill();		}				public static function drawRoundRect(graphics:Graphics, w:Number, h:Number, color:Number, alpha:Number, ellipseRadius:Number):void {			if (w < 1) w = 1;			if (h < 1) h = 1;			if (ellipseRadius < 1) ellipseRadius = 1;			graphics.beginFill(color, alpha);			graphics.drawRoundRect(0, 0, w, h, ellipseRadius, ellipseRadius);			graphics.endFill();		}				public static function drawPosRoundRect(graphics:Graphics, x:Number, y:Number, w:Number, h:Number, color:Number, alpha:Number, ellipseRadius:Number):void {			if (w < 1) w = 1;			if (h < 1) h = 1;			if (ellipseRadius < 1) ellipseRadius = 1;			graphics.beginFill(color, alpha);			graphics.drawRoundRect(x, y, w, h, ellipseRadius, ellipseRadius);			graphics.endFill();		}				public static function drawCircle(graphics:Graphics, dia:Number, color:Number, alpha:Number):void {			graphics.beginFill(color, alpha);			graphics.drawCircle(-(dia/2), -(dia/2), dia);			graphics.endFill();		}				public static function drawPosCircle(graphics:Graphics, x:Number, y:Number, dia:Number, color:Number, alpha:Number):void {			graphics.beginFill(color, alpha);			graphics.drawCircle(x-(dia/2), y-(dia/2), dia);			graphics.endFill();		}				public static function drawPosEllipse(graphics:Graphics, x:Number, y:Number, diaWidth:Number, diaHeight:Number, color:Number, alpha:Number):void {			graphics.beginFill(color, alpha);			graphics.drawEllipse(x - (diaWidth/2), y - (diaHeight/2), diaWidth, diaHeight);			graphics.endFill();		}				public static function drawArrow(mc:Graphics, w:Number, h:Number, color:Number, alpha:Number, direction:String = "right"):void {			mc.beginFill(color, alpha);			mc.lineStyle(1, color, alpha);			if (direction == "right") {				mc.lineTo(w, h/2);				mc.lineTo(0, h);				mc.lineTo(0, 0);			} else if (direction == "left"){							}			mc.endFill();		}				public static function create1pxRoundRect(graphics:Graphics, w:int, h:int, color:Number, alpha:Number):void {						graphics.beginFill(color, alpha);			graphics.drawRect(0, 1, w, h-2);			graphics.endFill();			graphics.beginFill(color, alpha);			graphics.drawRect(1, 0, w-2,h);			graphics.endFill();		}				public static function markPoint(graphics:Graphics, p:Point, color:Number):void {						graphics.beginFill(color, 1);			graphics.drawCircle(p.x, p.y, 4);			graphics.endFill();					}			}}