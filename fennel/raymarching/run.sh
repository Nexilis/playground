#!/usr/bin/env bash

fennel --compile main.fnl > main.lua

love .
