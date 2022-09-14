FROM alpine:latest

WORKDIR /build

RUN apk update
RUN apk upgrade --available && sync

RUN apk add curl git cargo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# RChef, a Rust-based Chef interpreter
# (all credit to GitHub user booleancoercion for this masterpiece)
RUN git clone https://github.com/richarah/rchef
RUN cd rchef && cargo build --release --
RUN mv /build/rchef/target/release/rchef /usr/local/bin/rchef

# Cleanup
RUN rm -rfv /build
ADD recipes /recipes
WORKDIR /recipes
CMD /bin/sh
