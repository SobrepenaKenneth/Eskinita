package states;

import djFlixel.gfx.StarfieldSimple;
import djFlixel.gfx.shader.CRTShader;
import djFlixel.ui.FlxAutoText;
import flixel.FlxCamera;
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
class Intro extends FlxTransitionableState
{
    var studioGunita:FlxText;
    var presents:FlxText;
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
        Text_Presents();
        textFade();
        textFade2();
        cameraTest();

    }

    // This are the functions that do stuff
    public function blackBoxBG() {
        var blackBox = new FlxSprite(0, 0);
        blackBox.makeGraphic(1280, 720, FlxColor.BLACK);
        add(blackBox);
    }

    private function crtScanner() {
        // CRT Shader
        visualizerCRT = new CRTShader();
        visualizerCRT.BLUR_STR = 0.8;
        FlxG.game.setFilters([new ShaderFilter(visualizerCRT)]);
    }

    public function BarVisualizer() {
        // Bar Visualizer
        visualizer = new StarfieldSimple();
        visualizer.WIDE_PIXEL = true;
        visualizer.STAR_SPEED = 2;
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
        studioGunita.setFormat(null, 64, FlxColor.WHITE, "center");
        studioGunita.screenCenter();
        studioGunita.alpha = 0;
        add(studioGunita);
    }

    private function Text_Presents() {
        presents = new FlxText(0, 0, 0, "Presents");
        presents.setFormat(null, 34, FlxColor.WHITE, "center");
        presents.screenCenter();
        presents.y += 50; // Move the text down by 50 pixels
        presents.alpha = 0;
        add(presents);
    }

    public function textFade() {
        // Fade in
        FlxTween.tween(studioGunita, {alpha: 1}, 10, {ease: FlxEase.quadIn});

        // Fade out and transition
        FlxTween.tween(studioGunita, {alpha: 0}, 10, {
            startDelay: 10,
            ease: FlxEase.quadOut,
            onComplete: function(_) {
                FlxG.game.setFilters([]); // Clear the CRT effect
                var trans = new TransitionData();
                trans.color = FlxColor.BLACK;

            }
        });
    }

    public function textFade2() {
        FlxTween.tween(presents, {alpha: 1}, 10, {
            ease: FlxEase.quadIn,
            onStart: function(_) {
                presents.alpha = 0; // Ensure alpha starts at 0
            }
        });
        FlxTween.tween(presents, {alpha: 1}, 10, {ease: FlxEase.quadIn});

        // Fade out and transition
        FlxTween.tween(presents, {alpha: 0}, 10, {
            startDelay: 10,
            ease: FlxEase.quadOut,
            onComplete: function(_) {
                FlxG.game.setFilters([]); // Clear the CRT effect
                var trans = new TransitionData();
                trans.color = FlxColor.BLACK;
            }
        });
        
    }

    function Transition() {
        
    }

    // UNG CAMERA TEST WHHAHAHA
    function cameraTest() {
        FlxG.camera.zoom = 2; // Start zoomed in

        FlxTween.tween(FlxG.camera, {zoom: 1}, 10, {
            ease: FlxEase.quadOut,
            onComplete: function(_) {
                // Wait a bit, then zoom back in and exit
                FlxTween.tween(FlxG.camera, {zoom: 2}, 5, {
                    ease: FlxEase.quintIn,
                    onComplete: function(_) {
                        FlxG.switchState(states.IntroScreen.new);
                    }
                });
            }
        });
    }

    public function exitScene():Void {
        // Clear the CRT effect before transitioning to the next state
        FlxG.game.setFilters([]);
        FlxTween.tween(FlxG.camera, {zoom: 2}, 10, {
            ease: FlxEase.quintIn,
            onComplete: function(_) {
                FlxG.switchState(states.IntroScreen.new);
            }
        });
    }
}