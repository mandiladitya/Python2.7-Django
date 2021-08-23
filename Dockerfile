FROM centos:latest
RUN yum -y update
RUN yum install python2-pip -y
RUN yum install python2-virtualenv -y
RUN python2 -m virtualenv --python=/usr/bin/python2 /opt/venv
# Set Work Dir
WORKDIR /usr/src/app

# Set ENV
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN pip2 install --upgrade pip
COPY ./requirements.txt /usr/src/app
RUN . /opt/venv/bin/activate && pip2 install -r requirements.txt

# Copy Files
COPY . /usr/src/app

EXPOSE 8000
CMD . /opt/venv/bin/activate && python2 manage.py runserver 0.0.0.0:8000

