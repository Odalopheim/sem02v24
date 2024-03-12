FROM ubuntu:24.04
RUN apt-get update \
&& apt-get dist-upgrade -y \
&& apt-get autoremove -y \
&& apt-get autoclean -y \
&& apt-get install -y \
sudo \
nano \
wget \
curl \
git
RUN useradd -G sudo -m -d /home/Oda -s /bin/bash -p "$(openssl passwd -1 Hei)" Oda
USER Oda
WORKDIR /home/Oda
RUN mkdir hacking \
&& cd hacking \
&& curl -SL https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v2 4/pawned.sh > pawned.sh \
&& chmod 764 pawned.sh \
&& cd ..
RUN git config --global user.email "Odalo@uia.no" \
&& git config --global user.name "Oda" \
&& git config --global url."https://PAT:@github.com/".insteadOf "https://github.com" \
&& mkdir -p github.com/Odalopheim/sem02v24
USER root
RUN curl -SL https://go.dev/dl/go1.21.7.linux-arm64.tar.gz \
| tar xvz -C /usr/local
USER Oda
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/Oda/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"