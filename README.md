# k8s-platform Keycloak Theme

Custom Keycloak login theme for Kubernetes / DevOps platform access.

## Pages

- Login
- Update password
- Error

## Build Image

```bash
cd /Users/zawthanoo/dev/devops-workshop/devops-apps/k8s-login-themes
docker build -t ghcr.io/YOUR_GITHUB_USERNAME/keycloak-k8s-platform:1.0.0 .
docker push ghcr.io/YOUR_GITHUB_USERNAME/keycloak-k8s-platform:1.0.0
```

## Deploy

Update the Keycloak deployment image:

```yaml
image: ghcr.io/YOUR_GITHUB_USERNAME/keycloak-k8s-platform:1.0.0
```

Apply and restart:

```bash
kubectl apply -f /Users/zawthanoo/dev/devops-workshop/devops-apps/k8s-keycloak/04-deployment.yaml
kubectl rollout status deployment/keycloak -n keycloak
```

## Enable Theme

In Keycloak Admin Console:

1. Open realm `k8s-platform`.
2. Go to **Realm settings**.
3. Open **Themes**.
4. Set **Login theme** to `k8s-platform`.
5. Save.

Then test:

```text
https://mycluster.local.com/dashboard/
```
