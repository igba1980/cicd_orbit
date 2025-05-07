# CICD Orbit

This project demonstrates a complete CI/CD pipeline using a simple Python Flask application. It provisions a local Kubernetes cluster using Minikube and deploys the app using ArgoCD and Helm. All infrastructure and deployment resources are managed via Terraform.

---

## 🚀 Tech Stack

- **Python Flask** – Simple web application.
- **Terraform** – Infrastructure as Code (IaC) to provision:
  - Minikube cluster
  - Kubernetes resources
  - ArgoCD (via `kubernetes_manifest`)
- **Helm** – Application packaging and deployment.
- **GitHub Actions** – CI/CD pipeline automation.
- **ArgoCD** – GitOps tool for continuous deployment.

---

## ⚙️ Key Features

- **Minikube Cluster Provisioned via Terraform**
- **ArgoCD Deployed via `kubernetes_manifest`**
  - Manages ArgoCD using raw Kubernetes manifests declaratively.
- **Helm-based Application Deployment**
- **GitHub Actions for CI/CD Automation**
  - Build and push Docker images.
  - Trigger ArgoCD sync on updates.
- **Full GitOps Workflow**:
  - Source-controlled app and infra definitions.
  - Automated, auditable deployments.

---

## 📦 Project Structure

```bash
.
├── app/                       # Flask application
├── cicd-orbit/               # Kubernetes manifests & Helm chart
├── terraform/
│   ├── main.tf               # Terraform infrastructure
│   ├── argocd.tf             # ArgoCD Kubernetes resources (via kubernetes_manifest)
│   └── ...
├── .github/workflows/
│   └── ci-cd.yml             # GitHub Actions pipeline
└── README.md
```

🔧 Getting Started

1. Clone the Repository
```
    git clone https://github.com/your-username/cicd_orbit.git
    cd cicd_orbit
```
2. Provision the Cluster

Make sure Terraform and Minikube are installed:
```
cd terraform
terraform init
terraform apply
```

3. Access ArgoCD

Port-forward or expose ArgoCD via ingress to access the UI:
```
    kubectl port-forward svc/argocd-server -n argocd 8081:443
```

Then visit: https://localhost:8080

Default login:
	•	Username: admin
	•	Password: (check with kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d)

🛠️ CI/CD Workflow
	1.	Code Commit → GitHub Actions triggered
	2.	CI → Build, test, and push Docker image
	3.	CD → ArgoCD detects new app version and deploys automatically

⸻

📝 Notes
	•	ArgoCD is deployed via terraform using the kubernetes_manifest resource, ensuring it is declaratively managed alongside other infrastructure components.
	•	Helm charts are used for more maintainable application deployment.

⸻

Let me know if you’d like help generating badges, a project diagram, or auto-generating the ArgoCD Application resource in Terraform.

