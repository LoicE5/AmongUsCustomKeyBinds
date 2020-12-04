# Custom KeyBinds & Sabotage Automation for Among Us using AutoHotKey

## What is Among Us ?

Among Us is a multiplayer game developed by Innersloth, a small game development company. The game experienced an exponential growth at the beginning of this decade, thanks to some famous streamers that started to play this game and livestream their gameplays online.

The principle is quite simple. 4 to 10 players are on a map. Among them, 1 to 3 are imposters. The others are crewmates.<br>
The crewmates's goal is to accomplish tasks in order to fill a quota and win the game, or find the imposter(s) and vote him/them out.<br>
The imposter's goal is to kill all the crewmates without being discovered, or make a critical sabotage without having it defused by the crew.
<br><br>
In every game, everyone can call an emergency meeting once, that instantly brings every player in a room and open a chat and a kind of voting booth, in order to discuss about thoughs and evidences to find the imposter(s).<br>
In the same vein, when a corpse is discovered by a player, it can be reported, which leads to the same meeting.
<br><br>
In this game, the imposters can proceed to several kind of sabotages. The following script helps to automate four of them :
<br>

* Lights : Suddenly reduces the visibility of every crewmate to almost zero.
* O2 : Deplets oxygen. The crew have several tens of seconds to get to two places and enter a code to stop the sabotage. Otherwise, the imposter(s) wins.
* Reactor : Similar to the previous one, the crew must go to two places and hold a button (which actually is a hand scanner) at the same time in order to stop the sabotage. Otherwise, the imposter(s) wins.
* Comms : Disable all the cameras and monitoring systems. Make the crewmate's tasklist invisible. 


## How is this script useful?

