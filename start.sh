#!/bin/sh

socat -d -d -d TCP4-LISTEN:60006,reuseaddr,fork EXEC:"./main.rb"
