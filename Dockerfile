FROM lsiobase/xenial

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Alexandru Mirică <n3mur1t0r@gmail.com>"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y \
	bc \
	binutils \
	bsdmainutils \
	bzip2 \
	ca-certificates \
	curl \
	file \
	gzip \
	libmariadb2 \
	mailutils \
	postfix \
	python \
	tmux \
	unzip \
	util-linux \
	wget && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 9987/udp 30033 10011 41144
VOLUME /config
