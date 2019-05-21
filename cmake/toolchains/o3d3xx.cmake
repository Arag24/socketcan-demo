#
# Toolchain for cross-building libo3d3xx for the O3D3xx camera.
#
#

set(CMAKE_SYSTEM_NAME Linux)
set(POKY_ROOT /opt/poky/1.8.1)
set(CMAKE_SYSROOT ${POKY_ROOT}/sysroots/armv7ahf-vfp-neon-poky-linux-gnueabi)
set(OECORE_NATIVE_SYSROOT ${POKY_ROOT}/sysroots/i686-pokysdk-linux)
set(SDKNATIVESYSROOT ${POKY_ROOT}/sysroots/i686-pokysdk-linux)
set(SDKTARGETSYSROOT ${POKY_ROOT}/sysroots/armv7ahf-vfp-neon-poky-linux-gnueabi)

# Add additinal third party libraries
set(SYSROOT_CONTRIB /opt/poky/contrib)
set(CMAKE_FIND_ROOT_PATH ${SYSROOT_CONTRIB} ${CMAKE_SYSROOT})



set(CMAKE_C_COMPILER   ${OECORE_NATIVE_SYSROOT}/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gcc )
set(CMAKE_CXX_COMPILER ${OECORE_NATIVE_SYSROOT}/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++ )


set(OE_CFLAGS " -DRELEASE -O2 -pipe -g -feliminate-unused-debug-types" )
set(OE_CFLAGS_DEBUG "-O0 -g -fno-omit-frame-pointer" )
set(OE_LD_FLAGS " -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed" )
set(OE_ARCH_CFLAGS " -march=armv7-a -marm -mfpu=neon  -mfloat-abi=hard -mcpu=cortex-a9" )


set(CMAKE_CXX_FLAGS_RELEASE "${OE_ARCH_CFLAGS} -pthread -std=c++11 --sysroot=${SDKTARGETSYSROOT} ${OE_CFLAGS}"  CACHE STRING "" FORCE )
set(CMAKE_CXX_FLAGS_DEBUG "${OE_ARCH_CFLAGS} -pthread -std=c++11 --sysroot=${SDKTARGETSYSROOT} ${OE_CFLAGS_DEBUG}"  CACHE STRING "" FORCE )
set(CMAKE_CXX_FLAGS "${OE_ARCH_CFLAGS} -pthread -std=c++11 --sysroot=${SDKTARGETSYSROOT} ${OE_CFLAGS} -Wl,-L${SDKNATIVESYSROOT}/usr/lib"  CACHE STRING "" FORCE )
set(CMAKE_C_FLAGS_RELEASE "${OE_ARCH_CFLAGS} --sysroot=${SDKTARGETSYSROOT} ${OE_CFLAGS}" CACHE STRING "" FORCE )
set(CMAKE_C_FLAGS_DEBUG "${OE_ARCH_CFLAGS} --sysroot=${SDKTARGETSYSROOT} ${OE_CFLAGS_DEBUG}" CACHE STRING "" FORCE )
set(CMAKE_C_FLAGS "${OE_ARCH_CFLAGS} --sysroot=${SDKTARGETSYSROOT} ${OE_CFLAGS}" CACHE STRING "" FORCE )

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_LIBRARY_PATH /lib
                       /usr/lib
                       /usr/lib/arm-linux-gnueabihf)

set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "armhf")
