package scene;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class ChapterSelection extends FlxState{
    var PlaceholderSprite:FlxSprite;
    var PlayC1:FlxButton;
    var Chapter1:FlxText;
	var StartC1_Btn:FlxButton;

    override public function create():Void {
        super.create();
        Chapter_1();
		StartChapter1();

    }

    private function Chapter_1() {
        PlaceholderSprite = new FlxSprite();
        PlaceholderSprite.makeGraphic(500, 1280, FlxColor.RED);
        PlaceholderSprite.screenCenter();
        add(PlaceholderSprite);

        Chapter1 = new FlxText();
		Chapter1.text = "CHAPTER 1";
        Chapter1.color = FlxColor.WHITE;
		Chapter1.size = 50;
        Chapter1.screenCenter();
		Chapter1.y += 50; // Adjust the y position after centering
        add(Chapter1);
    }

	public function StartChapter1()
	{
		StartC1_Btn = new FlxButton();
		var StartBtn = new FlxButton(0, 0, "NewGame", StartC1Game);
		StartC1_Btn.screenCenter();
		StartC1_Btn.y = 50;
		add(StartC1_Btn);
	}

	public function StartC1Game()
	{
		FlxG.switchState(chapter1.Act1.new);
	}

}