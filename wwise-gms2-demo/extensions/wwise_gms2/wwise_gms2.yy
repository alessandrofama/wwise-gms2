{
    "id": "c34f7489-40f1-4e57-a0fc-364ae7a2d579",
    "modelName": "GMExtension",
    "mvc": "1.2",
    "name": "wwise_gms2",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 64,
    "date": "2020-35-25 07:04:38",
    "description": "",
    "exportToGame": true,
    "extensionName": "",
    "files": [
        {
            "id": "4a9e4a59-873b-4624-a2ee-e68fe29b2d82",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "216ef88d-a302-4ac6-a80e-487ce624eb23",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "AkCurveInterpolation_Log3",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "03880e57-b0f7-4316-828a-ef327d4d8190",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "AkCurveInterpolation_Sine",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "04b8c260-5908-403c-a358-5c0437b93dc1",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "AkCurveInterpolation_Log1",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "2134569c-b75b-40a1-bc7a-2d56f5ab8bb1",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "AkCurveInterpolation_InvSCurve",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "8e59e0a2-e12c-40a7-80a3-3a64797b0af8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "AkCurveInterpolation_Linear",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "47a317b5-39b9-463a-bc4b-6de2a7b3479a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "AkCurveInterpolation_SCurve",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "e546d948-2aa7-481e-83f6-b12d6246f13c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "AkCurveInterpolation_Exp1",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "c850a2b8-d11b-4956-bb94-d5aad68936e3",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "AkCurveInterpolation_SineRecip",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "d3621e2f-83ec-4b7c-ba50-5feb4c38dd84",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "AkCurveInterpolation_Exp3",
                    "hidden": false,
                    "value": "8"
                }
            ],
            "copyToTargets": 64,
            "filename": "wwise_gms2.dll",
            "final": "",
            "functions": [
                {
                    "id": "aa4a93d7-cd39-4703-9b56-588f1415da66",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "WWISE_Init",
                    "help": "void",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_Init",
                    "returnType": 2
                },
                {
                    "id": "135c323b-bf0a-494c-af02-db64dde00caa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "WWISE_Update",
                    "help": "void",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_Update",
                    "returnType": 2
                },
                {
                    "id": "0a2dd3a5-7850-4dae-bfa1-12342aed7362",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "WWISE_SetBasePath",
                    "help": "basePath",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_SetBasePath",
                    "returnType": 2
                },
                {
                    "id": "23d77e3c-bd5c-4f2c-abd1-4924f041be51",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "WWISE_LoadBank",
                    "help": "bankName",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_LoadBank",
                    "returnType": 2
                },
                {
                    "id": "1ac7b658-3a1b-4f54-8814-981090d78a57",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "WWISE_UnloadBank",
                    "help": "bankName",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_UnloadBank",
                    "returnType": 2
                },
                {
                    "id": "02cee270-c675-47b9-aead-75a5f356b7a4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "WWISE_RegisterListener",
                    "help": "",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_RegisterListener",
                    "returnType": 2
                },
                {
                    "id": "c9907e09-ea39-4686-99cc-e19dfcd7ccba",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "WWISE_SetListenerPosition",
                    "help": "posX, posY, posZ, dirX, dirY, dirZ, oX, oY, oZ",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_SetListenerPosition",
                    "returnType": 2
                },
                {
                    "id": "c0c96023-77a7-4aa9-939c-8819baa94c9c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "WWISE_RegisterGameObj",
                    "help": "gameObjectID, gameObjectName",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_RegisterGameObj",
                    "returnType": 2
                },
                {
                    "id": "6a29772d-1f03-4cd5-bfde-3a2e1c112af3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "WWISE_UnregisterGameObj",
                    "help": "gameObjectID",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_UnregisterGameObj",
                    "returnType": 2
                },
                {
                    "id": "46554645-fed9-4997-8392-c142af4fa497",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "WWISE_Set3DPosition",
                    "help": "gameObjectID, posX, posY, posZ, dirX, dirY, dirZ, oX, oY, oZ",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_Set3DPosition",
                    "returnType": 2
                },
                {
                    "id": "d034a7f2-c07d-48b3-8864-2bbd9525710b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "WWISE_PostEvent",
                    "help": "eventName, gameObjectID",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_PostEvent",
                    "returnType": 2
                },
                {
                    "id": "d1ffa8d5-009d-4cc5-b7f5-bb500bb47acb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "WWISE_StopEvent",
                    "help": "playingID, fadeTime, AkCurveInterpolation",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_StopEvent",
                    "returnType": 2
                },
                {
                    "id": "0eb56ac1-bcb7-4386-a56b-afee8eeabdcc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1,
                        2
                    ],
                    "externalName": "WWISE_SetSwitch",
                    "help": "switchGroup, switchState, gameObjectID",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_SetSwitch",
                    "returnType": 2
                },
                {
                    "id": "1f1c5c72-bc0c-4062-a941-22bd940be9f0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "WWISE_SetState",
                    "help": "stateGroup, stateValue",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_SetState",
                    "returnType": 2
                },
                {
                    "id": "f96789b4-df08-47e8-9857-f4608230a8fe",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "WWISE_GetRTPCValue",
                    "help": "rtpcName, gameObjectID",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_GetRTPCValue",
                    "returnType": 2
                },
                {
                    "id": "232ae64f-fa28-4106-923b-45dd0e14acc3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "WWISE_SetRTPCValue",
                    "help": "rtpcName, rtpcValue, gameObjectID",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_SetRTPCValue",
                    "returnType": 2
                },
                {
                    "id": "d91d6065-b3a8-48e8-8567-055a164df67c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "WWISE_Shutdown",
                    "help": "void",
                    "hidden": false,
                    "kind": 1,
                    "name": "WWISE_Shutdown",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                "aa4a93d7-cd39-4703-9b56-588f1415da66",
                "135c323b-bf0a-494c-af02-db64dde00caa",
                "d91d6065-b3a8-48e8-8567-055a164df67c",
                "0a2dd3a5-7850-4dae-bfa1-12342aed7362",
                "23d77e3c-bd5c-4f2c-abd1-4924f041be51",
                "1ac7b658-3a1b-4f54-8814-981090d78a57",
                "02cee270-c675-47b9-aead-75a5f356b7a4",
                "c9907e09-ea39-4686-99cc-e19dfcd7ccba",
                "c0c96023-77a7-4aa9-939c-8819baa94c9c",
                "6a29772d-1f03-4cd5-bfde-3a2e1c112af3",
                "46554645-fed9-4997-8392-c142af4fa497",
                "d034a7f2-c07d-48b3-8864-2bbd9525710b",
                "d1ffa8d5-009d-4cc5-b7f5-bb500bb47acb",
                "0eb56ac1-bcb7-4386-a56b-afee8eeabdcc",
                "1f1c5c72-bc0c-4062-a941-22bd940be9f0",
                "f96789b4-df08-47e8-9857-f4608230a8fe",
                "232ae64f-fa28-4106-923b-45dd0e14acc3"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "options": null,
    "optionsFile": "options.json",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "supportedTargets": -1,
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "0.0.1"
}