# Checkson Check for testing SSL/TLS endpoints

Use this check on [checkson.io](https://checkson.io) to find out if:

* The certificate is expired (level: `CRITICAL`)
* The certificate will expire within 60 days (level: `MEDIUM`)
* The certificate will expire within 30 days (level: `HIGH`)
* Deprecated SSL/TLS versions (like `TLS 1`, `TLS 1.1`) are offered by the server (level: `LOW`)
* The certificate chain is incomplete (level: `CRITICAL`)
* Insecure ciphers are offered

It uses the excellent [testssl.sh](https://testssl.sh/).

## Environment variables

| Variable | Description |
|----------|-------------|
| URL      | The URL to check, e.g. https://example.com |
| LEVEL    | The threshold for failing the check, can be one of `LOW`, `MEDIUM`, `HIGH`, `CRITICAL`. Default is `MEDIUM` |

## Use check on Checkson

This check can be used on [checkson.io](https://checkson.io) with the following Docker image on ghcr.io:

```
ghcr.io/checkson-io/checkson-testssl-check:main
```

## Run check locally

```
docker run \
  --env URL=https://expired.badssl.com/ \
  --env LEVEL=LOW \
  --rm \
  -it \
  ghcr.io/checkson-io/checkson-testssl-check:main
```

## Tips

* You can try this check against the TLS endpoints offered by [badssl.com](https://badssl.com)
