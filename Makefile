DBG_MAKEFILE ?=
ifeq ($(DBG_MAKEFILE),1)
	$(warning ***** starting Makefile for goal(s) "$(MAKECMDGOALS)")
	$(warning ***** $(shell date))
else
	# If we're not debugging the Makefile, don't echo recipes.
	MAKEFLAGS += -s
endif

# Metadata for driving the build lives here.
META_DIR := .make
SHELL := /usr/bin/env bash

.PHONY: help build_image run_image

default: help

help:
	
	@echo "---> Help menu:"
	@echo ""
	@echo "Help output:"
	@echo "make help"
	@echo ""
	@echo "Builds the docker image artifact"
	@echo "make build_image"
	@echo ""
	@echo "Sends the image artifact to the quay repository"
	@echo "make run_image"
	@echo ""

build_image:
	docker build -t quay.io/ukhomeofficedigital/docker-jenkins-config .

run_image: 
	docker run --name jenkins -d -t quay.io/ukhomeofficedigital/docker-jenkins-config
