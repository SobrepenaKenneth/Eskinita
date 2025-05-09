package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.Intro;
import states.IntroScreen;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(1280, 720, Intro));
	}
}
