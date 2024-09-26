FROM fedora:40

RUN dnf install 'dnf-command(builddep)' tini git -y ; dnf builddep sssd -y

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["sleep", "infinity"]