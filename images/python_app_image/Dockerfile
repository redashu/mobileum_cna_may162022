FROM python
# FROM will be useful to pull image from docker hub during image build time
LABEL email=ashutoshh@linux.com 
LABEL name=ashutoshh 
# to share info about image designer / builder 
RUN  mkdir /mob_project 
# during build time it will give you shell access 
COPY mob.py  /mob_project/mob.py 
# from source to docker engine data copy 
CMD  ["python","/mob_project/mob.py"]
# this will not execute during image build time 
# this is going to be consider as default process of container
