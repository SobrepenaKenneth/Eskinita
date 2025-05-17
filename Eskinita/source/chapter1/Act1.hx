package chapter1;

import djFlixel.gfx.StarfieldSimple;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.ui.FlxVirtualPad;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.text.TextFormatAlign;

class Act1 extends FlxState {
    var displayText1:FlxText;
    var displayText2:FlxText;
    var displayText3:FlxText;
    var displayText4:FlxText;
    var displayText5:FlxText;
    var displayText6:FlxText;
    var displayText7:FlxText;
    var displayText8:FlxText;
    var displayText9:FlxText;
    var displayText10:FlxText;
    var displayText11:FlxText;
    var displayText12:FlxText;
    var displayText13:FlxText;
    var displayText14:FlxText;
    var displayText15:FlxText;
    var displayText16:FlxText;
    var displayText17:FlxText;
    
    var amihan:FlxSprite;

    var visualizer:StarfieldSimple;

    var boxPlaceholder:FlxSprite;
    var boxPlaceholder0:FlxSprite;
    var boxPlaceholder1:FlxSprite;
    var boxPlaceholder2:FlxSprite;

    var artA1:FlxSprite;
    var continueText:FlxText;
    var typing:Bool = false;

    var virtualPad:FlxVirtualPad;
    var fullscreenButton:FlxButton;

    //Dialogue
    var text1:String = "Noon...";
    var text2:String = "ang mundo'y parang larong walang hanggan";
    // Break
    var text3:String = "Ang dagat, laging may yakap na init";
    var text4:String = "Ang langit, walang bahid ng bagyo";
    // Break
    var text5:String = "At sa gitna ng lahat ng 'yon—";
    var text6:String = "pakiramdam ko, ligtas ako";
    var text7:String = "Na kahit saan ako dalhin ng hangin...";
    var text8:String = "nandiyan pa rin ang araw,";
    var text9:String = "ang tawanan,";
    var text10:String = "at ang tahanan.";
    // Break
    var text11:String = "May mga umagang parang awit—";
    var text12:String = "Maganda sa simula,";
    var text13:String = "Masakit sa huli";
    // Break
    var text14:String = "Sa mundong puno ng pangako...";
    var text15:String = "...bakit ang unang alon palang ay dala na ng pighati?";
    var text16:String = "Siguro nga…";
    var text17:String = "may mga larong nagsisimula na agad sa pagtatapos";

    var charIndex:Int = 0;
    var dialogueStep:Int = 0;

    var coordText:FlxText;
    var showCoords:Bool = false;

    override public function create():Void {
        super.create();
        BgMusic();
        dialogueText1();
        addFullscreenButton();
        starEffect();
        // Track mouse
        coordText = new FlxText(10, 10, 200, "");
        coordText.setFormat(null, 12, FlxColor.WHITE, "left");
        coordText.visible = false; // Start hidden
        add(coordText);
    }

    override public function update(elapsed:Float):Void {
    super.update(elapsed);
    

    FlxG.watch.addQuick("Mouse X", FlxG.mouse.x);
    FlxG.watch.addQuick("Mouse Y", FlxG.mouse.y);

    // THIS IS NOT WORKING YET
    // It just skips the thing
    if (FlxG.keys.justPressed.EIGHT && !typing) {
        dialogueStep++;
        // You can call your dialogue switch here if needed, or just let update() handle it
    }
    // Toggle display on key press '9'
    // Toggle on '9' key
    // BRUH IT's LITERALLY NINE not NUMBER.9 or NUMBER.NINE
    if (FlxG.keys.justPressed.NINE) {
        showCoords = !showCoords;
        coordText.visible = showCoords;
    }

    if (showCoords) {
        coordText.text = "(" + Std.int(FlxG.mouse.x) + ", " + Std.int(FlxG.mouse.y) + ")";
    }

    if (!typing && FlxG.mouse.justPressed) {
        dialogueStep++;

        switch (dialogueStep) {
            case 1:
                dialogueText1();
            case 2:
                dialogueText2();
            case 3:
                dialogueText3();
            case 4:
                dialogueText4();
            case 5:
                dialogueText5();
            case 6:
                dialogueText6();
            case 7:
                dialogueText7();
            case 8:
                dialogueText8();
            case 9:
                dialogueText9();
            case 10:
                dialogueText10();
            case 11:
                dialogueTex11();
            case 12:
                dialogueText12();
            case 13:
                dialogueText13();
            case 14:
                PlaceholderBOX();
            case 15:
                PlaceholderBOX1();
            default:
                // End scene or transition
            }
        }
    }

