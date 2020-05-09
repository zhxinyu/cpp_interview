FROM centos:centos7

ENV GCC_VERSION="10.1.0"
ENV GCC_TAR="gcc-${GCC_VERSION}.tar.xz"

COPY gcc_build.sh /tmp/gcc_build.sh
RUN yum install -y bzip2 gcc make gcc-c++ glibc bison texinfo \
	&& /tmp/gcc_build.sh ${GCC_VERSION} \
	&& mkdir -p /opt/gcc \
	&& cd /opt/gcc \
	&& tar -Jxf /root/${GCC_TAR} \
	&& touch /var/lib/rpm/* \
    && yum install -y https://centos7.iuscommunity.org/ius-release.rpm \
	&& yum install -y git vim cmake3 glibc-devel \
	&& rm /root/${GCC_TAR} /${GCC_TAR} \
	&& rm -rf /gcc-${GCC_VERSION} \
	&& yum remove -y gcc cpp \
	&& yum clean all && rm -rf /var/cache/yum/* \
	&& rm -rf /objdir

ENV GCC_ROOT=/opt/gcc/gcc-${GCC_VERSION}
ENV PATH=${GCC_ROOT}/bin${PATH:+:${PATH}}
ENV MANPATH=${GCC_ROOT}/share/man:${MANPATH}
ENV INFOPATH=${GCC_ROOT}/share/info${INFOPATH:+:${INFOPATH}}
ENV LD_LIBRARY_PATH=${GCC_ROOT}/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

RUN yum install -y boost-devel gtest-devel && ln -s /usr/bin/cmake3 /usr/bin/cmake

