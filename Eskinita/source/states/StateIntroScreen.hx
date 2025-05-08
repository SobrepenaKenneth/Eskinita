package states;

import djFlixel.gfx.StarfieldSimple;
import djFlixel.gfx.shader.CRTShader;
import djFlixel.ui.FlxAutoText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import openfl.filters.ShaderFilter;

// This is such a stupid name fr fr i'll fix this later
class StateIntroScreen extends FlxTransitionableState
{
    var studioGunita:FlxText;
    private var visualizer:StarfieldSimple;
    private var visualizerCRT:CRTShader;
	private var AutoText:FlxAutoText;

    override public function create():Void {
        super.create();
        // Calling those Functions order matters
        playMusic();
        blackBoxBG();
        crtScanner();
        BarVisualizer();
        Text_StudioGunita();
        textFade();

    }

    // This are the functions that do stuff
    public function blackBoxBG() {
        var blackBox = new FlxSprite(0, 0);
        blackBox.makeGraphic(1280, 720, FlxColor.BLACK);
        add(blackBox);
    }

    public function crtScanner() {
        // CRT Shader
        visualizerCRT = new CRTShader();
        visualizerCRT.BLUR_STR = 0.8;
        FlxG.game.setFilters([new ShaderFilter(visualizerCRT)]);
    }

    public function BarVisualizer() {
        // Bar Visualizer
        visualizer = new StarfieldSimple();
        visualizer.WIDE_PIXEL = true;
        visualizer.STAR_SPEED = 1.9;
        visualizer.STAR_ANGLE = 90;
        add(visualizer);
    }

    public function playMusic() {
        // Music
        FlxG.sound.playMusic("assets/music/takbo.ogg", 1.0, true);
    }

    private function Text_StudioGunita() {
        // Text
        studioGunita = new FlxText(0, 0, 0, "Studio Gunita");
        studioGunita.setFormat(null, 32, FlxColor.WHITE, "center");
        studioGunita.screenCenter();
        studioGunita.alpha = 0;
        add(studioGunita);
        
    }

    public function textFade() {
        // Fade in
        FlxTween.tween(studioGunita, {alpha: 1}, 1, {ease: FlxEase.quadIn});

        // Fade out and transition
        FlxTween.tween(studioGunita, {alpha: 0}, 1, {
            startDelay: 5,
            ease: FlxEase.quadOut,
            onComplete: function(_) {
                FlxG.game.setFilters([]); // Clear the CRT effect
                var trans = new TransitionData();
                trans.color = FlxColor.BLACK;
                FlxG.switchState(states.IntroScreen.new);
            }
        });
    }
    
}