#!/bin/bash

url="http://olimpiada.lan:9001/cms"
auth="httpusr:httppwd"
cmsdir="/home/user/cms"
venv="${cmsdir}/venv"
srcdir="${cmsdir}/src/cms"
confdir="${srcdir}/examples"

# get config
cd "${confdir}"
curl -s -O -u "${auth}" "${url}/cms.conf"
curl -s -O -u "${auth}" "${url}/cms.ranking.conf"

# get contest id
contestid=$(curl -s -u "${auth}" "${url}/contestid/")

# run
cd "${srcdir}"
source "${venv}/bin/activate"
cmsResourceService -a "${contestid}"
