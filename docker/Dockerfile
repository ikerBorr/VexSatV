ARG VERILATOR_REF=v5.030
ARG XPACK_RISCV_VERSION=14.2.0-3

#---------------- SPINALHDL IMAGE ----------------

FROM eclipse-temurin:21-jdk-jammy AS base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        git curl ca-certificates gnupg bash xz-utils \
    && rm -rf /var/lib/apt/lists/*

RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" \
      > /etc/apt/sources.list.d/sbt.list \
    && echo "deb https://repo.scala-sbt.org/scalasbt/debian /" \
      > /etc/apt/sources.list.d/sbt_old.list \
    && curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" \
      | gpg --dearmor -o /etc/apt/trusted.gpg.d/scalasbt-release.gpg \
    && apt-get update && apt-get install -y --no-install-recommends sbt \
    && rm -rf /var/lib/apt/lists/*


#---------------- VERILATOR IMAGE ----------------

FROM base AS sim

ARG VERILATOR_REF

RUN apt-get update && apt-get install -y --no-install-recommends \
        perl python3 make autoconf g++ flex bison ccache \
        libfl2 libfl-dev zlib1g zlib1g-dev help2man \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch "${VERILATOR_REF}" \
        https://github.com/verilator/verilator /tmp/verilator \
    && cd /tmp/verilator \
    && autoconf && ./configure && make -j"$(nproc)" && make install \
    && cd / && rm -rf /tmp/verilator


#---------------- SPINALHDL IMAGE ----------------

FROM sim AS dev

ARG XPACK_RISCV_VERSION

RUN set -eux; \
    case "$(uname -m)" in \
        x86_64)  xarch=x64   ;; \
        aarch64) xarch=arm64 ;; \
        armv7l)  xarch=arm   ;; \
        *) echo "unsupported arch: $(uname -m)" >&2; exit 1 ;; \
    esac; \
    url="https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v${XPACK_RISCV_VERSION}/xpack-riscv-none-elf-gcc-${XPACK_RISCV_VERSION}-linux-${xarch}.tar.gz"; \
    curl -fsSL "$url" -o /tmp/riscv.tar.gz; \
    mkdir -p /opt/riscv; \
    tar -xzf /tmp/riscv.tar.gz -C /opt/riscv --strip-components=1; \
    rm /tmp/riscv.tar.gz
    
ENV PATH="/opt/riscv/bin:${PATH}"
ENV HOME=/cache \
    COURSIER_CACHE=/cache/coursier \
    SBT_OPTS="-Dsbt.global.base=/cache/sbt -Dsbt.boot.directory=/cache/sbt/boot -Dsbt.ivy.home=/cache/ivy"

RUN mkdir -p /cache/sbt /cache/ivy /cache/coursier && chmod -R 0777 /cache

RUN groupadd -g 1000 dev && useradd -u 1000 -g 1000 -s /bin/bash dev
USER dev

WORKDIR /work
CMD ["bash"]