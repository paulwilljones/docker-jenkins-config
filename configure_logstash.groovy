import jenkins.model.*
import hudson.model.*
import jenkins.plugins.logstash.LogstashInstallation
import jenkins.plugins.logstash.LogstashNotifier

def instance = Jenkins.getInstance()

def installation = new LogstashInstallation(name, home, properties)
def descriptor = installation.getLogstashDescriptor()
descriptor.type = "ELASTICSEARCH"
descriptor.port = 80
descriptor.key = "/logstash/logs"

def notifier = new LogstashNotifier(-1, false)

instance.save()
