package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class IntroScreen extends FlxState
{
    override public function create():Void
    {
        super.create();

        // Set background color
        FlxG.camera.bgColor = FlxColor.BLACK;

        // Background panel
        var panel = new FlxSprite(0, 0);
        panel.makeGraphic(320, 720, FlxColor.GRAY);
        add(panel);

        // Vertical spacing
        var buttonY = 150;
        var spacing = 80;

        // Button size
        var btnWidth = 240;
        var btnHeight = 50;

        // Create and add buttons
        add(createButton(40, buttonY, btnWidth, btnHeight, "New Game", onNewGame));
        add(createButton(40, buttonY + spacing, btnWidth, btnHeight, "Options", onOptions));
        add(createButton(40, buttonY + spacing * 2, btnWidth, btnHeight, "Credits", onCredits));
        //add(createButton(40, buttonY + spacing * 3, btnWidth, btnHeight, "Exit", onExit));
    }

    function createButton(x:Float, y:Float, width:Int, height:Int, label:String, callback:Void->Void):FlxButton
    {
        var btn = new FlxButton(x, y, label, callback);
        btn.loadGraphicFromSprite(makeButtonGraphic(width, height));
        btn.label.setFormat(null, 16, FlxColor.WHITE, "center");
        return btn;
    }

    function makeButtonGraphic(width:Int, height:Int):FlxSprite
    {
        var sprite = new FlxSprite();
        sprite.makeGraphic(width, height, FlxColor.GRAY);
        return sprite;
    }

    // Callbacks
    function onNewGame():Void trace("New Game clicked!");
    function onOptions():Void trace("Options clicked!");
    function onCredits():Void trace("Credits clicked!");
    //function onExit():Void System.exit(0);
}
