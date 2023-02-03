FROM alpine:3.16.0

# must install some image package to enable +on2 flag of dcmj2pnm 
RUN apk update && \
    apk add --no-cache bash openssl ca-certificates libstdc++ g++ make git libpng-dev && \
    git clone https://github.com/DCMTK/dcmtk.git && \
    cd dcmtk/config && \
    ./rootconf && \
    cd .. && \
    ./configure --ignore-deprecation && \
    make all && \
    make install && \
    make distclean && \
    cd .. && \
    rm -r dcmtk