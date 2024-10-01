# syntax=docker/dockerfile:1.3-labs

FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine

ARG SONARSCANNER_VERSION
ARG COVERLET_VERSION

# Prerequirements

## Install Java
RUN apk --no-cache add openjdk17 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

## Install SonarScanner
RUN <<EOF
if [ ! -z "${SONARSCANNER_VERSION}" ]; then
  dotnet tool install --global dotnet-sonarscanner --version ${SONARSCANNER_VERSION}
else
  dotnet tool install --global dotnet-sonarscanner
fi
EOF

## Install Coverlet
RUN <<EOF
if [ ! -z "${COVERLET_VERSION}" ]; then
  dotnet tool install --global coverlet.console --version ${COVERLET_VERSION}
else
  dotnet tool install --global coverlet.console
fi
EOF

## Include the global tools location in the Path
ENV PATH="${PATH}:/root/.dotnet/tools"


COPY --chmod=0755 entrypoint.sh .

ENTRYPOINT [ "/bin/sh", "-c", "./entrypoint.sh" ]