FROM python:3.13-alpine

WORKDIR /usr/src

RUN python -m pip install --upgrade pip
RUN python -m pip install committizen

COPY entrypoint.sh .

# trivy:ignore:AVD-DS-0002
# trivy:ignore:AVD-DS-0026
ENTRYPOINT ["/usr/src/entrypoint.sh"]
