package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class IntroScreen2 extends FlxState {

    var sprite:FlxSprite;

    override public function create():Void {
        super.create();

        sprite = new FlxSprite();
        sprite.loadGraphic("assets/images/backdrop.png", false, 1280, 720);
        sprite.screenCenter(); // Fix: Added parentheses
        add(sprite);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        // Key press should be checked here
        if (FlxG.keys.justPressed.SPACE) {
            FlxG.switchState(TitleScreen.new); // Fix: proper instantiation
        }
    }
}
