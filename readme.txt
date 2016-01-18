-- To Run --
* Place Framework.Altis folder into mpmissions (Run like normal mission file)
* Place Framework.Backend folder into Arma 3 directory
* You must run with -filePatching startup param (or check the file patching box in Arma 3 launcher) AND allowedFilePatching = 2; (I think) if you're running it on a server

-- Why I Created This Framework --
I had originally created this framework to use in my own life mod (ArmaRPG). I have rewritten this framework multiple times in the past couple years to get it to where it is right now. It's not 100% complete but it has a lot of the things a life mod needs (and some extra things). 

-- Rules Of Use: (if you decide to use all of or any part of the framework) --
You MUST give credit
You MAY monetize
You MAY use any code in other missions/mods (as long as credit is given)

-- Some Details --
* The database functions and database itself I sadly never got to, I have some functions started in Framework_Database.sqf but they have not been tested.
* Located in the "Backend" folder you will find 'Framework_Setup.sqf'. This file contains all of the functions that run when the framework is started. It compiles all of the functions and places everything where it should be on the map.
* I have created a placing system in the framework for map items (including shops, etc). You will find this in Framework_Setup.sqf. It basically takes the classname of the object on the map, moves it to where you define in the array, and then places a marker on it with whatever you define (if you want).
* Functions are defined as '['function_name', {}] call Framework_Compile'. Once the framework is running, it will broadcast the function so that clients can use it. If you want a function to be serversided (only the server can call it) place true after the code. For example '['function_name', {}, true] call Framework_Compile' (It defaults to false if not defined).