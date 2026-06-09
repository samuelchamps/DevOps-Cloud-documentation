#  Lab 01 - User & Group Management

##  Objective
To implement user and group management in a Linux environment and enforce proper access control.



## ⚙️ Tasks Performed

- Created groups for different departments:
  - finance
  - engineering
  - audit

- Created users and assigned them to their respective groups:
  - seun.olamide → finance
  - precious.kola → engineering
  - peace.alabi → audit

- Created project directories under `company`

- Assigned group ownership to each department folder

- Applied permissions to restrict access

---

##  Permissions Explained

Permissions were set to `770`:
- Owner: Full access
- Group: Full access
- Others: No access

This ensures that only members of a specific department can access their directory.


## Verification

- Switched to user `ada` using:
  ```bash
  su - seun.olamide
