FROM bitnami/python:3.9-prod   

# set working directory
WORKDIR /app

# install pip
RUN apt-get update && apt-get install -y python3-pip

# update pip
RUN pip3 install --upgrade pip

# add requirements
COPY ./requirements.txt /app/requirements.txt

# install requirements
RUN pip3 install -r requirements.txt

CMD python summarize.py

COPY src/*.py .

# force download of the hugging face models into the container
RUN python3 download_hf_models_at_buildtime.py 

