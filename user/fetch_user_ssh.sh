#!/usr/bin/env bash

# === Usage check ===
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <ip_address> <username>"
  exit 1
fi

IP="$1"
USER="$2"

# === Read root password securely ===
read -s -p "Enter root password: " ROOT_PASSWORD
echo

REMOTE_KEY_PATH="/root/backup/keys/${USER}.key"
LOCAL_KEY_PATH="$HOME/.ssh/${USER}.key"
SSH_CONFIG_PATH="$HOME/.ssh/config"
SSH_ALIAS="vulnbox"

# === Check for sshpass ===
if ! command -v sshpass &> /dev/null; then
  echo "Error: sshpass is not installed. Please install it and try again. https://linux.die.net/man/1/sshpass"
  exit 2
fi

# === Fetch private key from remote ===
echo "[*] Fetching SSH private key for user '$USER' from $IP..."
sshpass -p "$ROOT_PASSWORD" scp -o StrictHostKeyChecking=no root@"$IP":"$REMOTE_KEY_PATH" "$LOCAL_KEY_PATH"

if [[ $? -ne 0 ]]; then
  echo "[!] Failed to copy key from $IP"
  exit 3
fi

# === Secure the private key ===
chmod 600 "$LOCAL_KEY_PATH"

# === Create ~/.ssh and handle existing config ===
mkdir -p "$HOME/.ssh"

if [[ -f "$SSH_CONFIG_PATH" && -s "$SSH_CONFIG_PATH" ]]; then
  echo "[*] Backing up existing SSH config to config.bak"
  mv "$SSH_CONFIG_PATH" "$SSH_CONFIG_PATH.bak"
fi

# === Add SSH config entry ===
echo "[*] Creating SSH config entry..."
cat > "$SSH_CONFIG_PATH" <<EOF

Host $SSH_ALIAS
    HostName $IP
    User $USER
    IdentityFile $LOCAL_KEY_PATH
    IdentitiesOnly yes
    StrictHostKeyChecking no

EOF

echo "[✔] Done. You can now connect using:"
echo "    ssh $SSH_ALIAS"
