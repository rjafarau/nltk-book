# Start from a core stack version
FROM jupyter/scipy-notebook:82d1d0bf0867

# TEMP - Install the newest Jupyter Lab
RUN conda install -c conda-forge jupyterlab

# Install Jupyter Notebook's extensions
# RUN conda install -c conda-forge jupyter_contrib_nbextensions && \
# 	  jupyter nbextensions_configurator enable --user
	
# Install Jupyter Lab's extensions
RUN jupyter labextension install @jupyterlab/toc
RUN jupyter lab build

# Install additional packages
RUN pip install nltk==3.4.5
