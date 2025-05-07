package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
#if shaders_supported
import openfl.filters.ShaderFilter;
#end

class PlayState extends FlxState {
    var backdrop:FlxSprite;



    override public function create():Void {
        super.create();

        backdrop = new FlxSprite(0, 0, "assets/images/backdrop.png");
        add(backdrop);


    }

}
