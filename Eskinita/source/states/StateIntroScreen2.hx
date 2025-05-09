package states;
import djFlixel.gfx.RainbowStripes;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class StateIntroScreen2 extends FlxState {

    var sprite:FlxSprite;
    var color1 = 0xFF754355;
    var color2 = 0xFF393254;
    var color3 = 0xFF4E5130;

    override public function create():Void {
        super.create();
        // Functions
        rainbowEFFECT();
        backdropTest();
		spaceBtn();
    }

    public function rainbowEFFECT() {
        var rainbow = new RainbowStripes();
        rainbow.COLORS = [color1,color2,color3];
        add(rainbow);
        rainbow.queueModes(["1:0.4", "2:0.6", "3:0.6", "1:0.2"],()->{trace("Complete");});
        rainbow.setOn();
    }

    public function backdropTest() {
        sprite = new FlxSprite();
        sprite.loadGraphic("assets/images/backdrop.png", false, 1280, 720);
        sprite.setPosition(640, -50);
        add(sprite);
    }

    public function spaceBtn() {
        // Key press should be checked here
        if (FlxG.keys.justPressed.SPACE) {
            FlxG.switchState(states.MenuState.new); // Fix: proper instantiation
        }
    }
        

}
