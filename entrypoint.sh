#!/bin/bash
TMOD_EXECUTOR=${TMOD_LIB_DIR}/start-tModLoaderServer.sh
chmod u+x ${TMOD_EXECUTOR}
tmux new-session -d ${TMOD_EXECUTOR} -nosteam -config ${TMOD_CONFIG_DIR}/server.config -savedirectory $(dirname ${TMOD_CONFIG_DIR})
while true; do
    sleep ${SAVE_INTERVAL} && \
    tmux send-keys "say SAVE NOW!" Enter && \
    tmux send-keys "save" Enter && \
    tmux send-keys "say SAVE COMPLETE!" Enter
done
