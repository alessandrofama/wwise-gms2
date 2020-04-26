#ifndef WWISEGMS2_H
#define WWISEGMS2_H

#define GMexport extern "C" __declspec(dllexport)

// System functions
GMexport double WWISE_Init();
GMexport double WWISE_Shutdown();
GMexport double WWISE_Update();

// Banks
GMexport double WWISE_SetBasePath(const char* basePath);
GMexport double WWISE_LoadBank(const char* bankName);
GMexport double WWISE_UnloadBank(const char* bankName);

// Listener
GMexport double WWISE_RegisterListener();
GMexport double WWISE_SetListenerPosition(double posX, double posY, double posZ, double dirX, double dirY, double dirZ, double oX, double oY, double oZ);

// GameObjects
GMexport double WWISE_RegisterGameObj(double gameObjectID, const char* gameObjectName);
GMexport double WWISE_UnregisterGameObj(double gameObjectID);
GMexport double WWISE_Set3DPosition(double gameObjectID, double posX, double posY, double posZ, double dirX, double dirY, double dirZ, double oX, double oY, double oZ);

// Events
GMexport double WWISE_PostEvent(const char* eventName, double gameObjectID);
GMexport double WWISE_StopEvent(double playingID, double fadeTime, double interpolation);

// Switches
GMexport double WWISE_SetSwitch(const char* switchGroup, const char* switchState, double gameObjectID);

// States
GMexport double WWISE_SetState(const char* stateGroup, const char* stateValue);

// RTPC
GMexport double WWISE_GetRTPCValue(const char* parameterName, double gameObjectID);
GMexport double WWISE_SetRTPCValue(const char* parameterName, double rtpcValue, double gameObjectID);

#endif