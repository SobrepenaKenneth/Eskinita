package unangkabanata;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.effects.particles.FlxParticle;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class DialogueBox extends FlxGroup {
    public var displayText:FlxText;
    public var dialogues:Array<String>;
    public var isFinished:Bool = false;

    var fullText:String = "";
    var currentIndex:Int = 0;
    var charIndex:Int = 0;
    var typingTimer:FlxTimer;
    var isTyping:Bool = false;

    public function new(dialogues:Array<String>, x:Float = 20, y:Float = 300, width:Int = 600) {
        super();

        this.dialogues = dialogues;

        displayText = new FlxText(x, y, width, "");
        displayText.setFormat(null, 20, 0xFFFFFFFF);
        displayText.x = 0;
        displayText.y = 0;
        add(displayText);

        showNextDialogue();
    }

    public function updateBox():Void {
        if (FlxG.mouse.justPressed || FlxG.keys.justPressed.SPACE) {
            if (isTyping) {
                typingTimer.cancel();
                displayText.text = fullText;
                isTyping = false;
            } else {
                showNextDialogue();
            }
        }
    }

    function showNextDialogue():Void {
        if (currentIndex >= dialogues.length) {
            isFinished = true;
            return;
        }

        fullText = dialogues[currentIndex];
        currentIndex++;
        displayText.text = "";
        charIndex = 0;
        isTyping = true;

        typingTimer = new FlxTimer();
        typingTimer.start(0.03, onType, fullText.length);
    }

    function onType(timer:FlxTimer):Void {
        displayText.text += fullText.charAt(charIndex);
        charIndex++;
        if (charIndex >= fullText.length) {
            isTyping = false;
        }
    }
}

