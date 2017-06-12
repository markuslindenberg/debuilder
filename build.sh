#!/bin/bash

set -e
cp -r /input /build/source && chown -R build: /build/source
cd /tmp && mk-build-deps -i -r /build/source/debian/control
cd /build/source && sudo -u build debuild -us -uc -b

OWNER=$(stat -c %u:%g /output) && \
	find /build -maxdepth 1 -type f \
	-execdir cp -f -t /output '{}' \; \
	-execdir chown "$OWNER" '/output/{}' \; 
