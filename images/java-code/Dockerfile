FROM openjdk as onlybuild
# java supported image from ORacle 
LABEL name=ashutoshh
LABEL email=ashutoshh@linux.com
RUN mkdir /javacode 
COPY .  /javacode/
# current location of dockerfile everything will be copied to /javacode 
WORKDIR  /javacode 
# changing working directory to above like cd commnad in nix 
RUN javac * 

FROM openjdk  
COPY  --from=onlybuild  /javacode/*.class  /mnt/
WORKDIR /mnt
ENTRYPOINT ["java"]
CMD ["hello"]
# process java hello / during container creation time myclass 
