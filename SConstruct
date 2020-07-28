#!python
import os, sys, subprocess


opts = Variables([], ARGUMENTS)

# Gets the standard flags CC, CCX, etc.

if sys.platform == 'darwin':
    host_platform = 'osx'
    env = DefaultEnvironment()
elif sys.platform == 'win32' or sys.platform == 'msys':
    host_platform = 'windows'
    env = Environment(
    TARGET_ARCH='x86')
else:
    raise ValueError(
        'Could not detect platform automatically, please specify with '
        'platform=<platform>'
    )

# Define our options
opts.Add(EnumVariable('target', "Compilation target", 'debug', ['d', 'debug', 'r', 'release']))
opts.Add(EnumVariable('platform', "Compilation platform", '', ['', 'windows', 'osx', ]))
opts.Add(EnumVariable('p', "Compilation target, alias for 'platform'", '', ['', 'windows', 'osx']))
opts.Add(BoolVariable('use_llvm', "Use the LLVM / Clang compiler", 'no'))
opts.Add(PathVariable('target_path', 'The path where the lib is installed.', './bin/'))
opts.Add(PathVariable('target_name', 'The library name.', 'wwise_gms2', PathVariable.PathAccept))
opts.Add(PathVariable('wwise_sdk', 'The Wwise SDK path', '', PathVariable.PathAccept))
opts.Add(ListVariable('plugins', 'List of plugins', '', ['reflect', 'motion', 'convolution', 'soundseed_grain', 'soundseed_air_impact']))

# Updates the environment with the option variables.
opts.Update(env)



# Wwise dependency paths
wwise_sdk_headers_path = env['wwise_sdk'] + "/include/"
wwise_sdk_libs_path = ""
wwise_soundengine_sample_path = ""

if env['platform'] == "windows":
    wwise_soundengine_sample_path = env['wwise_sdk'] + "/samples/SoundEngine/Win32/"
    if env['target'] in ('debug', 'd'):
        wwise_sdk_libs_path = env['wwise_sdk'] + "/Win32_vc150/Debug/lib/"
    else:
        wwise_sdk_libs_path = env['wwise_sdk'] + "/Win32_vc150/Release/lib/"

if env['platform'] == "osx":
    wwise_soundengine_sample_path = env['wwise_sdk'] + "/samples/SoundEngine/POSIX/"
    if env['target'] in ('debug', 'd'):
        wwise_sdk_libs_path = env['wwise_sdk'] + "/Mac/Debug/lib/"
    else:
        wwise_sdk_libs_path = env['wwise_sdk'] + "/Mac/Release/lib/"   

wwise_soundengine_sample_common_path = env['wwise_sdk'] + "/samples/SoundEngine/Common/"
wwise_memorymanager_library = "AkMemoryMgr"
wwise_soundengine_library = "AkSoundEngine"
wwise_musicengine_library = "AkMusicEngine"
wwise_streammanager_library = "AkStreamMgr"
wwise_communications_library = "CommunicationCentral"
wwise_plugins_library = ["AkGainFX", "AkHarmonizerFX", "AkStereoDelayFX", "AkTimeStretchFX",
                         "AkTremoloFX", "AkGuitarDistortionFX","AkVorbisDecoder", "AkMeterFX", 
                         "AkPitchShifterFX", "AkRoomVerbFX", "AkRoomVerbFX", "AkPeakLimiterFX", 
                         "AkExpanderFX", "AkCompressorFX", "AkMatrixReverbFX", "AkParametricEQFX", 
                         "AkDelayFX","AkSilenceSource", "AkToneSource", "AkFlangerFX", "AkSineSource",
                         "AkRecorderFX", "AkAudioInputSource", "AkSynthOneSource"]

print("Wwise SDK headers path: " + wwise_sdk_headers_path)
print("Wwise SDK libs path: " + wwise_sdk_libs_path)

# Process some arguments
if env['use_llvm']:
    env['CC'] = 'clang'
    env['CXX'] = 'clang++'

if env['p'] != '':
    env['platform'] = env['p']

if env['platform'] == '':
    print("No valid target platform selected.")
    quit()

# Check our platform specifics
if env['platform'] == "osx":
    env['target_path'] += 'osx/'
    if env['target'] in ('debug', 'd'):
        env['target_path'] += 'debug/'
    else:
        env['target_path'] += 'release/'

    wwise_plugins_library.append("AkAACDecoder")
    
    if env['target'] in ('debug', 'd'):
        env.Append(CCFLAGS=['-g', '-O2', '-arch', 'x86_64'])
        env.Append(CXXFLAGS=['-std=c++17'])
        env.Append(LINKFLAGS=['-arch', 'x86_64', '-framework', 'CoreAudio', '-Wl,-undefined,dynamic_lookup'])
    else:
        env.Append(CPPDEFINES=['AK_OPTIMIZED'])
        env.Append(CCFLAGS=['-g', '-O3', '-arch', 'x86_64'])
        env.Append(CXXFLAGS=['-std=c++17'])
        env.Append(LINKFLAGS=['-arch', 'x86_64', '-framework', 'CoreAudio', '-Wl,-undefined,dynamic_lookup'])

elif env['platform'] == "windows":


    env['target_path'] += 'win32/'
    if env['target'] in ('debug', 'd'):
        env['target_path'] += 'debug/'
    else:
        env['target_path'] += 'release/'

    # This makes sure to keep the session environment variables on windows,
    # that way you can run scons in a vs 2017 prompt and it will find all the required tools
   # env.Append(ENV=os.environ)

    env.Append(CPPDEFINES=['WIN32', '_WIN32', '_WINDOWS', '_CRT_SECURE_NO_WARNINGS', 'UNICODE'])
    env.Append(CCFLAGS=['-W3', '-GR'])
    #env.Append(CCFLAGS=['/GS', '/GL', '/Gy'])

    if env['target'] in ('debug', 'd'):
        env.Append(CPPDEFINES=['_DEBUG'])
        env.Append(CCFLAGS=['-EHsc', '-MDd', '-ZI'])
        env.Append(LINKFLAGS=['-DEBUG'])
    else:
        env.Append(CPPDEFINES=['AK_OPTIMIZED'])
        env.Append(CPPDEFINES=['NDEBUG'])
        env.Append(CCFLAGS=['-O2', '-EHsc', '-MD'])

# tweak this if you want to use different folders, or more folders, to store your source code in.
env.Append(CPPPATH=['src/'])

sources = []
sources.append(Glob('src/*.cpp')) 
sources.append(Glob(wwise_soundengine_sample_path + '*.cpp'))
sources.append(Glob(wwise_soundengine_sample_common_path + '*.cpp'))


env.Append(CPPPATH=[wwise_sdk_headers_path, wwise_soundengine_sample_path])
env.Append(LIBPATH=[wwise_sdk_libs_path])
env.Append(LIBS=[wwise_memorymanager_library, wwise_soundengine_library, wwise_streammanager_library, wwise_musicengine_library, wwise_plugins_library])

if env['target'] in ('debug', 'd'):
    env.Append(LIBS=[wwise_communications_library])

    if env['platform'] == "windows":
    	env.Append(LIBS=['msacm32', 'ws2_32'])

if env['platform'] == "windows":
    env.Append(LIBS=['advapi32', 'user32', 'ole32'])

library = env.SharedLibrary(target=env['target_path'] + env['target_name'] , source=sources)

Default(library)

# Generates help for the -h scons option.
Help(opts.GenerateHelpText(env))
