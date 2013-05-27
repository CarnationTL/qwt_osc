######################################################################
# Build the static/shared libraries.
# If QwtDll is enabled, a shared library is built, otherwise
# it will be a static library.
######################################################################

QWT_CONFIG           += QwtDll

######################################################################
# QwtPlot enables all classes, that are needed to use the QwtPlot
# widget.
######################################################################

QWT_CONFIG       += QwtPlot

######################################################################
# QwtWidgets enables all classes, that are needed to use the all other
# widgets (sliders, dials, ...), beside QwtPlot.
######################################################################

#QWT_CONFIG     += QwtWidgets

######################################################################
# If you want to display svg images on the plot canvas, or
# export a plot to a SVG document
######################################################################

QWT_CONFIG     += QwtSvg

######################################################################
# If you want to use a OpenGL plot canvas
######################################################################

QWT_CONFIG     += QwtOpenGL


TEMPLATE     = app

DESTDIR      = ./bin/


contains(QWT_CONFIG, QwtOpenGL ) {

    QT += opengl
}
else {

    DEFINES += QWT_NO_OPENGL
}

contains(QWT_CONFIG, QwtSvg) {

    QT += svg
}
else {

    DEFINES += QWT_NO_SVG
}


#dy link for user
win32 {
    contains(QWT_CONFIG, QwtDll) {
        DEFINES    += QT_DLL QWT_DLL
    }
}

TARGET   = oscilloscope

CONFIG += qwt

HEADERS = \
    signaldata.h \
    plot.h \
    knob.h \
    wheelbox.h \
    samplingthread.h \
    curvedata.h \
    mainwindow.h 

SOURCES = \
    signaldata.cpp \
    plot.cpp \
    knob.cpp \
    wheelbox.cpp \
    samplingthread.cpp \
    curvedata.cpp \
    mainwindow.cpp \
    main.cpp



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/qwtlib/ -lqwt
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/qwtlib/ -lqwtd

INCLUDEPATH += $$PWD/qwtinc
DEPENDPATH += $$PWD/qwtlib
