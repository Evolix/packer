#!/usr/bin/make -f

.PHONY: evolinux packmail clean

evolinux:
	./scripts/make_template evolinux | PACKER_CACHE_DIR='build/packer' packer build -parallel=false -

packmail:
	./scripts/make_template packmail | PACKER_CACHE_DIR='build/packer' packer build -parallel=false -

packweb:
	./scripts/make_template packweb | PACKER_CACHE_DIR='build/packer' packer build -parallel=false -

clean:
	rm -rf build/*
