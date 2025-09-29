#!/bin/bash

read -p "Introdueix un fitxer o directori o tar.gz (El seu nom EXACTE): " input
if

locate $input | grep -v "Trash"