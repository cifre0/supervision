#!/bin/bash

if [[ $(service nginx status | awk '{print $4}') == "running" ]]; then curl -X POST "https://push.statuscake.com/?PK=53c95866914c6cf&TestID=6678558&time=0" ; fi
