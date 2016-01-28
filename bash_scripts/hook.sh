#!/bin/bash

wget -O projectmaster.zip -q https://github.com/bdensmore/dita-docs/archive/master.zip

if [ -f projectmaster.zip ]; then
    rm -rf dita-docs-master
    # rm -rf public/
    # Unzip the zip file
    unzip -q projectmaster.zip

    # Delete zip file
    rm projectmaster.zip


    # chmod 777 -R ../executable-files/dita-ot-2.2.1/

    executable-files/dita-ot-2.2.1/bin/dita -i dita-docs-master/flowers.ditamap -f tocjs -o public

    rm -rf dita-docs-master/

    mv public/flowers.html public/index.html
    # Perhaps call any other scripts you need to rebuild assets here
    # or set owner/permissions
    # or confirm that the old site was replaced correctly
fi
