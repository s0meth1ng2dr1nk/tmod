#!/usr/bin/env bash
tmux new-session -d bash /tmod/tmodloader/start-tModLoaderServer.sh -nosteam -config /opt/tmod/tModLoader/server.config -savedirectory /opt/tmod 
while true; do
    sleep 300 && \
    tmux send-keys "say saving...." Enter && \
    tmux send-keys "save" Enter && \
    tmux send-keys "say saved!" Enter
done
