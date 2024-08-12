FROM ubuntu:focal

LABEL project="Hangar"\
      version="1.5"\
      mark="u2004+dotnet_8.0"\
      mantainer="bileyg"\
      company="Ascon"
      
ENV ASPNETCORE_URLS=http://+:80

RUN apt-get update
RUN apt-get -qfy upgrade

RUN DEBIAN_FRONTEND="noninteractive"\
 apt-get install -y\
  supervisor\
  apt-utils\
  unzip\
  libgomp1\
  mupdf-tools\
  links\
  mc\
  wget\
  nano\
  libgdiplus
  
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

RUN apt-get update

RUN apt-get install -qfy libcanberra-gtk-module libcanberra-gtk3-module
RUN apt-get install -y aspnetcore-runtime-6.0
