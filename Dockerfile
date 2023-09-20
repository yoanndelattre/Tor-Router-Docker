FROM alpine:latest

# Install the required packages
RUN apk add --update --no-cache tor

# Expose the ports made available through Tor
EXPOSE 9050

# Populate the tor-router configurations
COPY . /opt/tor-router
RUN chmod +x /opt/tor-router/entrypoint.sh

# Set the container's WORKDIR and ENTRYPOINT
WORKDIR /opt/tor-router
ENTRYPOINT ["/opt/tor-router/entrypoint.sh"]