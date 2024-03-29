FROM alpine:latest
COPY torrc /etc/tor/torrc
RUN apk add --update --no-cache tor && \
    mkdir -p /tor_data && \
    chown -R tor /tor_data && \
    chown -R tor /etc/tor
USER tor
VOLUME ["/tor_data"]
EXPOSE 9050
ENTRYPOINT ["tor"]
CMD ["-f", "/etc/tor/torrc"]