# wwise-gms2

This extension adds bindings to the Wwise API (version 2019.2.1.7250) for Game Maker Studio 2. Windows only for now since I don't use macOS or a linux distribution.

## Table of Contents 

[Installation](#installation)

[Building](#bulding)

[Usage](#installation)

[Examples](#examples)

## Installation

Import the provided .yymp file (releases tab) to your Game Maker Studio 2 project. You will find a Debug and Release folder in the provided .zip file. Replace the .dll file in the wwise-gms2 extension folder of your project with the desired version. Debug enables communication with the Wwise Authoring Tool.

## Building

Add the `include` folder of the Wwise SDK to the Include directories, the appropriate platform folder to the Library Directories (for release it would be `SDK\Win32_vc160\Release(StaticCRT)\lib`. Copy the `Win32` folder of `SDK\samples\SoundEngine` into your the sdk include directory. Copy all the files of the Common directory in `SDK\samples\SoundEngine` and add them to `SDK\include\AK\SoundEngine\Common` Also add following files to the solution:
- AkDefaultOHookBlocking.cpp
- AkFIlePackage.cpp
- AkFIlePackageLut.cpp
- AkMultipleFileLocation.cpp

# Usage 

## System functions
```
WWISE_Init()
```
initialises the various Wwise modules. 
Returns `0` if succeded, `-1` if failed.

```
WWISE_Update()
```
Processes the Wwise commands, should be called once per frame.
Returns `0` if succeded, `-1` if failed.

```
WWISE_Shutdown()
```
Shuts down the Wwise engine. 
Returns `0` if succeded, `-1` if failed.

## Soundbanks

### Setting the Base path of the banks

```
WWISE_SetBasePath(string basePath)
```
You can place your `GeneratedSoundBanks` folder in the "Included" directory of the GMS2 project and then point to the folder containing the banks, for example:

```
WWISE_SetBasePath("GeneratedSoundBanks/Windows");
```

Returns `0` if succeded, `-1` if failed.

### Loading a bank
```
WWISE_LoadBank(string bankName)
```
`bankName` is the name of the bank + .bnk. Make sure to load Init.bnk before any other bank.
Returns `0` if succeded, `-1` if failed.

### Unloading a bank
```
WWISE_UnloadBank(string bankName)
```
Returns `0` if succeded, `-1` if failed.

## Listener 

### Registering the default listener
```
WWISE_RegisterListener()
```

### Setting the listener position
```
WWISE_SetListenerPosition(double posX, double posY, double posZ, double dirX, double dirY, double dirZ, double oX, double oY, double oZ)
```
`dirX` `dirY` `dirZ` is the forward vector, `oX` `oY` `oZ` the up vector.

Returns `0` if succeded, `-1` if failed.

## GameObjects

### Registering a GameObject
```
WWISE_RegisterGameObj(double gameObjectID, string gameObjectName)
```
You need to register a GameObject before posting an Event on that GameObject for example. You can use the `id` of your object instance in GMS" as `gameObjectID`. The `gameObjectName` can be of your choice (will be displayed in the Authoring App).

Returns `0` if succeded, `-1` if failed.

### Unregistering a GameObject
```
WWISE_UnregisterGameObj(double gameObjectID)
```
Returns `0` if succeded, `-1` if failed.

### Setting the position of a GameObject
```
WWISE_Set3DPosition(double gameObjectID, double posX, double posY, double posZ, double dirX, double dirY, double dirZ, double oX, double oY, double oZ)
```
`dirX` `dirY` `dirZ` is the forward vector, `oX` `oY` `oZ` the up vector.

Returns `0` if succeded, `-1` if failed.

## Events

### Posting an Event
```
WWISE_PostEvent(string eventName, double gameObjectID)
```

`gameObjectID` should be the ID of the registered GameObject.
Returns the playing ID if succeded, `-1` if failed.

### Stopping an Event
```
WWISE_StopEvent(double playingID, double fadeTime, double interpolation)
```
`interpolation` here can be:
 - AkCurveInterpolation_Log3		
 - AkCurveInterpolation_Sine		
 - AkCurveInterpolation_Log1		
 - AkCurveInterpolation_InvSCurve	
 - AkCurveInterpolation_Linear		
 - AkCurveInterpolation_SCurve		
 - AkCurveInterpolation_Exp1		
 - AkCurveInterpolation_SineRecip	
 - AkCurveInterpolation_Exp3		

## Switches

### Setting a Switch

```
WWISE_SetSwitch(string switchGroup, string switchState, double gameObjectID)
```
Returns `0` if succeded, `-1` if failed.

## States

### Setting a State
```
WWISE_SetState(string stateGroup, string stateValue)
```
Returns `0` if succeded, `-1` if failed.

## RTPC

### Getting a RTPC value
```
 WWISE_GetRTPCValue(string rtpcName, double gameObjectID)
```
Returns the rtpc value if succeded, `-1` if failed. Enter -1 as `gameObjectID` to get a global value.

### Setting a RTPC value
```
WWISE_SetRTPCValue(string rtpcName, double rtpcValue, double gameObjectID)
```
Returns 0 if succeded, `-1` if failed. Enter -1 as `gameObjectID` to set a global value.

## Examples

### Initialising Wwise and loading a bank
```
WWISE_Init();
WWISE_SetBasePath("GeneratedSoundBanks/Windows");
WWISE_LoadBank("Init.bnk");
WWISE_LoadBank("TestBank.bnk");
```

### Registering the listener and setting its position
```
WWISE_RegisterListener();
WWISE_SetListenerPosition(x, y, -10, 0, -1, 0, 0, 0, 1);
```

### Registering a GameObject and posting an Event 
```
WWISE_RegisterGameObj(id, "TestGameObject");
WWISE_PostEvent("Music", id);
```

### Setting the position of a GameObject
```
x = mouse_x;
y = mouse_y;
WWISE_Set3DPosition(id, x, y, 0, 0, -1, 0, 0, 0, 1);
```


