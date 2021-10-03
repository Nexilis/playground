#!/usr/bin/env bash

mkdir -p bin
fennel --compile src/logic.fnl > bin/logic.lua
fennel --compile src/main.fnl > bin/main.lua