Innersloth did not implement a custom keybinding option in their game. In that way, every player is condemned to play with a QWERTY keyboard layout and without the ability to use the keys that they want to do specific actions.<br>
When playing the game on an emulator (such as [BlueStacks](https://www.bluestacks.com/fr/index.html)), you have the ability to custom your keybinds, and play with whatever key you wish. On the PC Steam version, it's not possible. This script solves this issue, and does even more.

## Prerequisites

In order to correctly run this program, you will need to have AutoHotKey installed. You can install it like any other Windows software.

**[Click here to get to the AutoHotKey download page !](https://www.autohotkey.com/)**

_You just need to press "Download", then "Download current version", and let yourself be guided._

## Binding keys
Once you will have downloaded the project from GitHub, you will just have to double-click on the _"AmongUsCustomKeybinds.ahk"_ file to execute it. A small icon will appear in the Windows status bar (bottom-right of your screen).

Now, you will have my personnal configuration. In order to understand the program the best, here is my key bindings :

I have an AZERTY keyboard. I then use ZQSD rather then WASD to move around.<br>
I report a dead body with E.<br>
I kill with F.<br>
I use Shift rather than Esc to leave a focused view.<br>
I disabled the A & W keys (because I don't use them).<br>
I use 1, 2, 3, 4 to respectively sabotage Lights, O2, Reactor and Communications.<br>
I use Win+F1 to temporarely disable the custom keybinds (useful for in-game chatting) and the same combination to re-enable them.

So, how is this in practice ?

Well, in the code, between the two main brackets (right after _#IfWinActive, Among Us_), you can see the following syntax :

<code>z::w</code><br>
<code>q::a</code><br>
<code>f::q</code><br>
<code>e::r</code><br>

On the left of the **::**, you will have your custom key, and on the right, your target key that will be emulated. As an example above, I want to move upwards with Z. When I press Z, AutoHotKey will send the W input to Among Us. In other words, when I press Z, Among Us will recognize that I press W and will move me forward.
<br><br>
Once you have understood this principle, you can modify the code acordingly to fit your needs. A full list of defaults Among Us keys is available :

<table>
<tbody>
<tr>
<td><b>Primary Key</b></td>
<td><b>Secondary Key</b></td>
<td><b>Key Action</b></td>
</tr>
<tr>
<td>W+A+S+D</td>
<td>Arrow Keys</td>
<td>Character movement</td>
</tr>
<tr>
<td>E</td>
<td>Space<br>
Left mouse click</td>
<td>Using an object</td>
</tr>
<tr>
<td>Q</td>
<td></td>
<td>Perform Kill</td>
</tr>
<tr>
<td>R</td>
<td></td>
<td>Report a body</td>
</tr>
<tr>
<td>ESC</td>
<td></td>
<td>Escape a focused task</td>
</tr>
<tr>
<td>TAB</td>
<td></td>
<td>Toggle Map View</td>
</tr>
<tr>
<td>ALT + Enter</td>
<td></td>
<td>Toggle Fullscreen</td>
</tr>
<tr>
<td>E</td>
<td>Space</td>
<td>Sabotage (as an Imposter)</td>
</tr>
<tr>
<td>ALT + CAPS</td>
<td>ALT + TAB</td>
<td>Toggle Mute on Discord (Custom key bind)</td>
</tr>
</tbody>
</table>

Credits : [Nerdschalk](https://nerdschalk.com/among-us-keyboard-controls/)

Let's move to some weirder keybinds :

<code>a::return</code><br>
This just disable the A key on my keyboard for Among Us, preventing unwanted actions.

<code>t::Click, 33, 127  ;</code><br>
The T key toggle the tasklists by simulating a click at the relevant place on the screen.

>_The coordinates have been tested and are functional on a 1920x1080 monitor. I cannot guarantee that they will be operationnal on a monitor with another definition._

<code>c::Click, 1513, 125  ;</code><br>
Same here for the chat on an emergency meeting.

<code>#F1::Suspend  ;</code><br>
The Win+F1 combination temporarely suspends all the custom keybindings. It's useful when you want to enter a room code or chat in the game... You can of course customize this shortcut.

<code>&::sabotage("sabotage/elec2.jpg")	;</code><br>
Pressing the & (1) key of the keyboard will automatically sabotage the lights, whatever the map is. It is the topic of the following topic.

## Automatic sabotage

When you are impostor, sabotage is a part of your journey. However, the faster you sabotage, the better your killing opportunities can be.

That's what the <b>sabotage(</b>_path_<b>)</b> function does. With it, you can automatically assign any key to sabotage the lights, the o2, the reactor or the comms.

### How to use it ?

Quite simple ! In the main brackets (with the other keybinds), you simply have to respect the following nomenclature :

<code>YourKey::sabotage("sabotage/elec2.jpg")	;</code> for the lights<br>
<code>YourKey::sabotage("sabotage/comm.jpg")	;</code> for the communications<br>
<code>YourKey::sabotage("sabotage/o2.jpg")	;</code> for the o2<br>
<code>YourKey::sabotage("sabotage/reactor.jpg")	;</code> for the reactor<br>

>**Beware !** As long as this function press SpaceBar when executed, do not use it when you are near a vent or near the emergency button. Instead of sabotage, the vent (or emergency) might be triggered, which might reveal your role to other players nearby.

### How does it works ?

What it does is quite simple to understand :

1. We open the sabotage menu by emulating a SpaceBar press
2. The algorithm search within the screen the reference image corresponding to the required sabotage. Once found, it keeps the coordinates under two variables X & Y.
3. It then emlulates a mouse left click at those coordinates, which trigger the sabotage.
4. The sabotage menu is automatically closed thanks to an Esc key emulation.

The reference images are the following :

![elec2](sabotage/elec2.jpg)
![o2](sabotage/o2.jpeg)
![reactor](sabotage/reactor.jpeg)
![comm](sabotage/comm.jpeg)

And here is the commented function :

![commented script](https://www.pixenli.com/miniature/hFejm0nV)

## Notes

If you have any questions or keys of improvement, you can reach me [here](https://www.linkedin.com/in/loic-etienne/) or directly on GitHub !