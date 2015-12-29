#!/bin/bash

/opt/steamcmd/steamcmd.sh \
  +@NoPromptForPassword 1 \
  +login $STEAM_USERNAME $STEAM_PASSWORD \
  +force_install_dir /srv/starbound \
  +app_update 211820 validate \
  +quit

