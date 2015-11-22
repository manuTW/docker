#!/bin/bash

/root/build.sh
cd /mysrc/libiconv-1.13.1; make install
cd /mysrc/tv; make install


