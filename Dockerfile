FROM registry.fedoraproject.org/fedora:34
ARG VERSION=v0.40.6
RUN set -o pipefail && curl -sL "https://github.com/dolthub/dolt/releases/download/${VERSION}/dolt-linux-amd64.tar.gz" | tar xzv --strip-components 1 -C /usr && mv /usr/LICENSES /
ENTRYPOINT /usr/bin/dolt
