FROM registry.fedoraproject.org/fedora:26

MAINTAINER Gerard Ryan <gryan@redhat.com>

RUN dnf install -y --setopt=tsflags=nodocs python3-pip git && \
    dnf clean all && \
    git clone -b ghprb-blacklist-target-branches-dockerfile https://github.com/grdryn/jenkins-job-builder.git

WORKDIR jenkins-job-builder

RUN pip3 install -r requirements.txt && python3 setup.py install
