FROM ubuntu:xenial
RUN mkdir /opt/connectiq
ENV CONNECTIQ_VERSION 3.1.8-2020-03-04-e5981d10b
WORKDIR /opt/connectiq
RUN apt-get update &&\
    apt-get install -y libpng-dev libwebkitgtk-1.0-0 curl unzip libusb-1.0-0 default-jdk locales &&\
    curl -O https://developer.garmin.com/downloads/connect-iq/sdks/connectiq-sdk-lin-$CONNECTIQ_VERSION.zip &&\
    unzip *.zip &&\
    rm *.zip &&\
    apt-get purge -y unzip curl &&\
    apt-get autoremove -y &&\
    apt-get clean &&\
    locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV PATH /opt/connectiq/bin:$PATH

CMD ["/opt/connectiq/bin/connectiq"]
