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
