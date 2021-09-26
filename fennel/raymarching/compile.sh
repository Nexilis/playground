#!/usr/bin/env bash

mkdir -p bin
fennel --compile logic.fnl > bin/logic.lua
fennel --compile main.fnl > bin/main.lua

