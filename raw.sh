#!/bin/bash
echo 'clear; obj 12 29 expr~ '$1';obj 12 271 s~ wave;obj 12 3 r~ time;connect 0 0 1 0;connect 2 0 0 0;'
