FROM onenashev/demo-jenkins-config-as-code:v1.3.0

# Override the Jenkins core by the incrementals or SNAPSHOT version
# Tests https://github.com/jenkinsci/jenkins/pull/3895 at the moment
#ARG JENKINS_INCREMENTALS_VERSION=2.238-rc30075.af661717d7dc
#ENV JENKINS_URL https://repo.jenkins-ci.org/incrementals/org/jenkins-ci/main/jenkins-war/${JENKINS_INCREMENTALS_VERSION}/jenkins-war-${JENKINS_INCREMENTALS_VERSION}.war
ENV JENKINS_URL https://repo.jenkins-ci.org/snapshots/org/jenkins-ci/main/jenkins-war/2.240-SNAPSHOT/jenkins-war-2.240-20200607.194909-2.war

USER root
RUN wget $JENKINS_URL -O /usr/share/jenkins/jenkins.war
USER jenkins

# Install extra plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Inject configuration for the dark theme
COPY enable-theme.groovy /usr/share/jenkins/ref/init.groovy.d/enable-theme.groovy

COPY jenkins3.sh /usr/local/bin/jenkins3.sh
ENTRYPOINT ["tini", "--", "/usr/local/bin/jenkins3.sh"]