    function Amihan() {
        var amihan = new FlxSprite();
        amihan.loadGraphic("assets/images/amihan.png", true, 800, 460);

        // Increase scale (e.g., 1.3x)
        amihan.scale.set(1.2, 1.2);

        // Position at bottom right, slightly above the bottom edge
        amihan.x = 450;
        amihan.y = 240;

        // Start fully transparent
        amihan.alpha = 0;

        // Create a ping-pong animation: 1,2,3,2,1 (FlxSprite frames are 0-based)
        var animationFrames = [0, 1, 2, 1]; // 1,2,3,2 (frames 0,1,2,1)
        amihan.animation.add("shine", animationFrames, 2, true);
        amihan.animation.play("shine");
        add(amihan);

        // Tween to fade in to 0.7 opacity
        FlxTween.tween(amihan, {alpha: 0.20}, 1, {ease: FlxEase.quadOut});
    }
    
    function starEffect() {
        visualizer = new StarfieldSimple();
        visualizer.WIDE_PIXEL = true;
        visualizer.STAR_SPEED = 2;
        visualizer.STAR_ANGLE = 90;
        add(visualizer);
    }

    function addFullscreenButton():Void {
        fullscreenButton = new FlxButton(FlxG.width - 120, 20, "Fullscreen Test", function() {
            FlxG.fullscreen = !FlxG.fullscreen;
        });
        fullscreenButton.label.color = FlxColor.BLACK;
        fullscreenButton.width = 150;
        fullscreenButton.height = 200; // Increased height
        fullscreenButton.label.bold = true;

        add(fullscreenButton);
    }

    function BgMusic() {
        FlxG.sound.playMusic("assets/music/waves.ogg", 1.0, true);
        FlxG.sound.load("assets/music/light-10465.ogg").play(true);
        if (!FlxG.sound.music.exists) {
            trace("Error: Music file not found or failed to load.");
        }
    }

