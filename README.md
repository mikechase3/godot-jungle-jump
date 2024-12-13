# Jungle Smash Game Design Document
This is an evolving document. See the latest version [here](https://github.com/24F-CPS499-GameDesign-JungleJump/chasem3).

## Game Overview
TODO: Picture Here


*Jungle smash* is an arcade-style platform endless-runner developed using the Godot engine.
Players navigate Frank the Fox through a jungle filled with enemies, avoiding their
attacks, and striving to collect the most cherries by defeating obstacles and collecting
power ups.

* **Title**: Jungle Smash
* **Genre**: Endless Runner Arcade Game
* **Target Audience**: intended for players particularly fond of endless runners and simple,
platformer experiences.
* **Platform**: For use on desktop platforms (Linux, macOS, Windows) and Web (HTML5).

## Game Mechanics
### Core Gameplay
In *Jungle Smash*, players control Frank the Fox as he navigates a jungle filled with dangerous animals. 
The game is an endless runner where Frank must collect food & gems while avoiding or defeating enemies. 
Players guide Frank through diverse paths, including tree tops and underground caves, 
as he moves toward his goal of reaching the next level's door.  

- **Movement**: Frank moves to the right or along the path. 
  - If a wall blocks the way, players may need to climb a tree or go underground through caves to continue.  
- **Enemies**: Jungle animals such as serpents and bears block Frank's path. 
  - Players can choose to avoid them or stomp on their heads to defeat them.  

### Controls
In the prototype version, individuals can use:

| Key   | Action             |
|-------|--------------------|
| W     | Move up            |
| S     | Move down          |
| A     | Move Left          |
| D     | Move Right         |
| Space | Jump / Double Jump |

Xbox controller is not supported in the prototype.

#### Release Version
* Keyboard: same as the prototype
* Xbox Controller:
  * Left Stick: Movement
  * A Button: Jump & Double Jump

Future implementations may include wall-jumping, 
though this feature is not present in the prototype.


### Player Progression

#### Prototype Version:
* The player must guide Frank the Fox to a door at te end of each static level.
* Levels are pre-designed, and the prototype contains three unique levels.
* To progress, Frank must collect food, avoid or defeat enemies, and press "Up" upon reaching the door to the next level.

#### Release Version:
* The game will feature procedurally generated levels based off a seed for endless playability.
* Progression will involve an evolving difficulty curve and the inclusion of more enemy types and power ups. 

## Challenges and Obstacles
#### Prototype Version
* **Enemies** are basic and move along the ground.