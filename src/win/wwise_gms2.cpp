#ifndef WWISEGMS2_CPP
#define WWISEGMS2_CPP

#include "wwise_gms2.h"

#include "AK/SoundEngine/Win32/AkFilePackageLowLevelIOBlocking.h"

#include <AK/SoundEngine/Common/AkMemoryMgr.h>
#include <AK/SoundEngine/Common/AkModule.h>
#include <AK/SoundEngine/Common/IAkStreamMgr.h>
#include <AK/Tools/Common/AkPlatformFuncs.h>
#include <AK/MusicEngine/Common/AkMusicEngine.h>
#include <AK/SoundEngine/Common/AkQueryParameters.h>

#include <AK/Plugin/AkSineSourceFactory.h>
#include <AK/Plugin/AkToneSourceFactory.h>
#include <AK/Plugin/AkSilenceSourceFactory.h>
#include <AK/Plugin/AkAudioInputPlugin.h>
#include <AK/Plugin/AkDelayFXFactory.h>
#include <AK/Plugin/AkParametricEQFXFactory.h>
#include <AK/Plugin/AkMatrixReverbFXFactory.h>
#include <AK/Plugin/AkCompressorFXFactory.h>
#include <AK/Plugin/AkExpanderFXFactory.h>
#include <AK/Plugin/AkPeakLimiterFXFactory.h>
#include <AK/Plugin/AkRoomVerbFXFactory.h>
#include <AK/Plugin/AkPitchShifterFXFactory.h>
#include <AK/Plugin/AkMeterFXFactory.h>
#include <AK/Plugin/AkVorbisDecoderFactory.h>
#include <AK/Plugin/AkFlangerFXFactory.h>
#include <AK/Plugin/AkGuitarDistortionFXFactory.h>
#include <AK/Plugin/AkTremoloFXFactory.h>
#include <AK/Plugin/AkTimeStretchFXFactory.h>
#include <AK/Plugin/AkStereoDelayFXFactory.h>
#include <AK/Plugin/AkHarmonizerFXFactory.h>
#include <AK/Plugin/AkGainFXFactory.h>

#ifndef AK_OPTIMIZED
#include <AK/Comm/AkCommunication.h>
#endif // AK_OPTIMIZED

namespace AK {
#if defined(_WIN32)
	void* __cdecl AllocHook(size_t in_size)
	{
		return malloc(in_size);
	}
	void __cdecl FreeHook(void* in_ptr)
	{
		free(in_ptr);
	}
	void* __cdecl VirtualAllocHook(
		void* in_pMemAddress,
		size_t in_size,
		DWORD in_dwAllocationType,
		DWORD in_dwProtect)
	{
		return VirtualAlloc(in_pMemAddress, in_size, in_dwAllocationType, in_dwProtect);
	}
	void __cdecl VirtualFreeHook(
		void* in_pMemAddress,
		size_t in_size,
		DWORD in_dwFreeType)
	{
		VirtualFree(in_pMemAddress, in_size, in_dwFreeType);
	}
}

CAkFilePackageLowLevelIOBlocking g_lowLevelIO;

#ifndef AK_OPTIMIZED
AkMemPoolId g_poolComm = AK_INVALID_POOL_ID;
#define COMM_POOL_SIZE (256 * 1024)
#define COMM_POOL_BLOCK_SIZE (48)
#endif

#endif

