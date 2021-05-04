FROM docker.pkg.github.com/shikanime/shikanime/fluctlight:0.3.2-cuda-11.3.0-cudnn8-devel-ubuntu18.04

# Switch to root user for system installation
USER root

# Install Python dependencies
RUN --mount=type=cache,target=/var/cache/apt \
  apt-get update -y && DEBIAN_FRONTEND=noninteractive \
  apt-get install -y --no-install-recommends \
  libbz2-dev libsqlite3-dev libssl-dev libreadline-dev liblzma-dev\
  libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev tk-dev \
  libssl-dev openssl libffi-dev gcc g++ make graphviz

# Switch to user land
USER sakamoto

# Install ASDF Python plugin
RUN asdf plugin-add python