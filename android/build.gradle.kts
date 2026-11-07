/*
 * Copyright (c) 田梓萱[小草林] 2021-2024.
 * All Rights Reserved.
 * All codes are protected by China's regulations on the protection of computer software, and infringement must be investigated.
 * 版权所有 (c) 田梓萱[小草林] 2021-2024.
 * 所有代码均受中国《计算机软件保护条例》保护，侵权必究.
 */

// The Android Gradle Plugin builds the native code with the Android NDK.

buildscript {
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        // The Android Gradle Plugin knows how to build native code with the NDK.
        classpath("com.android.tools.build:gradle:9.5.1")
    }
}

plugins {
    id("com.android.library")
}

group = "com.devac.whisper_flutter"
version = "1.0"

rootProject.allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

android {
    namespace = "com.devac.whisper_flutter_new"

    // NDK r28 and later link shared libraries with 16 KB-aligned ELF segments by
    // default. Android 15+ devices may use 16 KB memory pages, and Google Play
    // requires 64-bit libraries to support them.
    ndkVersion = "28.2.13676358"

    compileSdk = 36

    // Invoke the shared CMake build with the Android Gradle Plugin.
    externalNativeBuild {
        cmake {
            path = file("../src/CMakeLists.txt")
            version = "3.22.1"
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        minSdk = 21
        ndk {
            // Flutter does not currently support building for x86 Android (See Issue 9253).
            abiFilters += listOf("armeabi-v7a", "x86_64", "arm64-v8a", "x86")
        }
        externalNativeBuild {
            cmake {
                // Note: linker flags belong in src/CMakeLists.txt. Entries here are
                // passed to CMake itself, so a -Wl,... value would be silently dropped.
                cFlags += listOf(
                    "-O3",
                    "-flto=thin",
                    "-ffunction-sections",
                    "-fdata-sections",
                    "-fvisibility=hidden",
                    "-fvisibility-inlines-hidden",
                )
                cppFlags += listOf(
                    "-O3",
                    "-flto=thin",
                    "-ffunction-sections",
                    "-fdata-sections",
                    "-fvisibility=hidden",
                    "-fvisibility-inlines-hidden",
                )
                arguments += listOf(
                    "-DANDROID_STL=c++_static",
                    "-DCMAKE_BUILD_TYPE=Release",
                )
            }
        }
    }
}
