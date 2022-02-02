FROM ubuntu:18.04

WORKDIR /root/

RUN apt-get -y update

RUN apt-get install --fix-missing

RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils

RUN apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev

RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:bitcoin/bitcoin

RUN apt-get -y update

RUN apt-get install -y libdb4.8-dev libdb4.8++-dev

RUN apt-get install -y libminiupnpc-dev

RUN apt-get install -y libzmq3-dev

RUN apt install -y git

RUN git clone https://github.com/VSolidus/solidus.git && cd solidus

RUN chmod +x autogen.sh ./share/genbuild.sh

RUN ./autogen.sh

RUN ./configure --disable-tests --disable-bench

RUN make

RUN make install