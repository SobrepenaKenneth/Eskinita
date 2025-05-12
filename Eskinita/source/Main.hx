package;

import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.FlxState;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(1280, 720, scene.Intro));
	}
}
