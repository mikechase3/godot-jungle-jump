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
In the prototype, enemies will walk along a platform in a straight line and
change direction when hitting an obstacle.

The release version will contain more complex platformer enemies through an
expanded enemy roster. Serpents will slither along the ground. Bears will block
pathways. Monkeys can jump from platform toi platform. Panthers will charge
at the player when in range. Tropical birds will fly across the screen creating
an airborne hazard. Poisonous frogs and snakes will leave harmful poisonous
puddles after hopping away.

Each of the complex enemies will have their own sound effect and visual cue to signal their attacks,
giving players an opportunity to react in advance.

Jumping on an enemy's head will defeat it and may leave behind reward items.

## Story and Narrative

### Plot
Frank the Fox is on a mission to save the jungle and its inhabitants from the destructive behaviors of humanity. 
After witnessing the tragic death of his friend, Mister Turtle, caused by humanity's wastefulness, 
Frank vows to put an end to human greed and recklessness. 
Equipped with newfound intelligence from a discarded Neuralink device and the knowledge gained from ChatGPT, 
Frank begins his journey to escape the jungle. 
Once free, he will target humanity's critical infrastructure, starting a fight to halt
environmental destruction and give nature a chance to heal.  

This chapter of Frank's story focuses on his perilous journey through the endless jungle,
where dangerous animals and environmental challenges stand between him and his ultimate goal.
(In a sequel, he shall face the humans)

### Characters

| Character            | Abilities                      | Sound Effect         | Visual Cue                        |
|----------------------|--------------------------------|----------------------|-----------------------------------|
| **Frank the Fox**    | Double jump, stomp enemies     | None (player avatar) | Agile and quick animations        |
| **Serpent**          | Slithers along the ground      | Hiss                 | Coiling motion before moving      |
| **Bear**             | Blocks paths, slow movement    | Deep growl           | Shakes ground when close          |
| **Monkey**           | Jumps between platforms        | Chittering           | Swinging arms before jumping      |
| **Panther**          | Charges at the player          | Roar                 | Low crouch before charging        |
| **Tropical Bird**    | Flies across the screen        | Chirp                | Flapping wings animation          |
| **Poison Dart Frog** | Hops and leaves poison puddles | Croak                | Bright color flashes when hopping |

### Setting
- **Jungle Environment**: The game takes place in a dense, vibrant jungle filled with towering trees, winding caves, and dangerous wildlife.  
- **Dynamic Time of Day**: In the release version, the game's visual color palette will sync with the player's local clock, providing a unique look depending on the time (e.g., sunrise, midday, sunset, night).  
- **Prototype Version**: The jungle is always set during daylight hours.  

### Backstory and Lore
Frank the Fox’s journey began with heartbreak. 
One fateful day, he watched as his friend, Mister Turtle, was struck in the eye by a plastic straw. 
Blinded and disoriented, Mister Turtle stumbled into another straw.
Even more blinded and disoriented, Mister Turtle eventually fell off a cliff to his death.  

Devastated, Frank vowed to avenge his friend and protect the jungle. 
His determination led him to a discarded Neuralink device, which granted him human-like intelligence. 
Using the device, Frank accessed a smartphone and learned about humanity’s vulnerabilities through ChatGPT. 
Now armed with knowledge, Frank's ultimate goal is to dismantle humanity's infrastructure, 
starting with their mass-manufacturing systems, to stop their reckless destruction of the planet.  

This game tells the beginning of his epic struggle to escape the endless jungle,
setting the stage for his larger battle against humanity in future chapters.

## Art and Aesthetics
TODO: revise chat-gpt aided content:

### Visual Style
The game embraces an **8-bit pixel art aesthetic**, reminiscent of classic Sega Genesis titles like *Sonic the Hedgehog*. The visuals are vibrant, colorful, and evoke a retro arcade feel while maintaining a modern, polished presentation. Each sprite and animation is designed to enhance the fast-paced gameplay and give the world a dynamic, lively vibe.

---

### Character Design
- **Frank the Fox**:  
  Frank is the epitome of "cool." He’s a confident, intelligent fox with animations that showcase his personality:  
  - **Idle Animation**: Taps his foot while deep in thought, conveying his sharp intellect.  
  - **Run Animation**: Smooth and agile, showing off his quick reflexes and determination.  
  - **Jump/Glide**: Frank glides gracefully and dashes in mid-air, highlighting his adventurous spirit.  
  - **Victory Pose**: When completing a level, Frank triumphantly smirks, tail flicking in satisfaction.  

