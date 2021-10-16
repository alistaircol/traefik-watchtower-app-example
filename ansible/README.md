SSH into server and:

* Generate ssh key

```bash
ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ''
```

* Copy your public key onto server

```bash
ssh-copy-id root@194.163.137.40
```

```text
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 2 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@194.163.137.40's password: 

Number of key(s) added: 2

Now try logging into the machine, with:   "ssh 'root@194.163.137.40'"
and check to make sure that only the key(s) you wanted were added.
```

* update `inventory.yaml`

Add your IP