    // Testing fonts
    function dialogueText1() {
        displayText1 = new FlxText(50, 60, 400, "blocktopia.tff");
        displayText1.setFormat(null, 25, 0xFFFFFFFF);
        displayText1.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText1);
        autoType(displayText1, text1, 0.10);
    }

    function dialogueText2() {
        displayText2 = new FlxText(50, 100, 800, "blocktopia.tff");
        displayText2.setFormat(null, 25, 0xFFFFFFFF);
        displayText2.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText2);
        autoType(displayText2, text2, 0.08);
    }

    function remove0() {
        if (displayText1 != null) remove(displayText1);
        if (displayText2 != null) remove(displayText2);
    }

    function remove1() {
        if (displayText1 != null) remove(displayText1);
        if (displayText2 != null) remove(displayText2);
        if (displayText1 != null) remove(displayText3);
        if (displayText2 != null) remove(displayText4);
        if (displayText1 != null) remove(displayText5);
        if (displayText2 != null) remove(displayText6);
        if (displayText1 != null) remove(displayText7);
        if (displayText2 != null) remove(displayText8);
        if (displayText1 != null) remove(displayText9);
        if (displayText2 != null) remove(displayText10);
    }

    function dialogueText3() {
        remove0();

        displayText3 = new FlxText(50, 60, 800, "");
        displayText3.setFormat(null, 25, 0xFFFFFFFF);
        displayText3.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText3);
        autoType(displayText3, text3, 0.08);
    }

    function dialogueText4() {
        displayText4 = new FlxText(50, 100, 800, "");
        displayText4.setFormat(null, 25, 0xFFFFFFFF);
        displayText4.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText4);
        autoType(displayText4, text4, 0.08);
    }

    function dialogueText5() {
        displayText5 = new FlxText(50, 200, 800, "");
        displayText5.setFormat(null, 25, 0xFFFFFFFF);
        displayText5.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText5);
        autoType(displayText5, text5, 0.08);
    }

    function dialogueText6() {
        displayText6 = new FlxText(50, 240, 800, "");
        displayText6.setFormat(null, 25, 0xFFFFFFFF);
        displayText6.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText6);
        autoType(displayText6, text6, 0.08);
    }

    function dialogueText7() {
        displayText7 = new FlxText(50, 280, 800, "");
        displayText7.setFormat(null, 25, 0xFFFFFFFF);
        displayText7.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText7);
        autoType(displayText7, text7, 0.08);
    }

    function dialogueText8() {
        displayText8 = new FlxText(50, 320, 800, "");
        displayText8.setFormat(null, 25, 0xFFFFFFFF);
        displayText8.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText8);
        autoType(displayText8, text8, 0.08);
    }

    function dialogueText9() {
        displayText9 = new FlxText(50, 360, 800, "");
        displayText9.setFormat(null, 25, 0xFFFFFFFF);
        displayText9.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText9);
        autoType(displayText9, text9, 0.10);
    }

    var amihan2Sprite:FlxSprite; // Add this at the class level if you want to reference it elsewhere

    function Amihan2() {
        amihan2Sprite = new FlxSprite();
        amihan2Sprite.loadGraphic("assets/images/amihan.png", true, 800, 460);
        amihan2Sprite.scale.set(1.2, 1.2);
        amihan2Sprite.x = 450;
        amihan2Sprite.y = 240;
        amihan2Sprite.alpha = 0.20;
        var animationFrames = [3, 4, 5, 6, 7, 8, 9, 10];
        amihan2Sprite.animation.add("shine2", animationFrames, 2, true);
        amihan2Sprite.animation.play("shine2");
        add(amihan2Sprite);
        FlxTween.tween(amihan2Sprite, {alpha: 0.0}, 20, {ease: FlxEase.quadOut});
    }

    function dialogueText10() {
        displayText10 = new FlxText(50, 400, 800, "");
        displayText10.setFormat(null, 25, 0xFFFFFFFF);
        displayText10.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText10);
        autoType(displayText10, text10, 0.10);
    }

    // This one has the art
    function dialogueTex11() {
        art_1();
        remove1();
        displayText11 = new FlxText(460, 150, 800, "");
        displayText11.setFormat(null, 25, 0xFFFFFFFF);
        displayText11.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText11);
        autoType(displayText11, text11, 0.10);
    }

    function dialogueText12() {
        remove1();

        displayText12 = new FlxText(520, 560, 800, ""); // Set width
        displayText12.setFormat(null, 25, 0xFFFFFFFF);
        displayText12.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText12);
        autoType(displayText12, text12, 0.10);
    }

    function dialogueText13() {
        if (artA1 != null) {
            remove(artA1);
            artA1 = null;
        }
        remove1();
        if (displayText3 != null) remove(displayText10);
        if (displayText4 != null) remove(displayText11);
        if (displayText5 != null) remove(displayText12);

        displayText13 = new FlxText(540, 350, 800, "");
        displayText13.setFormat(null, 30, 0xFFFFFFFF);
        displayText13.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText13);
        autoType(displayText13, text13, 0.10);
    }

    // might remove this
    function removeAllDialogue() {
                // Remove previous dialogue texts
        if (displayText1 != null) remove(displayText1);
        if (displayText2 != null) remove(displayText2);
        if (displayText3 != null) remove(displayText3);
    }

    function removeAllDialogue1() {
        if (displayText1 != null) remove(displayText1);
        if (displayText2 != null) remove(displayText2);
        if (displayText3 != null) remove(displayText3);
        if (displayText4 != null) remove(displayText4);
    }

    function removeAllDialogue2() {
        if (displayText1 != null) remove(displayText1);
        if (displayText2 != null) remove(displayText2);
        if (displayText3 != null) remove(displayText3);
        if (displayText4 != null) remove(displayText4);
        if (displayText5 != null) remove(displayText5);

        if (artA1 != null) {
            remove(artA1);
            artA1 = null;
        }
    }     

    // THE AUTO TYPE THING
    function autoType(targetText:FlxText, text:String, speed:Float):Void {
        charIndex = 0;
        typing = true;
        hideContinueIcon(); // Hide if it was shown before
        targetText.text = "";

        var timer = new FlxTimer();
        timer.start(speed, function(t:FlxTimer) {
            targetText.text += text.charAt(charIndex);
            charIndex++;

            if (charIndex >= text.length) {
                typing = false;
                showContinueIcon(); // Show after typing finishes
                t.cancel();
            }
        }, text.length);
    }

    // Art placeholder
    // Has  Assets now
    public function art_1() {
        artA1 = new FlxSprite(0, 220);
        artA1.loadGraphic("assets/images/PlaceholderArt1.png");
        artA1.scale.set(1280 / artA1.width, 300 / artA1.height); // Scale the image to fit 1280x300
        add(artA1);
    }
    
    public function showContinueIcon() {
        // If it already exists, don't add again
        if (continueText != null && members.indexOf(continueText) >= 0) return;

        continueText = new FlxText(0, FlxG.height - 40, FlxG.width, "Tap Anywhere to Continue");
        continueText.setFormat(null, 18, 0xFFFFFFFF, "center");
        continueText.alpha = 0; // Start transparent
        add(continueText);

        // Tween to fade in
        FlxTween.tween(continueText, {alpha: 0.4}, 1, {ease: FlxEase.quadOut});
    }

    public function hideContinueIcon() {
        if (continueText != null) {
            remove(continueText);
            continueText = null;
        }
    }

    function PlaceholderBOX() {
        removeTheSixText();

        var boxPlaceholder = new FlxSprite();
        boxPlaceholder.makeGraphic(320, 120, FlxColor.RED);
        boxPlaceholder.x = 30;
        boxPlaceholder.y = 50;
        add(boxPlaceholder);

        displayText14 = new FlxText(380, 100, 800, "");
        displayText14.setFormat(null, 25, 0xFFFFFFFF);
        displayText14.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText14);
        autoType(displayText14, text14, 0.10);
    }

    function removeTheSixText() {
        remove1();
        if (artA1 != null) {
            remove(artA1);
            artA1 = null;
        }
        if (displayText2 != null) remove(displayText11);
        if (displayText2 != null) remove(displayText12);
        if (displayText2 != null) remove(displayText13);
    }

    function PlaceholderBOX1() {
        removeTheSixText();

        var boxPlaceholder0 = new FlxSprite();
        boxPlaceholder0.makeGraphic(450, 140, FlxColor.RED);
        boxPlaceholder0.x = 100;
        boxPlaceholder0.y = 220;
        add(boxPlaceholder0);

        displayText15 = new FlxText(580, 280, 800, "");
        displayText15.setFormat(null, 25, 0xFFFFFFFF);
        displayText15.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText15);
        autoType(displayText15, text15, 0.08);
    }

    function removePlaceholder() {
        if (displayText14 != null) remove(displayText14);
        if (displayText15 != null) remove(displayText15);
        if (boxPlaceholder != null) remove(boxPlaceholder);
        if (boxPlaceholder0 != null) remove(boxPlaceholder0);
    }

    function PlaceholderBOX2() {
        removeTheSixText();
        removePlaceholder();

        var boxPlaceholder1 = new FlxSprite();
        boxPlaceholder1.makeGraphic(200, 280, FlxColor.ORANGE);
        boxPlaceholder1.x = 540;
        boxPlaceholder1.y = 220;
        add(boxPlaceholder1);

        displayText16 = new FlxText(580, 280, 800, "");
        displayText16.setFormat(null, 25, 0xFFFFFFFF);
        displayText16.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText16);
        autoType(displayText16, text16, 0.08);
    }

    function PlaceholderBOX3() {
        removeTheSixText();

        var boxPlaceholder = new FlxSprite();
        boxPlaceholder.makeGraphic(200, 260, FlxColor.ORANGE);
        boxPlaceholder.x = 540;
        boxPlaceholder.y = 400; // Start at original position (down)
        add(boxPlaceholder);

        // Tween the box up to y = 200
        FlxTween.tween(boxPlaceholder, {y: 200}, 1, {ease: FlxEase.quadOut});

        displayText17 = new FlxText(580, 280, 800, "");
        displayText17.setFormat(null, 25, 0xFFFFFFFF);
        displayText17.font = "assets/fonts/SHPinscher-Regular.otf";
        add(displayText17);
        autoType(displayText17, text16, 0.08);
    }

    function Skip() {

    }
}
