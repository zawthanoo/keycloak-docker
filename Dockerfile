ARG KEYCLOAK_IMAGE=quay.io/keycloak/keycloak:latest
FROM ${KEYCLOAK_IMAGE}

COPY themes/k8s-platform /opt/keycloak/themes/k8s-platform
