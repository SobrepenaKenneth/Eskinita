package unangkabanata;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class Act1 extends FlxState {
    var displayText1:FlxText;
    var displayText2:FlxText;
    var displayText3:FlxText;
    var displayText4:FlxText;
    var displayText5:FlxText;
    var displayText6:FlxText;

    var artA1:FlxSprite;

    var text1:String = "Back then...";
    var text2:String = "Everything felt easy";
    var text3:String = "The sea was always warm";
    var text4:String = "And I Didn't know yet...";
    var text5:String = "That some mornings start like dreams";
    var text6:String = "...and end like endings";

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
                case 3:
                    art_1();
                case 4:
                    dialogueText4();
                case 5:
                    dialogueText5();
                case 6:
                    dialogueText6();
                default:
                    // Optional: Do nothing or end the scene
            }
        }
    }

    public function waves() {
        // Music
        FlxG.sound.playMusic("assets/music/waves.ogg", 1.0, true);
        FlxG.sound.playMusic("assets/music/piano1.ogg", 1.0, true);
        FlxG.sound.music.volume = 1.0; // Set volume (1.0 is max, 0.0 is mute)
        if (!FlxG.sound.music.exists) {
            trace("Error: Music file not found or failed to load.");
        }
    }

    function dialogueText1() {
        displayText1 = new FlxText(40, 50, 400, "");
        displayText1.setFormat(null, 25, 0xFFFFFFFF);
        add(displayText1);
        autoType(displayText1, text1, 0.10);
    }

    function dialogueText2() {
        displayText2 = new FlxText(80, 100, 400, "");
        displayText2.setFormat(null, 25, 0xFFFFFFFF);
        add(displayText2);
        autoType(displayText2, text2, 0.10);
    }

    function dialogueText3() {
        displayText3 = new FlxText(120, 150, 400, "");
        displayText3.setFormat(null, 25, 0xFFFFFFFF);
        add(displayText3);
        autoType(displayText3, text3, 0.10);
    }

    function dialogueText4() {
        // Remove previous dialogue texts
        if (displayText1 != null) remove(displayText1);
        if (displayText2 != null) remove(displayText2);
        if (displayText3 != null) remove(displayText3);

        // Create and display the new dialogue text
        displayText4 = new FlxText(0, 550, 400, "");
        displayText4.setFormat(null, 25, 0xFFFFFFFF);
        displayText4.screenCenter();
        add(displayText4);
        autoType(displayText4, text4, 0.10);
    }

    function dialogueText5() {
        // Remove previous dialogue texts
        if (displayText1 != null) remove(displayText1);
        if (displayText2 != null) remove(displayText2);
        if (displayText3 != null) remove(displayText3);
        if (displayText4 != null) remove(displayText4);

        displayText5 = new FlxText(120, 150, 800, ""); // Increased width
        displayText5.setFormat(null, 25, 0xFFFFFFFF);
        add(displayText5);
        autoType(displayText5, text5, 0.10);
    }

    function dialogueText6() {
        // Remove previous dialogue texts
        if (displayText1 != null) remove(displayText1);
        if (displayText2 != null) remove(displayText2);
        if (displayText3 != null) remove(displayText3);
        if (displayText4 != null) remove(displayText4);
        if (displayText5 != null) remove(displayText5);

        displayText6 = new FlxText(120, 150, 800, ""); // Increased width
        displayText6.setFormat(null, 25, 0xFFFFFFFF);
        displayText6.screenCenter();
        displayText6.y -= displayText6.height / 2;
        add(displayText6);
        autoType(displayText6, text6, 0.10);

        if (artA1 != null) {
            remove(artA1);
            artA1 = null;
        }
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

    public function art_1() {
        artA1 = new FlxSprite(0, 220);
        artA1.makeGraphic(1280, 300 , FlxColor.RED);
        add(artA1);
    }
}
