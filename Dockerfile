FROM wiggins/alpine:3.7
MAINTAINER from wiggins
ENV LANG C.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.7-openjdk/jre/bin:/usr/lib/jvm/java-1.7-openjdk/bin
ENV JAVA_VERSION 7u151
ENV JAVA_ALPINE_VERSION 7.151.2.6.11-r0
RUN set -x && \
	apk add --no-cache \
		openjdk7="$JAVA_ALPINE_VERSION" && \
	{ \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home && \
	chmod +x /usr/local/bin/docker-java-home && \
	[ "$JAVA_HOME" = "$(docker-java-home)" ]
