#!/usr/bin/env bash

sh compile.sh
mkdir -p tests
cp bin/logic.lua tests/logic.lua
fennel --compile src/tests.fnl > tests/tests.lua
(cd tests && lua tests.lua -v)
