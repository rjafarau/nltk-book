# Start from a core stack version
FROM jupyter/scipy-notebook:1386e2046833

# Install Jupyter Notebook's extensions
# RUN conda install -c conda-forge jupyter_contrib_nbextensions && \
# 	  jupyter nbextensions_configurator enable --user
	
# Install Jupyter Lab's extensions
RUN jupyter labextension install \
  @jupyterlab/toc@1.0.1 \
  jupyterlab-clipboard-image@0.0.2
RUN jupyter lab build

# Install additional packages
RUN pip install nltk==3.4.5

# Copy MEGAM binaries
COPY megam-64.opt /home/jovyan/megam/

# Install Prover9 and Mace4
# https://www.cs.unm.edu/~mccune/prover9/download/
USER root
WORKDIR /home/jovyan/
COPY LADR-2009-11A.tar.gz Makefile ./
RUN tar -zxvf LADR-2009-11A.tar.gz \
  && rm LADR-2009-11A.tar.gz \
  && mv LADR-2009-11A prover9 \
  && mv Makefile prover9/provers.src/ \
  && cd prover9/ \
  && make all
USER jovyan
