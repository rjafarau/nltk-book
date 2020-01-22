# Start from a core stack version
FROM jupyter/scipy-notebook:1386e2046833

# Basic packages
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    default-jre-headless \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER jovyan

# Install Jupyter Notebook's extensions
# RUN conda install -c conda-forge jupyter_contrib_nbextensions && \
# 	  jupyter nbextensions_configurator enable --user
	
# Install Jupyter Lab's extensions
RUN jupyter labextension install \
  @jupyterlab/toc@1.0.1 \
  jupyterlab-clipboard-image@0.0.2
RUN jupyter lab build

##################################################
USER root
WORKDIR /home/jovyan/

# Install Prover9 and Mace4
# https://www.cs.unm.edu/~mccune/prover9/download/
COPY LADR-2009-11A.tar.gz Makefile ./
RUN tar -zxvf LADR-2009-11A.tar.gz \
  && rm LADR-2009-11A.tar.gz \
  && mv LADR-2009-11A prover9 \
  && mv Makefile prover9/provers.src/ \
  && cd prover9/ \
  && make all
ENV PROVER9 /home/jovyan/prover9

# Install Malt Parser
# https://github.com/nltk/nltk/wiki/Installing-Third-Party-Software#malt-parser
# https://stackoverflow.com/questions/13207394/step-by-step-to-getting-malt-parser-in-nltk-to-work
RUN wget http://maltparser.org/dist/maltparser-1.9.2.tar.gz \
  && wget http://www.maltparser.org/mco/english_parser/engmalt.linear-1.7.mco \
  && tar -zxvf maltparser-1.9.2.tar.gz \
  && rm maltparser-1.9.2.tar.gz
ENV MALT_PARSER /home/jovyan/maltparser-1.9.2/
ENV MALT_MODEL /home/jovyan/engmalt.linear-1.7.mco

# Install MEGAM
COPY megam-64.opt /home/jovyan/megam/
ENV MEGAM /home/jovyan/megam/megam-64.opt

USER jovyan
##################################################

# Install additional packages
RUN pip install -q --no-cache-dir nltk==3.4.5

# Additional environment variables
ENV NLTK_DATA /home/jovyan/nltk_data
