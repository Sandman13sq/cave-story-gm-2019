Readme for Cave Story GM by Sandman/Dreamer/zacal169

v0.0.2
12-14-22

- Updated project to GMS2.3+
	- GMS2 v2.3 features are used in bug fixes only.
- Game now starts at mimimum resolution 960x540.
- Updated title art.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

v0.0.1
10-1-19

Welcome to my unfinished Cave Story Engine written in Game Maker Studio 2.
It's a demo that is mostly complete until the end of the Egg Corridor.

DISCLAIMER:

Cave Story GM is a fan work for Cave Story by Daisuke "Pixel" Amaya.
If you like this, support the offical release(s) of Cave Story.

Latest Release (Switch Version):
https://nicalis.com/games/cavestory+

Tribute Site:
https://www.cavestory.org

=== Key Things ==============================================================================

- There WILL be several of bugs and issues while playing. I'm releasing this now so I don't regret not doing so years down the line.
- The engine has not been tested on multiple devices. This could slow down considerably on lower-end devices.
- From a new profile, the game can only be played up to the entry of the Gum Room. From there, the game will soft lock due to no boss existing for Balfrog.
- The game reads from files in the English Cave Story from www.cavestory.org
	- Meaning the Aeon Genesis translation is used.
- Halfway into development, I tried to steer this project into a more sandbox-ey type of engine where players can load a bunch of external data. There are several leftovers of it in how the game runs. (See "Other Things" below)
	- With that being said, the "Mods" folder needs to be present for the game to run correctly.

=== Initial Controls ========================================================

* Keyboard * --------------------------------------

Left Arrow Key - Move Left
Up Arrow Key - Move Up
Right Arrow Key - Move Right
Down Arrow Key - Move Down

Z - Jump, Confirm, Boost (with any Booster Equipped)
X - Shoot, Back
C - Menu

Shift - Map
A - Previous Weapon
S - Next Weapon
Control - Force Aim Left
Alt - Force Aim Right

* Gamepad * --------------------------------------

D-Pad Left - Move Left
D-Pad Up - Move Up
D-Pad Right - Move Right
D-Pad Down - Move Down

Button 1 (PS4 Cross, XBox A) - Jump, Confirm, Boost (with any Booster Equipped)
Button 3 (PS4 Square, Xbox X) - Shoot, Back
Button 4 (PS4 Triangle, Xbox Y) - Menu

Button 2 (PS4 Circle, Xbox B) - Map
Button 5 (Left Bumper) - Previous Weapon
Button 7 (Right Bumper) - Next Weapon
Button 6 (Left Trigger) - Lock Aim Left
Button 8 (Right Trigger) - Lock Aim Right

- The Force Aim keys aren't practical for keyboard. They're there more for gamepad users.
- If you want to change the controls, go to the title screen, select Options, then select Control Settings.
	- Choose an input to change, press the desired key/button before the timer runs out and the button will be set.
		- Let the timer run out to clear the input completely.

=== Title Screen ==============================================================================

Play - Start in a stage to play in
Options - Change game settings
Disclaimer - View my attempt at dodging legal stuffs

* Play * --------------------------------------

Game Profiles - Load a saved profile or start a new game
Load Vanilla Map - Choose from a Cave Story map to play on
	Enter Map Name - Enter a maps name and go there instantly
		- If the map is not found, the game will restart
	Choose From Grid - Pick a map from a list
		- The game will freeze for a sec. Takes a while to load all of the previews
Load Room - Choose some of my testing grounds for making the engine
	- rm_debug00 is probably the only interesting one.
	- Shows that maps can be loaded from the original files and from Game Maker rooms.

* Options * --------------------------------------

General - Change music volumes
Game Settings - Toggle Certain game flags
	Start with Booster v0.1 - Give player a double jump
	Use Original Faces - Weirded out by my art style? No worries. This enables the vanilla faces in text boxes and profiles
	Use Dream Story Font - Toggle between Courier New and Dream Story font for text
		- Most of my testing was done with the latter.
	Energy Gravitation - If set, Weapon Energy will slowly move to the player if nearby
	Show Debug Info - Shows extra information in game and on screen.
Control Settings - Change key/button mappings.

- Profiles and settings are stored in C:\Users\<USERNAME>\AppData\Local\Cave_Story_GM
- Press F4 to go toggle fullscreen.
	- The intro menu may look weird when in fullscreen.

