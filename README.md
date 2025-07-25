# Setup

## Required

Bun: `curl -fsSL https://bun.com/install | bash`

Docker: `brew install --cask docker-desktop`

Other tools: `brew install kubectl kubecm helm opentofu`

## Terraform

Make sure nothing is running on port `80`, `443`, `5432`, or `6443`.

```bash
cd terraform/kind-local

tofu init
tofu apply

# Add the kubeconfig to your local context and open ArgoCD in your browser
./post-apply.sh
```

To destroy the cluster, run:

```bash
tofu state rm helm_release.cilium && tofu destroy
```

## Publish Helm chart to local registry

### Publish new charts

```bash
# Still in terraform/kind-local
cd ../..
bun charts
```

### Patch existing charts

```bash
bun charts:patch
```

## Prepare the platform database
```bash
# (In root of the project)

cp packages/platform/.env.example packages/platform/.env
# Update the created .env file by running the included commands.

bun -cwd packages/platform db:reset
```

## Start the platform web app

```bash
bun --cwd packages/platform dev
```
