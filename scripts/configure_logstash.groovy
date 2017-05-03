#!/usr/bin/env groovy

import jenkins.install.*
import jenkins.model.*
import hudson.model.*
import jenkins.plugins.logstash.LogstashInstallation
import jenkins.plugins.logstash.persistence.LogstashIndexerDao.IndexerType

def instance = Jenkins.getInstance()

def descriptor = instance.getDescriptor(LogstashInstallation.class)
descriptor.type = IndexerType.ELASTICSEARCH
descriptor.host = System.getenv('ELASTICSEARCH_HOST')
descriptor.port = System.getenv('ELASTICSEARCH_PORT').toInteger()
descriptor.key = System.getenv('ELASTICSEARCH_INDEX')

System.setProperty('jenkins.install.runSetupWizard', 'false')

instance.save()
