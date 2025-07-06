# ⚙️ Ansible Infrastructure Setup

This repository sets up a development environment using Ansible. It includes:

- User creation with SSH key pairs and passwordless sudo  
- Git server setup from existing project directories

---

## 📦 Requirements

- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

---

## 🚀 Usage

1. **Edit Inventory**

Update `inventory.yml` with your `ansible_user`, `ansible_ssh_pass`, and target host IP.

2. **Run Playbooks**

```bash
ansible-playbook playbooks/users.yml
ansible-playbook playbooks/docker.yml
ansible-playbook playbooks/gitserver.yml
````

---

## 🔧 Configuration

Edit `group_vars/all.yml` to manage:

* Users and usernames
* Git repo and source paths
* Default Git branch

