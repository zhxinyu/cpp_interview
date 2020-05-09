FROM centos:centos7

RUN yum install -y bzip2 gcc make gcc-c++ glibc bison texinfo

COPY gcc_build.sh /tmp/gcc_build.sh
RUN /tmp/gcc_build.sh 10.1.0
	
ENV GCC_VERSION="10.1.0"
ENV GCC_TAR="gcc-${GCC_VERSION}.tar.xz"
ENV GCC_ROOT=/opt/gcc/gcc-${GCC_VERSION}
ENV PATH=${GCC_ROOT}/bin${PATH:+:${PATH}}
ENV MANPATH=${GCC_ROOT}/share/man:${MANPATH}
ENV INFOPATH=${GCC_ROOT}/share/info${INFOPATH:+:${INFOPATH}}
ENV LD_LIBRARY_PATH=${GCC_ROOT}/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

RUN touch /var/lib/rpm/* && \
    yum install -y https://centos7.iuscommunity.org/ius-release.rpm && \
	yum install -y git vim cmake3 glibc-devel \
	&& yum clean all && rm -rf /var/cache/yum/*

RUN mkdir -p /opt/gcc \
	&& cd /opt/gcc \
	&& tar -Jxf /root/${GCC_TAR} 

RUN yum remove -y gcc cpp

RUN yum install -y boost-devel gtest-devel && ln -s /usr/bin/cmake3 /usr/bin/cmake

