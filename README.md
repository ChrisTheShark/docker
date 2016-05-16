#### Table of Contents

1. [Overview](#overview)
1. [Setup - The basics of getting started with docker](#setup)
1. [Usage](#usage)
1. [Limitations](#limitations)

## Overview

The docker module installs the global docker-engine package and starts the 
docker daemon.

## Setup

### What docker affects:
* the docker-engine package
* the docker daemon

## Usage

To install the latest docker in the default location and start the service:

include docker

To install a particular version of docker:

class { 'docker':
  version => '1.9.1',
}

## Limitations

This module has received limited testing on:

* CentOS/RHEL 6/7
* Ubuntu 14.04/15.10

This module does not currently add users to the docker group.
