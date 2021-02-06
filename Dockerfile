FROM fedora:33
ARG VERSION=v0.22.14
RUN set -o pipefail && curl -sL "https://github.com/dolthub/dolt/releases/download/${VERSION}/dolt-linux-amd64.tar.gz" | tar xzv --strip-components 1
ENTRYPOINT /bin/dolt