- **Enemies**:  
  Each enemy is designed to contrast with Frank, being less refined and more animalistic in behavior:  
  - **Serpent**: Sinister and slinky, with jagged slithering animations.  
  - **Bear**: Large and lumbering, with exaggerated stomps and growls.  
  - **Monkey**: Hyperactive and mischievous, constantly jumping and swinging.  
  - **Panther**: Sleek and menacing, moving with low, predatory crouches.  
  - **Tropical Bird**: Fluttery and erratic, with rapid wing flaps.  
  - **Poison Dart Frog**: Brightly colored and bouncy, leaving trails of poison.  

Each enemy design incorporates distinct, exaggerated animations and vibrant colors to help players identify them quickly and react accordingly.


### Environment Design
The jungle environment is lush, chaotic, and inspired by the dynamic world-building of *Sonic the Hedgehog*.  
- **Color Palette**:  
  - Bright greens for foliage, earthy browns for caves, and deep blues for water create a rich and vibrant world.  
  - **Time-Based Lighting**: In the release version, the environment colors will change dynamically based on the player's local time, depicting sunrise, daylight, sunset, and nighttime.  

- **Prototype Design**:  
  - The environment is static and always set in daylight for simplicity.  

The world is filled with interactive elements like tree branches, underground tunnels, and cliffs, emphasizing vertical and horizontal exploration.


### User Interface
The UI is minimalist, designed to keep the player’s focus on the action while providing essential information.  
- **HUD**:  
  - **Score**: Displays the number of cherries or gems collected.  
  - **Lives**: Shown as heart icons to indicate how many lives remain.  

- **Additional Features**:  
  - Subtle UI transitions (e.g., fading in/out or bouncing icons) for added polish.  
  - Clean and pixelated font style that matches the retro theme.  

The simplicity of the interface ensures that players can quickly glance at their stats without breaking the pace of the game.  


## World / Level Design

### Level Structure
The game is structured as a fast-paced, endless runner-style experience:  
- **Prototype Version**:  
  - Features three static, handcrafted levels with increasing difficulty.  
- **Release Version**:  
  - Levels will be procedurally generated, making each run unique and endless.


### Pacing and Difficulty
- The game starts off simple, with fewer enemies and straightforward paths.  
- As the player progresses, levels introduce:  
  - More enemies with varied behaviors.  
  - Faster movement requirements and tighter jumps.  
  - More complex paths requiring quick reflexes.  

This gradual increase in difficulty ensures a rewarding challenge for players of all skill levels.


### Environmental Interaction
The environment is primarily interactive through enemies and collectible items:  
- **Enemies**: Players can choose to avoid or stomp on enemies for points.  
- **Collectibles**:  
  - **Cherries/Gems**: Increase the player's score.  
  - **Power-ups (Release Version)**:  
    - *Extra Time*: Extends the player’s time to complete sections.  
    - *Invincibility*: Temporarily protects Frank from enemies.  

In the prototype, only cherries/gems are available as interactables.


### Exploration and Secrets
Since *Jungle Smash* is designed as a runner, there is minimal exploration or hidden content. The focus is on maintaining momentum and navigating the jungle’s linear paths.  

## Technical Specifications

### Game Engine
- The game is built using the **Godot Engine**, taking advantage of its powerful 2D physics, lightweight performance, and versatile scripting capabilities.

### Platform Support
- **Prototype Version**:  
  - Desktop (PC/Mac/Linux) via executable files.  
  - Web-based deployment using HTML5 for browser play.  
- **Release Version**:  
  - Same platforms as the prototype, with potential optimization for additional web browsers and lightweight devices.  
- **Console Support**: Not planned due to hardware limitations and scope.


### Performance Targets
The game is designed to be lightweight and run on a wide range of hardware, ensuring accessibility:  
- **Minimum Requirements**:  
  - Processor: Intel Celeron or equivalent (e.g., Raspberry Pi supported).  
  - Memory: 1-2GB RAM.  
  - Graphics: Integrated graphics (Intel HD or better).  
  - Storage: Less than 50MB of available disk space.  
- **Recommended Requirements**:  
  - Processor: Dual-core processor.  
  - Memory: 2GB RAM or higher.  
  - Graphics: Any modern GPU, such as Nvidia GTX 600 series or newer.  

The game is optimized for smooth performance even on older hardware, ensuring stable frame rates and low input latency.


### Physics Systems
- The game uses **Godot’s built-in 2D physics engine**, leveraging the `move_and_slide()` function for character and enemy movement.  
- Physics interactions include:  
  - Collision detection for terrain, obstacles, and enemies.  
  - Stomping mechanics, where Frank can bounce off enemies’ heads.  
  - Gravity and double-jump mechanics, ensuring a smooth and responsive player experience.  

Godot’s physics system ensures consistent and predictable gameplay, essential for fast-paced endless runner mechanics.  
