FROM debian:10

RUN mkdir /app
RUN apt-get -qqy update && DEBIAN_FRONTEND=noninteractive apt-get -qqy install \
	curl \
	git \
	nano \
	qml-module-org-nemomobile-mpris \
	qml-module-qt-websockets \
	qml-module-qt3d \
	qml-module-qtaudioengine \
	qml-module-qtav \
	qml-module-qtbluetooth \
	qml-module-qtcharts \
	qml-module-qtdatavisualization \
	qml-module-qtgraphicaleffects \
	qml-module-qtgstreamer \
	qml-module-qtlocation \
	qml-module-qtmultimedia \
	qml-module-qtnfc \
	qml-module-qtpositioning \
	qml-module-qtqml-models2 \
	qml-module-qtqml-statemachine \
	qml-module-qtquick-controls \
	qml-module-qtquick-controls2 \
	qml-module-qtquick-dialogs \
	qml-module-qtquick-extras \
	qml-module-qtquick-layouts \
	qml-module-qtquick-localstorage \
	qml-module-qtquick-particles2 \
	qml-module-qtquick-privatewidgets \
	qml-module-qtquick-scene2d \
	qml-module-qtquick-scene3d \
	qml-module-qtquick-shapes \
	qml-module-qtquick-templates2 \
	qml-module-qtquick-virtualkeyboard \
	qml-module-qtquick-window2 \
	qml-module-qtquick-xmllistmodel \
	qml-module-qtquick2 \
	qml-module-qtsensors \
	qml-module-qtwebchannel \
	qml-module-qtwebengine \
	qml-module-qtwebsockets \
	qml-module-qtwebview \
	qmlscene \
	vim \
	wget \
	xauth

RUN apt-get -qqy clean

WORKDIR /app
CMD ["qmlscene"]
