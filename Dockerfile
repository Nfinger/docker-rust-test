FROM python:3.6.1
FROM rust:1.31.0

# create a new empty shell project
RUN USER=root cargo new --bin my-project
WORKDIR /my-project

# copy over your manifests
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml

# this build step will cache your dependencies
RUN cargo build --release
RUN rm src/*.rs

# copy your source tree
COPY ./src ./src

# build for release
RUN rm ./target/release/deps/my_project*
RUN cargo build --release

CMD ["python","pytest.py"]
