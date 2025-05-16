
# The Weavers of Dusk

Concept By: Kyle Acosta 

In the coastal town of Himbing Bay where firefly trees illuminate the shoreline and time moves differently during the annual "Ghost Tide," 16-year-old Amihan discovers she can enter the "Pusô" (heart-space) of people by touching objects meaningful to them. Inside these emotional landscapes, memories appear as intricate woven patterns that can be unraveled or reinforced.

# GAME MADE IN HAXEFLIXEL ON THE WORKS

# PROGRESS AND NEW STUFF
- temporarily removed the buttom
- added some gfx

# Issues
- in Act 1 dialogueText5 and 6 is not working properly

# Fixes
- (A3, A4, A5) fixed

## Programming (Still learning lol..)

- [@x40arcade](https://github.com/SobrepenaKenneth)

## Artist / Writer

- [@Steveluv Arts](https://www.instagram.com/steveyarts/)

## Writer / PlayTester

- [@Steveluv Arts](https://www.instagram.com/steveyarts/)

        // This is here temporarily in case the player wants this in settings
        virtualPad = new FlxVirtualPad(FlxDPadMode.NONE, FlxActionMode.A);
		add(virtualPad);

        virtualPad.scale.set(2,2);

        virtualPad.getButton(A).x -= 20; // move left
        virtualPad.getButton(A).y -= 20;