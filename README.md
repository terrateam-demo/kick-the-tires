# Terrateam Demo Infrastructure (Null Resources)

This repository demonstrates a Terrateam demo environment using Terraform modules with null resources. It is designed for new Terrateam users to learn how to use Terrateam without the neeed for cloud provider credentials.

## Repository Structure

```
.
├── modules
│   └── compute
│       └── main.tf         # Module that simulates compute instance creation using a null resource
├── production
│   └── compute
│       └── main.tf         # Production environment using a local backend
└── staging
    └── compute
        └── main.tf         # Staging environment using a local backend
```

- **modules/compute**: Contains the reusable module that uses a `null_resource` with a `local-exec` provisioner to simulate creating a compute instance.
- **production/compute** and **staging/compute**: These directories show how to call the module in different environments.

## How It Works

- **Null Resources:** Instead of provisioning actual infrastructure resources, the module uses a `null_resource` to simulate instance creation. The `local-exec` provisioner prints out details, mimicking resource creation.
- **Local Backend:** The Terraform backend is configured to use a local state file (e.g., `staging.tfstate` and `production.tfstate`), eliminating the need for cloud provider credentials or remote state management.

## Prerequisites

- A repository configured with Terrateam

## Getting Started

1. **Fork This Repository**
   Create a fork of this repository in your GitHub organization.

2. **Install Terrateam**
   Ensure Terrateam is set up and configured for your repository. Follow the [Terrateam Quickstart Guide](https://docs.terrateam.io/quickstart-guide).

3. **Create a Pull Request**
   Modify any Terraform file (e.g., change a variable in `staging/compute/main.tf`) and push the changes to a new branch. Open a pull request (PR). Terrateam will automatically trigger `terraform plan` and post the output as a comment on the PR.

4. **Review the Plan**
   Look at the plan output in the PR comments to see what Terraform will do. Since this is a demo, it will only simulate infrastructure changes using a null resource.

5. **Apply**
   Once satisfied, trigger an apply by commenting:
   
   ```
   terrateam apply
   ```

   Terrateam will apply the changes and post the results in the PR comments.

6. **Merge the PR**
   Once the apply is successful, merge the PR to complete the process.

## Customization

- **Module Variables:**
  You can modify variables such as `instance_count`, `instance_name`, `instance_zone`, `boot_disk_image`, and `network_name` in the module. Adjust these values in the respective environment's `main.tf` to experiment with different configurations.

- **Backend Configuration:**
  The local backend is used for simplicity. You can modify the backend settings if you would like to experiment with other state management solutions.

- Try different values for instance_count to see how Terrateam handles multiple resources.

- **Note:** Setting instance_count to 0 will result in no planned changes because state is not persisted in this demo repository.

- [Read the docs](https://docs.terrateam.io/) to experiment with more features.

## Contributing

Contributions are welcome! If you have suggestions or improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
