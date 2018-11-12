FROM haskell:8.4.3 AS build

ARG VERSION=v0.7.4

RUN apt-get update && \
	apt-get install -y \
		git

WORKDIR /futhark

# Checkout required version
RUN git clone https://github.com/diku-dk/futhark.git .
RUN git checkout $VERSION

# Build
RUN stack setup
RUN stack install alex happy
RUN stack build
RUN stack install


# Image including just the binaries
FROM debian:stretch-slim

# Needed to have libgmp.so
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		g++

# Copy binaries
COPY --from=build /root/.local/bin/futhark* /root/.local/bin/
ENV PATH /root/.local/bin:$PATH

# Run futharki
CMD futharki
