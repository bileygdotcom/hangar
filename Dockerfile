# syntax=docker/dockerfile:1,

FROM ubuntu:22.04

LABEL project="Hangar"\
      version="1.2"\
      mark="u2204+dotnet_6.0"\
      mantainer="bileyg"\
      company="Ascon"
      
ENV ASPNETCORE_URLS=http://+:80

COPY libs /App/libs

RUN apt-get update

RUN DEBIAN_FRONTEND="noninteractive"\
 apt-get install -y supervisor\
  apt-utils\
  unzip\
  libgomp1\
  mupdf-tools\
  links\
  mc\
  wget\
  nano\
  libgdiplus
  
#RUN cd /App/libs && dpkg -i gcc-10-base_10.2.1-6_amd64.deb gcc-12-base_12-20220319-1_amd64.deb libgcc-s1_12-20220319-1_amd64.deb libstdc++6_10.2.1-6_amd64.deb libicu63_63.1-6+deb10u3_amd64.deb packages-microsoft-prod.deb
RUN cd /App/libs && dpkg -i packages-microsoft-prod.deb
RUN rm -R /App/libs
RUN apt-get update
RUN apt-get install -y dotnet-runtime-6.0
  

    


