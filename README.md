# 🛠️ manage-hosts-script

A simple Bash script to **add or remove entries** from your `/etc/hosts` file.

---

## 🔧 Usage

Make the script executable and run with sudo:

```bash
chmod +x managehosts.sh
sudo ./managehosts.sh add <IP_ADDRESS> <HOSTNAME>
sudo ./managehosts.sh remove <IP_ADDRESS> <HOSTNAME>
