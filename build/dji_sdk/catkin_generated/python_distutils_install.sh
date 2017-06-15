#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/exbot/workspace/hehualin_ws/distribute/install/lib/python2.7/dist-packages:/home/exbot/workspace/hehualin_ws/distribute/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/exbot/workspace/hehualin_ws/distribute/build" \
    "/usr/bin/python" \
    "/home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk/setup.py" \
    build --build-base "/home/exbot/workspace/hehualin_ws/distribute/build/dji_sdk" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/exbot/workspace/hehualin_ws/distribute/install" --install-scripts="/home/exbot/workspace/hehualin_ws/distribute/install/bin"
