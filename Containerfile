FROM quay.io/fedora/fedora:42

COPY rpm-repos/tofuutils-tenv.repo /etc/yum.repos.d/tofuutils-tenv.repo
COPY packages /tmp/packages

RUN dnf install -y $(<tmp/packages) && \
    dnf clean all && \
    tenv tofu install latest-stable
