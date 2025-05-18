# 🛠️ manage-hosts-script

A simple Bash script to **add or remove entries** from your `/etc/hosts` file.

---

## 🔧 Usage

### 1. Make the script executable

```bash
chmod +x managehosts.sh


### 2. Run with sudo
sudo ./managehosts.sh add <IP_ADDRESS> <HOSTNAME>
sudo ./managehosts.sh remove <IP_ADDRESS> <HOSTNAME>
