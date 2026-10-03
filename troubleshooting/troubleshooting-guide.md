# 🛠️ Linux Mint Troubleshooting Guide

## Project Description

This guide documents common Linux Mint problems, diagnostic commands, possible causes, and solutions.

The goal is to develop a systematic troubleshooting process instead of randomly changing system settings.

---

# 🔎 Troubleshooting Process

When something goes wrong:

1. Identify the problem
2. Reproduce the problem
3. Gather information
4. Check logs
5. Test possible causes
6. Apply a solution
7. Verify the solution
8. Document what happened

---

# 🌐 Problem 1: No Internet Connection

## Symptoms

* Websites will not load
* Internet applications cannot connect
* Ping fails

## Diagnostic Commands

```bash
ip addr
```

Check the network interface.

```bash
ip route
```

Check the default gateway.

```bash
ping -c 4 8.8.8.8
```

Test basic Internet connectivity.

```bash
ping -c 4 google.com
```

Test DNS resolution.

## Possible Causes

* Network interface is disconnected
* Incorrect IP configuration
* Gateway problem
* DNS problem
* Router/Internet outage

---

# 📡 Problem 2: DNS Not Working

## Test

```bash
ping -c 4 8.8.8.8
```

If this works but:

```bash
ping -c 4 google.com
```

fails, DNS may be the problem.

Check DNS configuration:

```bash
resolvectl status
```

## Possible Causes

* DNS server unavailable
* Incorrect DNS configuration
* Network configuration problem

---

# 💾 Problem 3: Disk Almost Full

## Check Disk Space

```bash
df -h
```

Find large directories:

```bash
du -sh ~/*
```

## Possible Causes

* Large downloads
* Old log files
* Applications using excessive storage
* Backup files
* Temporary files

---

# 🧠 Problem 4: System Running Slowly

## Check Memory

```bash
free -h
```

## Check CPU Usage

```bash
top
```

## Check Running Processes

```bash
ps aux
```

## Possible Causes

* Too many applications running
* High CPU usage
* Low available memory
* Background processes
* Insufficient disk space

---

# 🔥 Problem 5: Firewall Issues

Check firewall status:

```bash
sudo ufw status
```

Check listening ports:

```bash
ss -tuln
```

Document any unexpected services before making configuration changes.

---

# 📋 Problem 6: Check System Logs

View recent system messages:

```bash
journalctl -b
```

View recent errors:

```bash
journalctl -p err -b
```

View logs from the current boot:

```bash
journalctl -b
```

---

# 📦 Problem 7: Software Installation Failure

Update package information:

```bash
sudo apt update
```

Check for broken dependencies:

```bash
sudo apt --fix-broken install
```

Check package information:

```bash
apt policy package-name
```

---

# 🔧 Troubleshooting Documentation Template

Whenever I solve a new problem, I will document it using this format:

## Problem

Describe what happened.

## Symptoms

List what was observed.

## Commands Used

```bash
command
```

## Diagnosis

Explain what caused the problem.

## Solution

Explain what fixed the problem.

## Verification

Explain how the solution was tested.

## Lessons Learned

Document what was learned from the issue.

---

# 🎯 Skills Demonstrated

* Linux troubleshooting
* Network diagnostics
* System monitoring
* Log analysis
* Package management
* Disk management
* Process management
* Problem-solving
* Technical documentation

---

# 📚 Goal

Build a personal Linux troubleshooting knowledge base based on real problems encountered while learning Linux Mint.

Every documented problem should explain:

**Problem → Diagnosis → Solution → Verification → Lesson Learned**
