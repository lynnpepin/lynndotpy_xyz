+++
title = "Fixing my insecure SSH bastion host"
date = 2023-11-22

[taxonomies]
tags = ["post"]
+++

I maintain an SSH bastion server for all my beloved VPSes. The server I host this blog on only accepts SSH connections from the IP of that bastion, and I keep that bastion hardened. It's a minimal Alpine install with nothing but an SSH server.

So I felt some dismay when I found the server got a score of F on [sshaudit.com](https://www.sshaudit.com/). I got an F! My bastion failed 2 of 5 host key tests, 4 of 9 key-exchange tests, and 7 of 10 MAC tests. 

These are the steps I took. Although I'm on Alpine, I was able to cherry pick commands from [the Debian-focused server guides hardening guides on sshaudit.com.](https://www.ssh-audit.com/hardening_guides.html)

**TLDR** provided below the cut, with some script script to do the work for you.

<!-- more -->

```sh
# You can't just copy and paste this! You need to edit some parts, run some parts as su and some parts as user, etc.
# Read and understand this before running it okay?
# Replace 3\.12 below with whatever `cat /etc/os-release` tells you
sudo sed -i -e 's/v3\.12/latest-stable/g' /etc/apk/repositories
sudo apk upgrade -U
sync # I last used sync in ~2008, but hey, the wiki says to do it
sudo reboot

# Update host keys
rm /etc/ssh/ssh_host_*
# As root:
ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key -N ""
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""
# As user:
sudo service sshd restart
# You'll probably need to remove lines in ~/.ssh/known-hosts on your client machines

# Custom config to remove insecure ciphers, kex, and mac
# OpenSSH on Alpine doesn't use and Include an sshd config folder by default, so make one
mkdir /etc/ssh/sshd_config.d/
sudo sed -i.bak '1i Include /etc/ssh/sshd_config.d/*'


# Set up restricted algorithms
# As root:
echo -e "# Restrict key exchange, cipher, and MAC algorithms, as per \
sshaudit.com hardening guide.\n\
KexAlgorithms sntrup761x25519-sha512@openssh.com,curve25519-sha256,\
curve25519-sha256@libssh.org,gss-curve25519-sha256-,\
diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,\
diffie-hellman-group-exchange-sha256\n\
Ciphers chacha20-poly1305@openssh.com,\aes256-gcm@openssh.com,\
aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr\n\
MACs hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,\
umac-128-etm@openssh.com\n\
HostKeyAlgorithms ssh-ed25519,\
ssh-ed25519-cert-v01@openssh.com,sk-ssh-ed25519@openssh.com,\
sk-ssh-ed25519-cert-v01@openssh.com,\
rsa-sha2-512,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256,\
rsa-sha2-256-cert-v01@openssh.com" \
> /etc/ssh/sshd_config.d/ssh-audit_hardening.conf

# As user:
sudo service sshd restart
```


1. **Backup** the server on my VPS host. If anything goes wrong, I don't want to be locked out of my other servers.
2. **Updating** to the latest major Alpine release improved my score a bit.
    - According to `cat /etc/os-release`, I'm on Alpine 3.12.12, whereas the latest major version is 3.18.4.
    - According [to this Wiki page](https://wiki.alpinelinux.org/wiki/Include:Upgrading_to_latest_release): I run `sudo sed -i -e 's/v3\.12/latest-stable/g' /etc/apk/repositories` to keep me on the latest stable release. I verify with a quick `cat`.
    - Then, `sudo apk upgrade -U`, `sync`, `sudo reboot`.
    - After updating, I'm failing 1 of 4 Host Key checks, 4 of 10 Key Exchange checks, and 7 of 10 MAC checks.
3. **Fixing host keys:** This was simple to run. As root,
    - `rm /etc/ssh/ssh_host_*; ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key -N "";ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""`
    - This improved my score to a 49/100! I now fail no Host Key checks, 4 of 10 Key Exchange tests, and 7 of 10 MAC checks.
    - This changes the host keys, so I had to hand-modify my entries in `~/.ssh/known_hosts` on all my clients. 
- ...
    - `awk '$5 >= 3071' /etc/ssh/moduli > /etc/ssh/moduli.safe`
    - `mv /etc/ssh/moduli.safe /etc/ssh/moduli`
4. **Restricting algorithms:** As root,
    - OpenSSH on Alpine does not have `sshd_config.d` by default. So, `mkdir /etc/ssh/sshd_config.d/; sudo sed -i.bak '1i Include /etc/ssh/sshd_config.d/*' /etc/ssh/sshd_config`
    - The OpenSSH shipped with Alpine doesn't support all the algorithms from the OG hardening guide. Add the following: ```echo -e "\n# Restrict key exchange, cipher, and MAC algorithms, as per sshaudit.com hardening guide.\nKexAlgorithms sntrup761x25519-sha512@openssh.com,curve25519-sha256,curve25519-sha256@libssh.org,gss-curve25519-sha256-,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group-exchange-sha256\nCiphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr\nMACs hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,umac-128-etm@openssh.com\nHostKeyAlgorithms ssh-ed25519,ssh-ed25519-cert-v01@openssh.com,sk-ssh-ed25519@openssh.com,sk-ssh-ed25519-cert-v01@openssh.com,rsa-sha2-512,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256,rsa-sha2-256-cert-v01@openssh.com" > /etc/ssh/sshd_config.d/ssh-audit_hardening.conf```
    - After a reboot, this brought me to an A+ score! :)