
function scr_toggleablegameoptions(){
// This is where you get to toggle certain features that this engine comes with.
// To toggle them ON, Simply write True next to the global variables.You can also turn them OFF by writing False instead.
// Each option here changes gameplay and each will have a description as to what they do on more detail.
// You can mix and match any of these options so toggle between them and see which setitngs you would prefer for your mods.

global.anglerotation = true //Angle rotation is refering to Slope rotation.So when the player is on a slope, the players sprite will get rotated diagnoally. Set this to True to enable it, and set it to False to disable this all together.
global.smoothcamera = true //Smooth camera enables the camera to be alot smoother then the previous camera thats in the base game. Set this to False if you want to use the original camera.
global.slopemomentum = false //Slope momentum refers to the momentum you gain from going down a slope aswell as going up one.If set to True, The slope momentum will be alot faster and not as slow as the original slope momentum.Set this to false if you want the original momentum.
global.enemychangeroom = true // Enemy change rooms simply means when you grab an enemy and go into a hallway.If set to False, The enemy will not carry over to the next room. If set to True, The enemy will carry over with you to the next room if you are grabbing it.
global.qolchanges = true // This option enables small improvements over the original Eggplant base. More forgiving combo times and minor improvements. Set this to False if you don't really want these small changes to be present in your mods.
global.debugmode = true //Debug mode toggles on rtshell as well as a debug screen that presents all kinds of info.Set this to False when you plan to release your mod if you dont want people to use debug features in your mods. 

}