GMexport double WWISE_Init()
{

	AkMemSettings memSettings;
	AK::MemoryMgr::GetDefaultSettings(memSettings);

	auto result = AK::MemoryMgr::Init(&memSettings);
	if (result != AK_Success) {
		return -1;
	}

	AkStreamMgrSettings stmSettings;
	AK::StreamMgr::GetDefaultSettings(stmSettings);
	if (!AK::StreamMgr::Create(stmSettings)) {
		return -1;
	}

	AkDeviceSettings deviceSettings;
	AK::StreamMgr::GetDefaultDeviceSettings(deviceSettings);
	if ((result = g_lowLevelIO.Init(deviceSettings)) != AK_Success) {
		return -1;
	}

	AkInitSettings initSettings;
	AkPlatformInitSettings platformInitSettings;
	AK::SoundEngine::GetDefaultInitSettings(initSettings);
	AK::SoundEngine::GetDefaultPlatformInitSettings(platformInitSettings);
	if ((result = AK::SoundEngine::Init(&initSettings, &platformInitSettings)) != AK_Success) {
		return -1;
	}

	AkMusicSettings musicInit;
	AK::MusicEngine::GetDefaultInitSettings(musicInit);
	if ((result = AK::MusicEngine::Init(&musicInit)) != AK_Success) {
		return -1;
	}

#ifndef AK_OPTIMIZED
	AkCommSettings settingsComm;
	AK::Comm::GetDefaultInitSettings(settingsComm);
	if ((result = AK::Comm::Init(settingsComm)) != AK_Success) {
		return -1;
	}
#endif

	return 0;
}

GMexport double WWISE_Shutdown()
{
#ifndef AK_OPTIMIZED
	AK::Comm::Term();
#endif // AK_OPTIMIZED

	auto result = AK::SoundEngine::UnregisterAllGameObj();

	if (result != AK_Success) {
		return -1;
	}

	AK::SoundEngine::ClearBanks();

	AK::MusicEngine::Term();

	AK::SoundEngine::Term();

	g_lowLevelIO.Term();

	if (AK::IAkStreamMgr::Get()) {
		AK::IAkStreamMgr::Get()->Destroy();
	}

	AK::MemoryMgr::Term();

	return 0;
}

GMexport double WWISE_Update()
{
	auto result = AK::SoundEngine::RenderAudio();
	if (result != AK_Success) {
		return -1;
	}

	return 0;
}

GMexport double WWISE_SetBasePath(const char* basePath)
{
	AkOSChar* basePathOsString = NULL;
	CONVERT_CHAR_TO_OSCHAR(basePath, basePathOsString);
	auto result = g_lowLevelIO.SetBasePath(basePathOsString);

	if (result != AK_Success) {
		return -1;
	}
	return 0;
}

GMexport double WWISE_LoadBank(const char* bankName)
{
	AkBankID bankID;
	auto result = AK::SoundEngine::LoadBank(bankName, bankID);

	if (result != AK_Success) {
		return -1;
	}
	return 0;
}

GMexport double WWISE_UnloadBank(const char* bankName)
{
	auto result = AK::SoundEngine::UnloadBank(bankName, NULL);

	if (result != AK_Success) {
		return -1;
	}
	return 0;
}

GMexport double WWISE_RegisterListener()
{
	AkGameObjectID LISTENER = 0;

	AK::SoundEngine::RegisterGameObj(LISTENER, "My Default Listener");
	AK::SoundEngine::SetDefaultListeners(&LISTENER, 1);

	return 0;
}

GMexport double WWISE_SetListenerPosition(double posX, double posY, double posZ, double dirX, double dirY, double dirZ, double oX, double oY, double oZ)
{
	AkSoundPosition listenerPosition;
	listenerPosition.SetPosition(static_cast<AkReal32>(posX), static_cast<AkReal32>(posY), static_cast<AkReal32>(posZ));
	listenerPosition.SetOrientation(static_cast<AkReal32>(dirX), static_cast<AkReal32>(dirY), static_cast<AkReal32>(dirZ), static_cast<AkReal32>(oX), static_cast<AkReal32>(oY), static_cast<AkReal32>(oZ));

	auto result = AK::SoundEngine::SetPosition(0, listenerPosition);
	if (result != AK_Success) {
		return -1;
	}

	return 0;
}

GMexport double WWISE_RegisterGameObj(double gameObjectID, const char* gameObjectName)
{
	auto result = AK::SoundEngine::RegisterGameObj(static_cast<AkGameObjectID>(gameObjectID), gameObjectName);
	if (result != AK_Success) {
		return -1;
	}
	return 0;
}

