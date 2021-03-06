## Android Debug Bridge Cheat Sheet
### Selecting a device

#### List of devices by serial number.
adb devices

#### List of devices by product/model.
adb devices -l

#### Command line selection.
adb -s <serial> ...

#### Env. variable selection.
export ANDROID_SERIAL=<serial>

#### If a command starts with $ it has to be run from the Android shell or via adb shell <command>, or even better
adb shell <command> | less.

### Package installation
#### Installs app.
adb install <apk>

#### Install app from phone path.
$ pm install <path>

#### Reinstall app from phone path.
$ pm install -r <path>

#### Remove the app.
$ pm uninstall <name>

#### Install location:
$ pm get-install-location
0 - Auto
1 - Internal
2 - External


### Package info
#### List package names.
$ pm list packages

#### As above + path to apks.
$ pm list packages -f

#### Only third party packages.
$ pm list packages -3

#### Only system packages.
$ pm list packages -s

#### Also uninstalled packages.
$ pm list packages -u

#### List info on all apps.
$ dumpsys package packages

#### List info on one package.
$ pm dump <name>

#### Path to the apk file.
$ pm path <package>

#### to grab the package information such as version identifiers etc
$ dumpsys | grep -A18 "Package \[my.package\]"

#### show current window
adb shell dumpsys window windows  | grep 'Window #'

### Permissions
#### Permission groups definitions.
$ pm permission groups

#### List permissions details.
$ pm list permissions -g -f

### File operations
#### Copy file/dir to device.
adb push <local> <remote>

#### Copy file/dir from device.
adb pull <remote> [<local>]

#### Backup the phone.
adb backup -f <file> [<packages...>]

#### If you want to access the private package files just use
run-as <package> cat <file>.

### Paths
#### App data, as described below.
/data/data/<package>

#### App databases.
databases/

#### Shared preferences.
shared prefs/

#### APK files installed by user.
/data/app

#### Pre-installed APK files.
/system/app

#### Encrypted apps (App2SD).
/mnt/asec

#### Internal SD Card.
/mnt/emmc

#### External/Internal SD Card.
/mnt/sdcard

#### sd External SD Card.
/mnt/sdcard/external


### Phone info
#### Dump phone settings.
$ sqlite3 /data/data/
com.android.providers.settings/
databases/settings.db .dump

#### Get properties (e.g. model).
$ getprop

#### Get the IMEI.
$ dumpsys iphonesubinfo

#### Get the serial number.
adb get-serialno

#### Battery status.
$ dumpsys battery

#### Lists phone users (4.1+).
$ pm list users

#### List phone features.
$ pm list features


### Services & activities
#### List all services.
$ service list

#### Activity info.
$ dumpsys activity <package>/<activity>

#### Activity Manager usage:
$ am start|startservice|broadcast <INTENT> [<COMPONENT>]
where <INTENT> is specified with following options:
-a <ACTION> e.g. android.intent.action.VIEW
-c <CATEGORY> e.g. android.intent.category.LAUNCHER

### Common actions
#### To open the URL:
$ am start -a android.intent.action.VIEW -d URL

### Logs
#### All logs are accessed by using either
$ logcat [options] [filter] [filter] . . .
or
adb logcat [options] [filter] [filter] . . .
Useful options are:
-d Only dump logs (do not block).
-c Flush the buffers.
-b <buffer> Buffer to display (default: system, main).
<tag>[:priority] filter spec at the end of command.

Available priorities are:
V Verbose
D Debug
I Info
W Warn
E Error
F Fatal
S Silent (suppress all output)

#### Other useful log information:
$ dumpstate Dump current phone state.
$ dumpsys Dump all system data.

### Miscellaneous
#### Screenshot (saved on device).
$ screencap -p <path>.png

#### Screen capture (path on device).
$ screenrecord <path>.mp4

### ADB daemon
#### runs on TCP/5037.
adbd

#### Kill the server if it is running.
adb kill-server

#### Ensure that there is a server running.
adb start-server

#### Restarts the adbd with root permissions.
adb root

## install apk
adb devices
adb disable-verity
adb reboot
adb remount
adb shell
cd /system/app/
mkdir GooglePackageInstaller
exit
adb push path/to/GooglePackageInstaller.apk /system/app/GooglePackageInstaller
adb logcat

## boardcast
adb shell am broadcast -a xxxxxxx --ez xxxxx true

## close se linux
Adb root
Adb remount
Adb shell setenforce 0

Adb shell getenforce

## monkey test
adb shell monkey --ignore-crashes --ignore-timeouts --kill-process-after-error --ignore-security-exceptions --throttle 500 -v -v -v -s 5 60000000>/sdcard/monkeylog.txt

## 跳过开机引导
adb shell settings put secure user_setup_complete 1
adb shell settings put global device_provisioned 1
adb reboot

## 打开飞行模式
adb shell settings put global airplane_mode_on 1

## adb logcat
adb wait‐for‐device && adb logcat ‐b all

## adb logcat crash
adb wait‐for‐device && adb logcat ‐b crash

## adb show apk path
adb shell "pm path xxxxx.xxx.xxx"

## adb remount
adb wait‐for‐device && adb root && adb disable‐verity && adb reboot && adb wait‐for‐device && adb root && adb remount