package;
import djFlixel.core.Dtext;
import djFlixel.gfx.StarfieldSimple;
import djFlixel.gfx.shader.CRTShader;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import openfl.filters.ShaderFilter;


class IntroScreen extends FlxTransitionableState
{
    var studioGunita:FlxText;
    private var visualizer:StarfieldSimple;
    private var visualizerCRT:CRTShader;

    override public function create():Void {
        super.create();
        // Music
        FlxG.sound.playMusic("assets/music/takbo.ogg", 1.0, true);

        // CRT Shader
        visualizerCRT = new CRTShader();
        visualizerCRT.BLUR_STR = 0.8;
        FlxG.game.setFilters([new ShaderFilter(visualizerCRT)]);

        // Bar Visualizer
        visualizer = new StarfieldSimple();
        visualizer.WIDE_PIXEL = true;
        visualizer.STAR_SPEED = 1.9;
        visualizer.STAR_ANGLE = 90;
        add(visualizer);

        // Background
        var blackBox = new FlxSprite(0, 0);
        blackBox.makeGraphic(1280,720, FlxColor.BLACK);
        add(blackBox);

        // Text
        studioGunita = new FlxText(0, 0, 0, "Studio Gunita");
        studioGunita.setFormat(null, 32, FlxColor.WHITE, "center");
        studioGunita.screenCenter();
        studioGunita.alpha = 0;
        add(studioGunita);

        // Fade in
        FlxTween.tween(studioGunita, {alpha: 1}, 1, {ease: FlxEase.quadIn});

        // Fade out and transition
        FlxTween.tween(studioGunita, {alpha: 0}, 1, {
            startDelay: 5,
            ease: FlxEase.quadOut,
            onComplete: function(_) {
                var trans = new TransitionData();
                trans.color = FlxColor.BLACK;
                FlxG.switchState(IntroScreen2.new);
            }
        });
    }
}