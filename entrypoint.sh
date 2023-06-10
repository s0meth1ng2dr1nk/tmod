#!/usr/bin/env bash
tmux new-session -d bash /tmod/tmodloader/start-tModLoaderServer.sh -nosteam -savedirectory /opt/tmod -config /opt/tmod/server.config
while true; do
    sleep 300 && \
    tmux send-keys "save" Enter
done
