# syntax=docker/dockerfile:1,

FROM mcr.microsoft.com/dotnet/runtime:5.0

LABEL project="Hangar"\
      version="0.4" \
      mantainer="bileyg"\
      company="Ascon Complex"

COPY libs /App/libs

RUN apt-get update

RUN DEBIAN_FRONTEND="noninteractive"\
 apt-get install -y apt-utils\
  supervisor\
  unzip\
  libgomp1\
  mupdf-tools\
  libgdiplus\
  links\
  mc
    
RUN cd /App/libs && dpkg -i gcc-10-base_10.2.1-6_amd64.deb gcc-12-base_12-20220319-1_amd64.deb libgcc-s1_12-20220319-1_amd64.deb libstdc++6_10.2.1-6_amd64.deb
    
#COPY supervisor /etc/supervisor/conf.d/
