package scene;


import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;

class MainMenu extends FlxState {

    var StartBtn:FlxButton;

    override public function create():Void
	{
		super.create();
        Startbutton();
        optionbutton();
        Creditbutton();
        Exitbutton();       
	}

    public function Startbutton(){
        StartBtn = new FlxButton();
        var StartBtn = new FlxButton(0, 0, "NewGame", StartGame);
        StartBtn.screenCenter();
        StartBtn.y = 50;
        add(StartBtn);
    }

    public function optionbutton(){
        StartBtn = new FlxButton();
        var StartBtn = new FlxButton(0, 0, "Options", OptionGame);
        StartBtn.screenCenter();
        StartBtn.y = 100;
        add(StartBtn);
    }

    public function Creditbutton(){
        StartBtn = new FlxButton();
        var StartBtn = new FlxButton(0, 0, "Credits", CreditGame);
        StartBtn.screenCenter();
        StartBtn.y = 150;
        add(StartBtn);
    }

    public function Exitbutton(){
        StartBtn = new FlxButton();
        var StartBtn = new FlxButton(0, 0, "Exit", ExitGame);
        StartBtn.screenCenter();
        StartBtn.y = 200;
        add(StartBtn);
    }

    public function StartGame() {
        FlxG.switchState(ChapterSelection.new);
    }

    public function OptionGame() {
        trace("OptionButton has been clicked");
    }

    public function CreditGame() {
        trace("CreditButton has been clicked");
    }

    public function ExitGame() {
        trace("ExitButton has been clicked");
    }

}