# 🔐 Linux Security Audit

## Project Description

This Bash script performs a basic security audit of a Linux Mint computer.

The purpose is to identify configuration areas that should be reviewed, rather than automatically changing system settings.

It checks:

* Current user
* Logged-in users
* User accounts
* Firewall status
* Open listening ports
* Failed login attempts
* SSH configuration
* System updates

## Script

```bash
#!/bin/bash

echo "======================================"
echo "        LINUX SECURITY AUDIT"
echo "======================================"

echo ""
echo "CURRENT USER"
echo "--------------------------------------"
whoami

echo ""
echo "LOGGED-IN USERS"
echo "--------------------------------------"
who

echo ""
echo "USER ACCOUNTS"
echo "--------------------------------------"
cut -d: -f1 /etc/passwd

echo ""
echo "FIREWALL STATUS"
echo "--------------------------------------"

if command -v ufw >/dev/null 2>&1; then
    sudo ufw status
else
    echo "UFW is not installed."
fi

echo ""
echo "LISTENING PORTS"
echo "--------------------------------------"
ss -tuln

echo ""
echo "SSH STATUS"
echo "--------------------------------------"

if systemctl is-active --quiet ssh; then
    echo "SSH Service: RUNNING"
else
    echo "SSH Service: NOT RUNNING"
fi

echo ""
echo "FAILED LOGIN ATTEMPTS"
echo "--------------------------------------"

if command -v lastb >/dev/null 2>&1; then
    sudo lastb 2>/dev/null | head -10
else
    echo "Failed-login log unavailable."
fi

echo ""
echo "SYSTEM UPDATES"
echo "--------------------------------------"

sudo apt update -qq

UPDATES=$(apt list --upgradable 2>/dev/null | grep -c upgradable)

echo "Available Updates: $UPDATES"

echo ""
echo "======================================"
echo "        SECURITY AUDIT COMPLETE"
echo "======================================"
```

## How to Run

```bash
chmod +x linux-security-audit.sh
```

Then:

```bash
./linux-security-audit.sh
```

## Skills Demonstrated

* Linux security auditing
* User and account inspection
* Firewall awareness
* Network port inspection
* SSH service monitoring
* Login monitoring
* System update management
* Bash scripting

## Security Principle

This project is designed for **defensive security and system administration**. It reports information so the system administrator can review potential issues before making changes.

## Future Improvements

* Check password policies
* Check file permissions
* Check unnecessary services
* Check firewall rules
* Create a security report
* Add security recommendations
* Save audit results to a log file
