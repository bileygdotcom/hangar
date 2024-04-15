# syntax=docker/dockerfile:1,

FROM ubuntu:22.04

LABEL project="Hangar"\
      version="1.3"\
      mark="u2204+dotnet_6.0"\
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

RUN apt-get install -qfy libcanberra-gtk-module libcanberra-gtk3-module
RUN apt-get install -y aspnetcore-runtime-6.0
