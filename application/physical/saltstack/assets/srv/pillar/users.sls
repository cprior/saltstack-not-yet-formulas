 users:

  ## Full list of pillar values
  cpr:
    fullname: Christian Prior
    uid: 1976
    #python3 -c 'import crypt; print(crypt.crypt("helotism", crypt.mksalt(crypt.METHOD_SHA512)))'
    password: $6$cNSrbPO47rEbGHgW$Gn6/O0MOb12iZV7n3kSRrDEq8bT.ZxNH9.LYR80.Pc1pE8X2tayJ0J/kcIKLH7xdsj6Me.ByzRGMp4G36ii4f1
    enforce_password: True
    # WARNING: If 'empty_password' is set to True, the 'password' statement
    # will be ignored by enabling password-less login for the user.
    empty_password: False
    hash_password: False
    system: False
    createhome: True
    manage_vimrc: False
    manage_bashrc: False
    manage_profile: False
    sudouser: True
    # sudo_rules doesn't need the username as a prefix for the rule
    # this is added automatically by the formula.
    # ----------------------------------------------------------------------
    # In case your sudo_rules have a colon please have in mind to not leave
    # spaces around it. For example:
    # ALL=(ALL) NOPASSWD: ALL    <--- THIS WILL NOT WORK (Besides syntax is ok)
    # ALL=(ALL) NOPASSWD:ALL     <--- THIS WILL WORK
    sudo_rules:
      - ALL=(ALL) NOPASSWD:ALL
    sudo_defaults:
      - '!requiretty'
    shell: /bin/bash
#    ssh_key_type: rsa
#    # You can inline the private keys ...
#    ssh_keys:
#      privkey: PRIVATEKEY
#      pubkey: PUBLICKEY
#    # ... or you can pull them from a different pillar,
#    # for example one called "ssh_keys":
#    ssh_keys_pillar:
#      id_rsa: "ssh_keys"
#      another_key_pair: "ssh_keys"
#    ssh_auth:
#      - PUBLICKEY
#    ssh_auth.absent:
#      - PUBLICKEY_TO_BE_REMOVED
#    # Generates an authorized_keys file for the user
#    # with the given keys
#    ssh_auth_file:
#      - PUBLICKEY
#    # ... or you can pull them from a different pillar similar to ssh_keys_pillar
#    ssh_auth_pillar:
#      id_rsa: "ssh_keys"
#    # If you prefer to keep public keys as files rather
#    # than inline in pillar, this works.
#    ssh_auth_sources:
#      - salt://keys/buser.id_rsa.pub
#    # Manage the ~/.ssh/config file
#    ssh_known_hosts:
#      importanthost:
#        fingerprint: 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48
#    ssh_known_hosts.absent:
#      - notimportanthost
#    ssh_config:
#      all:
#        hostname: "*"
#        options:
#          - "StrictHostKeyChecking no"
#          - "UserKnownHostsFile=/dev/null"
#      importanthost:
#        hostname: "needcheck.example.com"
#        options:
#          - "StrictHostKeyChecking yes"

#    # Using gitconfig without Git installed will result in an error
#    # https://docs.saltstack.com/en/latest/ref/states/all/salt.states.git.html:
#    # This state module now requires git 1.6.5 (released 10 October 2009) or newer.
###
###https://github.com/saltstack-formulas/users-formula/blob/master/users/init.sls#L446
###
###    gitconfig:
###      user.name: Christian Prior
###      user.email: cprior@gmail.com
#      url."https://".insteadOf: "git://"
#
#
#    user_files:
#      enabled: True
#      # 'source' allows you to define an arbitrary directory to sync, useful to use for default files.
#      # should be a salt fileserver path either with or without 'salt://'
#      # if not present, it defaults to 'salt://users/files/user/<username>
#      source: users/files/default
#
  ## Absent user
  pi:
    absent: True
    purge: True
    force: True
  alarm:
    absent: True
    purge: True
    force: True

