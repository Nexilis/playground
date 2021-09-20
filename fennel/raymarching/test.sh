#!/usr/bin/env bash

fennel --compile main.fnl > main.lua
fennel --compile tests.fnl > tests.lua && lua tests.lua -v

