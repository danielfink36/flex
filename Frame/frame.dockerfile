FROM python:buster
LABEL Admin="danielfink36@gmail.com"

RUN mkdir -p flex/frame \
&& mkdir -p flex/build_plans
WORKDIR /home

RUN apt-get update -y \
&& apt-get install vim -y \
&& apt install python3-pip -y \
&& apt-get install curl -y \
&& apt-get install software-properties-common -y \
&& apt update -y

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
&& unzip awscliv2.zip \
&& ./aws/install

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
&& apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
&& apt-get update && apt-get install terraform -y
