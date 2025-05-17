package;

import chapter1.Act1;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.FlxState;
import openfl.display.Sprite;
import scene.ChapterSelection;
import scene.Intro;
import scene.MainMenu;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(1280, 720, Act1));
	}
}
