FROM alpine
MAINTAINER name=ashutoshh
RUN apk add python3 
# apk is installer for alpine image 
RUN mkdir /code 
ADD https://raw.githubusercontent.com/redashu/pythonLang/main/while.py /code/ 
# in copy u can't use URL while add can take local and URL sources
ENTRYPOINT  python3  /code/while.py 
