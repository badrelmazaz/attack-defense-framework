# Vagrant Environment Setup

This repository provides a Vagrant-based development environment that closely mirrors the competition architecture.

## 📦 Prerequisites

Install Vagrant by following the official guide:
🔗 [Vagrant Installation Documentation](https://developer.hashicorp.com/vagrant/docs/installation)

## 📁 Synced Folder

The `synced_folder` (located in the project root) is automatically synced with the `/root` directory inside the Vagrant box.
Place your code here to test it inside the virtual machine.

## 📦 Vagrant Box Details

* **Base OS:** Ubuntu 24.04
* **Box Name:** `vulnbox` (as defined in the `Vagrantfile`)
* The setup is designed to closely replicate the competition environment.

## 🚀 Usage

### Start the Vagrant Box

```bash
vagrant up
```

### SSH into the Box

```bash
vagrant ssh vulnbox
```

### Destroy the Vagrant Box

```bash
vagrant destroy -f vulnbox
```

## 🧪 Included Projects

The `synced_folder` already includes **4 sample projects** to test and validate the infrastructure setup.

