
package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import openfl.Assets;

class TitleScreen extends FlxState {
    override public function create():Void {
        super.create();

        FlxG.sound.playMusic("assets/music/takbo.ogg", 1.0, true);

        trace(Assets.getPath("assets/music/takbo.ogg"));
        //Placeholder  
        var backgroundBox = new FlxSprite(0, 0);
        backgroundBox.makeGraphic(1280, 720, 0xFFFF0000);
        add(backgroundBox);

        var menuBox = new FlxSprite(0, 0);
        menuBox.makeGraphic(500, 720, 0xFF808080);
        add(menuBox);

        var titleBox = new FlxSprite(50, 50);
        titleBox.makeGraphic(400, 200, 0xFFFFA500);
        add(titleBox);

        var newgameBox = new FlxSprite(50, 470);
        newgameBox.makeGraphic(250, 50, 0xFFFF00FF);
        add(newgameBox);

        var optionBox = new FlxSprite(50, 535 );
        optionBox.makeGraphic(250, 50, 0xFF00FF00);
        add(optionBox);

        var exitBox = new FlxSprite(50, 600);
        exitBox.makeGraphic(250, 50, 0xFF800080);
        add(exitBox);

        var mayumiBox = new FlxSprite(950, 300);
        mayumiBox.makeGraphic(200, 300, 0xFFFFFF00);
        add(mayumiBox);

    }

}