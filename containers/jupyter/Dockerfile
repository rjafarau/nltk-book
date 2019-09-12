# Start from a core stack version
FROM jupyter/scipy-notebook:1386e2046833

# Install Jupyter Notebook's extensions
# RUN conda install -c conda-forge jupyter_contrib_nbextensions && \
# 	  jupyter nbextensions_configurator enable --user
	
# Install Jupyter Lab's extensions
RUN jupyter labextension install @jupyterlab/toc
RUN jupyter lab build

# Install additional packages
RUN pip install nltk==3.4.5
