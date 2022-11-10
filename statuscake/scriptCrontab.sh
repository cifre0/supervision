#!/bin/bash

if [[ $(systemctl is-active nginx) == "active" ]]; then curl -X POST "https://push.statuscake.com/?PK=53c95866914c6cf&TestID=6678558&time=0" ; fi
