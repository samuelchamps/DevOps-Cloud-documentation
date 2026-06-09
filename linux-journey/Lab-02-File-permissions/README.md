# Lab 02 - File Permissions & Security Hardening

##  Objective
To investigate and fix a security breach caused by improper file permissions and group ownership in a Linux system.

---

##  Problem Summary

An unauthorized user from the engineering team was able to access the finance directory.

This indicated a misconfiguration in:
- File permissions
- Group ownership

---

##  Root Cause

- Directories were owned by the wrong group (`vagrant`)
- Permissions were set but ineffective due to incorrect ownership
- Users attempted access using incorrect relative paths (`~`)

---

##  Solution Implemented

- Updated group ownership of directories:
  - finance → `finance`
  - engineering → `engineering`

- Applied strict permissions using `770`:
  - Owner: full access
  - Group: full access
  - Others: no access

- Ensured correct directory access using absolute paths

--- 

##  Verification

- Switched to finance user:
  ```bash command
  su - mafe.tope
