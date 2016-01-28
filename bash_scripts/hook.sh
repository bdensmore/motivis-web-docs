#!/bin/bash

wget -O projectmaster.zip -q https://github.com/bdensmore/dita-docs/archive/master.zip

if [ -f projectmaster.zip ]; then
    rm -rf dita-docs-master

    # Unzip the zip file
    unzip -q projectmaster.zip

    # Delete zip file
    rm projectmaster.zip

    rm -rf public/*.*

    # call DITA Open Toolkit and create HTML Help with TOC
    executable-files/dita-ot-2.2.1/bin/dita -i dita-docs-master/flowers.ditamap -f tocjs -o public

    rm -rf dita-docs-master/

    mv public/flowers.html public/index.html

fi
