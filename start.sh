#!/bin/sh

socat -d -d -d TCP4-LISTEN:60000,reuseaddr,fork EXEC:"./main.rb"