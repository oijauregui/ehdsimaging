#!/bin/bash

_genonce.sh

echo Copying output to output-stable
rm -Rf output-stable/*
cp -R output/* output-stable

