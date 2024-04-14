#!/bin/bash -e

(cd ./dmenu && make clean all)
(cd ./st && make clean all)
(cd ./slock && make clean all)

echo "Built all programs."
echo "DONE."
