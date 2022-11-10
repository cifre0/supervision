#!/bin/bash

if [[ $(systemctl is-active nginx) == "active" ]]; then curl -X POST "https://push.statuscake.com/?PK=7eed99d04845a40&TestID=6678247&time=0" ; fi
