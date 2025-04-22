# Use official Rust image
FROM rust:1.76

# 1) Install C/C++ build tools and zlib headers (for GraphChi’s -lz)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential
      zlib1g-dev 
      bash 
    && rm -rf /var/lib/apt/lists/*

# 2) Set working directory
WORKDIR /cost

# 3) Copy your Rust repo (and any sub‑folders like graphchi-cpp/) in
COPY . .

# 4) (Optional) If graphchi-cpp/ exists, build it
# RUN if [ -d "./graphchi-cpp" ]; then \
#       cd graphchi-cpp && \
#       make -j"$(nproc)"; \
#     fi

# 5) Build the Rust project in release mode
RUN cargo build --release

# 6) Drop into a shell by default so you can poke around and run binaries
CMD ["/bin/bash"]