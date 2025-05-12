package unangkabanata;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class Act1 extends FlxState {
    var displayText1:FlxText;
    var displayText2:FlxText;
    var displayText3:FlxText;

    var text1:String = "Back then...";
    var text2:String = "Everything felt easy";
    var text3:String = "The sea was always warm";

    var charIndex:Int = 0;
    var dialogueStep:Int = 0;

    override public function create():Void {
        super.create();
        waves();
        dialogueText1();
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if (FlxG.keys.justPressed.SPACE) {
            dialogueStep++;

            switch (dialogueStep) {
                case 1:
                    dialogueText2();
                case 2:
                    dialogueText3();
                default:
                    // Optional: Do nothing or end the scene
            }
        }
    }

    public function waves() {
        // Music
        FlxG.sound.playMusic("assets/music/waves.ogg", 1.0, true);
        if (!FlxG.sound.music.exists) {
            trace("Error: Music file not found or failed to load.");
        }
    }

    function dialogueText1() {
        displayText1 = new FlxText(40, 50, 400, "");
        displayText1.setFormat(null, 25, 0xFFFFFFFF);
        add(displayText1);
        autoType(displayText1, text1, 0.05);
    }

    function dialogueText2() {
        displayText2 = new FlxText(100, 100, 400, "");
        displayText2.setFormat(null, 25, 0xFFFFFFFF);
        add(displayText2);
        autoType(displayText2, text2, 0.05);
    }

    function dialogueText3() {
        displayText3 = new FlxText(150, 150, null, "");
        displayText3.setFormat(null, 25, 0xFFFFFFFF);
        add(displayText3);
        autoType(displayText3, text3, 0.05);
    }

    function autoType(targetText:FlxText, text:String, speed:Float):Void {
        charIndex = 0;
        targetText.text = "";

        var timer = new FlxTimer();
        timer.start(speed, function(t:FlxTimer) {
            targetText.text += text.charAt(charIndex);
            charIndex++;
        }, text.length);
    }
}
