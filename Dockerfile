FROM fedora:40

RUN dnf install 'dnf-command(builddep)' tini git libcap-devel -y ; dnf builddep sssd -y

RUN mkdir /workspaces ; cd /workspaces ; \
    git clone https://github.com/SSSD/sssd ; cd sssd ; \
    /workspaces/sssd/contrib/ci/run -d

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["sleep", "infinity"]