# Use official Rust image
FROM rust:1.76

# Set working directory inside the container
WORKDIR /cost

# Copy the entire repo (excluding files in .dockerignore)
COPY . .

# Build the project in release mode
RUN cargo build --release

# Start an interactive shell by default
CMD ["/bin/bash"]
