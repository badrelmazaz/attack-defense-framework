# 🔐 Knowledge Base for Vulnerability Analysis

This folder provides a streamlined setup to:

- Connect securely to a `vulnbox` server via SSH
- Analyze code repositories using `gitingest` and LLMs
- Clone and audit repositories with Git

---

## 📦 Requirements

Install the following tools:

### SSH Access

```bash
sudo apt-get update && sudo apt-get install sshpass -y
````

### Python Tools

```bash
sudo apt-get install pipx -y
pipx ensurepath
```

### Install `gitingest`

```bash
pipx install gitingest
```

---

## 🔑 Fetch Your SSH Key

Use the `fetch_user_ssh.sh` script to retrieve your SSH private key from the `vulnbox` server:

```bash
./fetch_user_ssh.sh <vulnbox_ip> <your_username>
```

This will:

* Download your key from the server
* Save it in `~/.ssh/`
* Create a config entry so you can SSH using:

```bash
ssh vulnbox
```

---

## 🧠 Analyze the Codebase

Use `gitingest` to generate a digest file for use with LLMs:

```bash
gitingest <app_directory> -o llm-digest.txt
```

This will create a summary file of the codebase for vulnerability analysis.

---

## 💬 Prompting LLMs

Use the provided [`prompt.md`](./prompt.md) to guide LLMs in reviewing the code for vulnerabilities and patches.

---

## 🧠 Recommended LLM Models

* **ChatGPT**

  * `gpt-4o`
* **Claude**

  * `claude-4-sonnet`
* **Gemini**

  * `gemini-1.5-pro`

---

## 🛠️ Git Setup

Install Git and configure your identity:

```bash
sudo apt-get install git -y
git config --global user.name "Your Name"
git config --global user.email "username@vulnbox"
```

---

## 📥 Clone Repositories

```bash
git clone ssh://vulnbox/srv/git/<repo>.git
```

You can view available repos under `/srv/git/` on the `vulnbox`, or ask the **admin** to share a list.

```