GMexport double WWISE_UnregisterGameObj(double gameObjectID)
{
	auto result = AK::SoundEngine::UnregisterGameObj(static_cast<AkGameObjectID>(gameObjectID));
	if (result != AK_Success) {
		return -1;
	}
	return 0;
}

GMexport double WWISE_Set3DPosition(double gameObjectID, double posX, double posY, double posZ, double dirX, double dirY, double dirZ, double oX, double oY, double oZ)
{
	AkSoundPosition soundPos;
	soundPos.SetPosition(static_cast<AkReal32>(posX), static_cast<AkReal32>(posY), static_cast<AkReal32>(posZ));
	soundPos.SetOrientation(static_cast<AkReal32>(dirX), static_cast<AkReal32>(dirY), static_cast<AkReal32>(dirZ), static_cast<AkReal32>(oX), static_cast<AkReal32>(oY), static_cast<AkReal32>(oZ));

	auto result = AK::SoundEngine::SetPosition(static_cast<AkGameObjectID>(gameObjectID), soundPos);
	if (result != AK_Success) {
		return -1;
	}
	return 0;
}

GMexport double WWISE_PostEvent(const char* eventName, double gameObjectID)
{
	auto playingID = AK::SoundEngine::PostEvent(eventName, static_cast<AkGameObjectID>(gameObjectID));
	if (playingID == AK_INVALID_PLAYING_ID) {
		return -1;
	}
	return static_cast<double>(playingID);
}

GMexport double WWISE_StopEvent(double playingID, double fadeTime, double interpolation)
{
	AkTimeMs ms = static_cast<AkTimeMs>(fadeTime);
	int curve = static_cast<int>(interpolation);
	AK::SoundEngine::StopPlayingID(static_cast<AkPlayingID>(playingID), ms, (AkCurveInterpolation)curve);
	return 0;
}

GMexport double WWISE_SetSwitch(const char* switchGroup, const char* switchState, double gameObjectID)
{
	auto result = AK::SoundEngine::SetSwitch(switchGroup, switchState, static_cast<AkGameObjectID>(gameObjectID));

	if (result != AK_Success) {
		return -1;
	}

	return 0;
}

GMexport double WWISE_SetState(const char* stateGroup, const char* stateValue)
{
	auto result = AK::SoundEngine::SetState(stateGroup, stateValue);

	if (result != AK_Success) {
		return -1;
	}

	return 0;
}

GMexport double WWISE_GetRTPCValue(const char* parameterName, double gameObjectID)
{
	AkRtpcValue value;
	AKRESULT result;

	if (static_cast<int>(gameObjectID) == -1) {
		AK::SoundEngine::Query::RTPCValue_type type = AK::SoundEngine::Query::RTPCValue_Global;

		result = AK::SoundEngine::Query::GetRTPCValue(parameterName, AK_INVALID_GAME_OBJECT, AK_INVALID_PLAYING_ID, value, type);

		if (result != AK_Success) {
			return -1;
		}
		return static_cast<double>(value);
	}
	else {
		AK::SoundEngine::Query::RTPCValue_type type = AK::SoundEngine::Query::RTPCValue_GameObject;

		result = AK::SoundEngine::Query::GetRTPCValue(parameterName, static_cast<AkGameObjectID>(gameObjectID), static_cast<AkPlayingID>(0), value, type);

		if (result != AK_Success) {
			return -1;
		}

		return static_cast<double>(value);
	}
}

GMexport double WWISE_SetRTPCValue(const char* parameterName, double rtpcValue, double gameObjectID)
{
	AkRtpcValue value = static_cast<float>(rtpcValue);
	if (static_cast<int>(gameObjectID) == -1) {
		auto result = AK::SoundEngine::SetRTPCValue(parameterName, value, AK_INVALID_GAME_OBJECT);

		if (result != AK_Success) {
			return -1;
		}

		return 0;
	}
	else {
		auto result = AK::SoundEngine::SetRTPCValue(parameterName, value, static_cast<AkGameObjectID>(gameObjectID));

		if (result != AK_Success) {
			return -1;
		}

		return 0;
	}
}

#endif