=== New Weapons ==============================================================================

Shark - A heat-seeking missile launcher.
	Lv1 - Tracks enemy position with slow turn speed.
	Lv2 - Tracks enemy position with slow turn speed. More damage.
	Lv3 - Tracks enemy position with high turn speed. More damage and speed.

Tempest - Shoots water elements.
	Lv1 - Shoots a bubble.
	Lv2 - Shoots a rush of water.
	Lv3 - Shoots a whirlpool. Charge and release to shoot a tempest that chases and damages enemies.

Edge - A high-caliber magnum.
	Lv1 - Shoots a quick bullet with a huge kick back. Must wait between shots.
		- Try shooting downwards at the start of a jump for more ups!

Grenade Launcher - Launches bouncing grenades that hurt before and after they blow up.
	Lv1 - Explodes if impact does not defeat enemy.
	Lv2 - Ricochets if impact defeats enemy.
	Lv3 - Ricochets if impact defeats enemy. More damage and size.

- Not all of the vanilla weapons are present. List below:
	Present:
		Polar Star
		Fireball
		Machine Gun
		Snake
		Missile Launcher
		Super Missile Launcher
		Spur
	Absent:
		Bubbler
		Blade
		Nemesis

=== New Features (Over Original) ==============================================================================

Gameplay
- Energy crystals can hover towards the player.
- Weapon Energy gained will now overflow into the next level instead of being cut off on level up.
- Weapon Energy for held weapon will not be collected if level is at max.
- Hold down while running to aim and shoot backwards.
- Inputs for jumping and searching (pressing down on an NPC) can be buffered.
- Hold Map and Jump to skip past part of an event. (Works for text and waiting)

Presentation
- Some new sprites for characters and weapons.
- Music that has not played in-game recently will show its title on the top of the screen.
- Text boxes now have an animated border.
- Some sounds are position based.
- Title screen background and music is randomized.
- Stages can load more than one tileset. (See rm_sewer_1)
- New game over animation.

=== Other Things ==============================================================================

- Theoretically, you could load custom maps into this engine. There are some hangups though:
	- Custom entities are not possible outside of coding them in the game's project file. (Wouldn't really be custom then)
	- Since the Cave Story's map properties are in the .exe file, another file, "mapproperties.ini" is used to load properties externally. You could add a map to the stage folder, add the required properties and run it.
	- Not all script commands are accounted for in the engine.
- There is a way to load music externally as well with the "musicsettings.ini" file:
	- The music file (must be .ogg file format) has to be placed in the "Music" folder of a mod folder.
	- For each file in the music folder the game will check in the musicsettings.ini file for an index to map the music to (referenced with the <CMU command), a title to display, the starting sample position of the song, and the ending sample position.
		- For an example, from the MusicExample folder drag "Calm.ogg" to the Music folder in the Classic mod folder. Then drag the "musicsettings.ini" file to the Classic mod folder (not the music folder, just the root). This will replace "Mimiga Town".
	- No, there is no support for the organya format.

- Yes, the pixel resolutions of most sprites and tiles are inconsistent. The idea was to draw new art for everything since I wanted double resolution graphics but didn't want to use Cave Story +'s art.

- Press the "I" key in the pause menu to give items.

- Right-click anywhere on screen to teleport there.

=== Debug Controls ==============================================================================

To use these controls, hold the Tab key and press one of the letter keys listed below:
E - Exit event
R - Restart Game
P - Take Screenshot
W - Toggle event script display on screen
D - Toggle debug information
3 - Toggle Game Maker debug overlay
L - Toggle console info

================================================================================================

I used CaveEditor a lot for reference when coding this thing. Not as a code-base, but to see maps and the such.
	There's a better editor called Booster's Lab but I've used CaveEditor too long to want to switch.
	Same case with Game Maker and other IDEs.
SeaTone/CTone was used to create extra sound effects.

Learning the inner workings of Cave Story to make this thing was great.
The best thing to come out of this, funnily enough, was finding Game Maker Studio's limits.
Halfway into development, I started focusing on making this engine as sandbox-ey as possible.
Turns out Game Maker isn't too good for that type of stuff outside of having the IDE itself.
The best I'd be able to do is something akin to Mario Maker.
I think something in C++ is better for what I tried to do here.

Thank you for your time,
zacal169/Dreamer
