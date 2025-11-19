FROM python:3.13-alpine

RUN apk add --no-cache git
RUN git config \
    --global \
    --add safe.directory "*"

WORKDIR /github/workspace

RUN python -m pip install --upgrade pip
RUN python -m pip install commitizen

COPY entrypoint.sh .

ENTRYPOINT ["/github/workspace/entrypoint.sh"]
