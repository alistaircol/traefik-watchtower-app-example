## Ansible Playbook

Some ansible playbooks to install `docker` and `docker-compose` on servers.

---

## pre-requisites

We will setup password-less ssh connection to remote server.

SSH into server and:

* Generate ssh key

```bash
ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ''
```

* Copy your device public key onto server

```bash
ssh-copy-id root@194.163.137.40
```

e.g.:

```text
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 2 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@194.163.137.40's password: 

Number of key(s) added: 2

Now try logging into the machine, with:   "ssh 'root@194.163.137.40'"
and check to make sure that only the key(s) you wanted were added.
```

Optionally update `~/.ssh/config`:

```text
Host bnss
  HostName 194.163.137.40
  User root
  IdentityFile ~/.ssh/id_rsa
```

Verify with `ssh bnss`.

* `cp inventory-example.yaml inventory.yaml`

Set your IP in `all.children.bnss.hosts`

## running

Simply `make run`.

```bash
ansible-playbook --inventory=inventory.yaml main.yaml
```

Basically loads list of hosts (only one in my case) and starts `main.yaml` playbook.

`main.yaml` defines the hosts to run playbook on. It also loads variables for the tasks.

The tasks are separated into `plays/**.yaml` files, one for `install-docker` and `install-docker-compose`.
