package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class StrumNote extends FlxSprite
{
	private var colorSwap:ColorSwap;
	public var resetAnim:Float = 0;
	private var noteData:Int = 0;

	public static var colorFromData:Array<Array<Int>> = [
		[0,1,2,3],
		[0,1,4,2,3],
		[0,2,3,5,6,8],
		[0,2,3,4,5,6,8],
		[0,1,2,3,5,6,7,8],
		[0,1,2,3,4,5,6,7,8]
	];

	public function new(x:Float, y:Float, leData:Int) {
		colorSwap = new ColorSwap();
		shader = colorSwap.shader;
		noteData = leData;
		super(x, y);
	}

	override function update(elapsed:Float) {
		if(resetAnim > 0) {
			resetAnim -= elapsed;
			if(resetAnim <= 0) {
				playAnim('static');
				resetAnim = 0;
			}
		}

		super.update(elapsed);
	}

	public function playAnim(anim:String, ?force:Bool = false) {
		animation.play(anim, force);
		updateHitbox();
		offset.x = frameWidth / 2;
		offset.y = frameHeight / 2;

		offset.x -= 156 * Note.scales[PlayState.SONG.mania] / 2;
		offset.y -= 156 * Note.scales[PlayState.SONG.mania] / 2;
		//centerOffsets();
		/*
		if(animation.curAnim.name == 'static') {
			colorSwap.hue = 0;
			colorSwap.saturation = 0;
			colorSwap.brightness = 0;
		} else {
			colorSwap.hue = ClientPrefs.arrowHSV[noteData % 4][0] / 360;
			colorSwap.saturation = ClientPrefs.arrowHSV[noteData % 4][1] / 100;
			colorSwap.brightness = ClientPrefs.arrowHSV[noteData % 4][2] / 100;

			if(animation.curAnim.name == 'confirm' && !PlayState.curStage.startsWith('school')) {
				offset.x -= 13;
				offset.y -= 13;
			}
		}
		*/
	}
}
