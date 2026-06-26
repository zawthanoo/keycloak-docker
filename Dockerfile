FROM quay.io/keycloak/keycloak:26.6.3

COPY providers/ /opt/keycloak/providers/
COPY themes/ /opt/keycloak/themes/

RUN /opt/keycloak/bin/kc.sh build