FROM centos
MAINTAINER [Alejandro Baez](https://twitter.com/a_baez)

# mkdir for steam and starbound
RUN mkdir -p /opt/steamcmd
RUN mkdir -p /srv/starbound

ENV STEAM_USERNAME
ENV STEAM_PASSWORD

WORKDIR /opt/steamcmd
RUN curl -s http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar xzvf

RUN ./steamcmd.sh \
  +@NoPromptForPassword 1 +login $STEAM_USERNAME $STEAM_PASSWORD \
  +force_install_dir /srv/starbound \
  +app_update 211820 validate \
  +quit

# Server ports
EXPOSE 21025
EXPOSE 21026

RUN chown -R $STEAM_USERNAME /srv/starbound
WORKDIR /srv/starbound/linux64

CMD ["./starbound_server"]
