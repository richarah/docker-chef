FROM alpine:latest

WORKDIR /build

RUN apk update
RUN apk upgrade --available && sync

RUN apk add curl git cargo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# RChef, a Rust-based Chef interpreter
# (all credit to GitHub user booleancoercion for this thing of beauty)
RUN git clone https://github.com/richarah/rchef && \ 
    cd rchef && cargo build --release -- && \
    mv /build/rchef/target/release/rchef /usr/local/rchef

WORKDIR /home

# Cleanup
RUN rm -rfv /build

CMD /bin/sh
