FROM continuumio/miniconda3
MAINTAINER Nick Waters <nickp60@gmail.com>
RUN apt-get update
RUN apt-get install build-essential cpanminus emboss bioperl  hmmer -y
RUN git clone https://github.com/martinwu/AMPHORA2
RUN conda install -c bioconda raxml
WORKDIR AMPHORA2
RUN chmod +x ./Scripts/* && ln -s ./Scripts/* /bin/
RUN mv Marker/ /
# run this for testing
#RUN perl Scripts/MarkerScanner.pl -Bacteria -DNA TestData/ecoli.fasta
ENTRYPOINT [ "perl" ]
