#!/usr/bin/make -f

.PHONY: evolinux packmail clean

evolinux:
	./scripts/make_template evolinux | PACKER_CACHE_DIR='build/packer' packer build -

packmail:
	./scripts/make_template packmail | PACKER_CACHE_DIR='build/packer' packer build -

clean:
	rm -rf build/*
