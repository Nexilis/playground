#!/usr/bin/env bash

fennel --compile tests.fnl > tests.lua && cat tests.lua && lua tests.lua -v

