package scene;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class ChapterSelection extends FlxState{
    var PlaceholderSprite:FlxSprite;
    var PlayC1:FlxButton;
    var Chapter1:FlxText;

    override public function create():Void {
        super.create();
        Chapter_1();

    }

    private function Chapter_1() {
        PlaceholderSprite = new FlxSprite();
        PlaceholderSprite.makeGraphic(500, 1280, FlxColor.RED);
        PlaceholderSprite.screenCenter();
        add(PlaceholderSprite);

        Chapter1 = new FlxText();
        Chapter1.text = "CHAPTER 1";
        Chapter1.font = "assets/fonts/bloktopia.tff";
        Chapter1.color = FlxColor.WHITE;
        Chapter1.size = 32;
        Chapter1.screenCenter();
        add(Chapter1);
    }

}