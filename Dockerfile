FROM quay.io/keycloak/keycloak:latest

COPY providers/ /opt/keycloak/providers/
COPY themes/k8s-platform/ /opt/keycloak/themes/k8s-platform/

RUN /opt/keycloak/bin/kc.sh build
