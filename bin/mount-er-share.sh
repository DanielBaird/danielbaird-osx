#!/bin/bash

mount_smbfs -N "//shares.ad.jcu.edu.au/ri/ERES_general" ${HOME}/ershare
#/sbin/mount -t smbfs "//AD;jc252807@ri-share/ri/eResearch" ${HOME}/Desktop/eResearchShare