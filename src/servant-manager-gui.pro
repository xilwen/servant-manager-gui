QT += quick quickcontrols2 core

CONFIG += c++11

DEFINES += ASIO_STANDALONE \
    _WIN32_WINNT=0x0501

win32: LIBS += -L$$PWD/../../servant-base-lib/cmake-build-debug/ -lSERVANTBase
LIBS += -L$$PWD/../../servant-dependencies/curl-7.53.1/lib -lcurl

INCLUDEPATH += $$PWD/../../servant-base-lib/src
DEPENDPATH += $$PWD/../../servant-base-lib/src

LIBS += -lws2_32 -lstdc++fs -lwldap32

QMAKE_LFLAGS += -static

SOURCES += main.cpp \
    mainwindow.cpp \
    myserver.cpp \
    mall.cpp \
    diagnosis.cpp \
    perference.cpp \
    loadingscreen.cpp \
    qtutilities.cpp \
    firsttimesetup.cpp \
    temporarycommandsforqml.cpp \
    servercontrol.cpp

RESOURCES += qml.qrc

INCLUDEPATH += $$PWD/../../servant-dependencies/asio-1.10.6/include
INCLUDEPATH += $$PWD/../../servant-dependencies/nlohmann-json/
win32: RC_ICONS = $$PWD/icon/app.ico
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += mainwindow.h \
    myserver.h \
    mall.h \
    diagnosis.h \
    perference.h \
    loadingscreen.h \
    qtutilities.h \
    firsttimesetup.h \
    temporarycommandsforqml.h \
    servercontrol.h

DISTFILES +=

#make release build automatically deploy needed dlls
isEmpty(TARGET_EXT){
    win32{
        TARGET_CUSTOM_EXT = .exe
    }
}
win32{
    DEPLOY_COMMAND = $$shell_path($$[QT_INSTALL_BINS]\windeployqt.exe)
}
CONFIG(release){
    DEPLOY_TARGET = $$shell_quote($$shell_path($${OUT_PWD}/release/$${TARGET}$${TARGET_CUSTOM_EXT}))
}
QMAKE_POST_LINK = $${DEPLOY_COMMAND} --qmldir $$[QT_INSTALL_QML] $${DEPLOY_TARGET}
