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


# Copy just the compiled binaries
FROM haskell:8.4.3
COPY --from=build /root/.local/bin/futhark* /root/.local/bin/

# Run futharki
CMD futharki