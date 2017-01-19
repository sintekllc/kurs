FROM andrewosh/binder-base

MAINTAINER Jeremy Freeman <freeman.jeremy@gmail.com>

USER root

# Add dependency
RUN apt-get update


USER main

# Install requirements for Python 2
ADD requirements.txt requirements.txt
RUN pip install -I --upgrade setuptools
RUN pip install --upgrade ipywidgets
RUN pip install -r requirements.txt
RUN jupyter nbextension enable --py --sys-prefix ipyleaflet

RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN echo "c.NotebookApp.token = ''" >> jupyter_notebook_config.py
RUN echo "c.NotebookApp.password = ''" >> jupyter_notebook_config.py

ADD regions.csv regions.csv

# Install requirements for Python 3
RUN /home/main/anaconda/envs/python3/bin/pip install -r requirements.txt
