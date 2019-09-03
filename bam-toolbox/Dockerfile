FROM rackspacedot/python27-ansible23

MAINTAINER Ye Wang <yewangfaith@gmail.com>

RUN wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 && \
    tar jxf samtools-1.9.tar.bz2 && \
    cd samtools-1.9 && ./configure && make install

RUN pip install https://github.com/AndersenLab/bam-toolbox/archive/0.0.3.tar.gz