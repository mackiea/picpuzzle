# Install script for directory: /root/forks/Retro68

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/root/forks/Retro68-build/toolchain/m68k-apple-macos")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE DIRECTORY FILES "/root/forks/Retro68/cmake/" FILES_MATCHING REGEX "/[^/]*\\.cmake$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "/root/forks/Retro68-build/build-target/cmake/retro68.toolchain.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/root/forks/Retro68-build/build-target/libretro/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/Console/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/Samples/HelloWorld/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/TestApps/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/Samples/Dialog/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/Samples/Raytracer/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/Samples/Project3/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/Samples/Launcher/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/Samples/SystemExtension/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/Samples/MPWTool/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/Samples/WDEF/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/LaunchAPPL/cmake_install.cmake")
  include("/root/forks/Retro68-build/build-target/AutomatedTests/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/root/forks/Retro68-build/build-target/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
