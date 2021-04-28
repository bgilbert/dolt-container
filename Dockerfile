FROM fedora:33
ARG VERSION=v0.26.2
RUN set -o pipefail && curl -sL "https://github.com/dolthub/dolt/releases/download/${VERSION}/dolt-linux-amd64.tar.gz" | tar xzv --strip-components 1 -C /usr && mv /usr/LICENSES /
ENTRYPOINT /usr/bin/dolt
