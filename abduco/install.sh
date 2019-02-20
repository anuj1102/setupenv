#!/bin/sh

LOCAL_PROG_PATH=$HOME/.local
./configure --prefix=$LOCAL_PROG_PATH && make && make install
