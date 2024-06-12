# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(whisper_flutter_library LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -s -flto=thin -fdata-sections -ffunction-sections -fvisibility=hidden -fvisibility-inlines-hidden")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -s -flto=thin -fdata-sections -ffunction-sections -fvisibility=hidden -fvisibility-inlines-hidden")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--gc-sections -Wl,--exclude-libs,ALL")
set(CMAKE_BUILD_PARALLEL_LEVEL 6)
add_library(whisper_flutter SHARED main.cpp)
file(GLOB WHISPER_SRC whisper.cpp/*.cpp whisper.cpp/*.c)
add_library(whisper ${WHISPER_SRC})

set_target_properties(whisper_flutter PROPERTIES
  PUBLIC_HEADER whisper.cpp/whisper.h 
  OUTPUT_NAME "whisper"
)

if (${ANDROID_ABI} STREQUAL "arm64-v8a")
    target_compile_options(whisper PRIVATE -march=armv8.2-a+fp16)
elseif (${ANDROID_ABI} STREQUAL "armeabi-v7a")
    target_compile_options(whisper PRIVATE -mfpu=neon-vfpv4)
endif ()

target_compile_options(whisper PRIVATE -O3 -s -flto=thin -fvisibility=hidden -fvisibility-inlines-hidden -ffunction-sections -fdata-sections)
target_compile_options(whisper_flutter PRIVATE -O3 -s -flto=thin -fvisibility=hidden -fvisibility-inlines-hidden -ffunction-sections -fdata-sections)
target_link_options(whisper PRIVATE -Wl,--gc-sections,--exclude-libs,ALL)
target_link_options(whisper_flutter PRIVATE -Wl,--gc-sections,--exclude-libs,ALL)
target_compile_definitions(whisper_flutter PUBLIC DART_SHARED_LIB)
target_link_libraries(whisper_flutter PRIVATE whisper ${CMAKE_THREAD_LIBS_INIT})
