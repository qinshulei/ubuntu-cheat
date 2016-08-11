## android make

make sdk - build the tools that are part of an SDK (adb, fastboot, etc.)
make snod - build the system image from the current software binaries
make services
make runtime
make droid - make droid is the normal build.
make all - make everything, whether it is included in the product definition or not
make clean - remove all built files (prepare for a new build). Same as rm -rf out/<configuration>/
make modules - shows a list of submodules that can be built (List of all LOCAL_MODULE definitions)
make <local_module> - make a specific module (note that this is not the same as directory name. It is the LOCAL_MODULE definition in the Android.mk file)
make clean-<local_module> - clean a specific module

## example

make droid
make showcommands
make targets
make clean
make clobber
make all

make Launcher2
make clean-Launcher2
make Launcher2 snod

make -j4 showcommands

time make clean-libcamera_client clean-screenrecord clean-libserviceutility droid -j24