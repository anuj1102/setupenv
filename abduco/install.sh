#!/bin/sh

LOCAL_PROG_PATH=$HOME/.local/bin
./configure --prefix=$LOCAL_PROG_PATH && make && make install
