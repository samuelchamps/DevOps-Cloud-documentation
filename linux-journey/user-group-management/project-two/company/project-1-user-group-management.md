# Project 1: User & Group Management in Linux

## Scenario

In this project, I acted as a junior Linux administrator in a small company environment.
The task was to set up a multi-department system where users are grouped based on their roles and access to resources is strictly controlled.

The departments involved were:

* HR
* Finance
* IT

Each department required isolated access to its own directory while still allowing controlled collaboration within the team.

---

## Objective

The goal of this project was to:

* Create users for different departments
* Organize users into groups
* Set up department-specific directories
* Configure permissions to restrict access between departments
* Implement a shared directory structure using group-based access
* Create a general notice file accessible to all users

---

## Tools Used

* Linux (Ubuntu - Vagrant environment)
* Terminal (CLI)

---

## ⚙️ Implementation Steps

### 1. User Creation

I created individual user accounts representing staff in each department.

### 2. Group Management

I created three groups:

* HR
* Finance
* IT

Each user was assigned to their respective department group.

### 3. Directory Structure

I created a main company directory containing:

* HR folder
* Finance folder
* IT folder

### 4. Permission Configuration

To ensure proper access control:

* Each folder was assigned to its respective group
* Permissions were configured so that:

  * Owner → full access
  * Group → full access
  * Others → no access

### 5. Shared Directory Configuration

To enable collaboration within departments:

* I configured the directories so that any file created inside inherits the group ownership automatically
* This ensured that all team members could access and modify shared files

### 6. General Notice File

* A notice file was created inside the company directory
* Permissions were set so that:

* All users can read the file
* Only the owner can modify it

---

## Result

* Users were successfully grouped by department
* Each department had exclusive access to its directory
* Cross-department access was restricted
* Shared collaboration within departments worked correctly
* The notice file was accessible to all users but editable only by the admin

---

## Verification

I verified the setup by:

* Checking directory ownership and permissions
* Creating test files within department folders
* Confirming that:

* Files inherited the correct group
* Only authorized users could access each directory

---

## Challenges Faced

* Initially misconfigured directory ownership by assigning multiple users as owners
* Permissions were incorrectly set to allow broader access than intended
* Had to understand the difference between user ownership and group ownership
* Learned how group inheritance works in shared directories

---

##  Key Learnings

* Difference between user and group ownership
* How Linux permissions (rwx) control access
* Importance of group-based access in shared environments
* How to properly design secure directory structures* Real-world implications of misconfigured permissions

---

## Conclusion

This project provided hands-on experience in managing users, groups, and permissions in Linux.
It reflects a real-world scenario where proper access control is critical for security and collaboration.

---

##  Author

Samuel Champs

