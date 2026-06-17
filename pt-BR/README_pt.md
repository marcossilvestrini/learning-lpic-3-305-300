# Vagrant

## Vagrant up

To start and provision the Vagrant environment defined in the `Vagrantfile`, you can use the command:

```sh
vagrant up
vagrant up --provision
```

## Vagrant destroy

To stop and remove all resources created by Vagrant, you can use the command:

```sh
vagrant destroy -f
vagrant destroy <name_of_the_machine> -f
```

## Vagrant halt

To stop the Vagrant-managed virtual machine without destroying it, you can use the command:

```sh
vagrant halt
vagrant halt <name_of_the_machine>
```

## Vagrant status

To check the status of the Vagrant-managed virtual machine, you can use the command:

```sh
vagrant status
vagrant status <name_of_the_machine>
vabgrant global-status
```

## Vagrant snapshots

For listing all snapshots of a Vagrant-managed virtual machine, you can use the command `vagrant snapshot list`.

This command will display all the snapshots that have been created for the current Vagrant environment.

```sh
Vagrant snapshot list
```

For crate a snapshot of a Vagrant-managed virtual machine, you can use the command `vagrant snapshot save` followed by the name you want to give to the snapshot. Here is the basic syntax:

```sh
Vagrant snapshot save <nome_do_snapshot>
```

To restore a snapshot, you can use the command `vagrant snapshot restore` followed by the name of the snapshot you want to restore:

```sh
Vagrant snapshot restore <nome_do_snapshot>
```

For deleting a snapshot, you can use the command `vagrant snapshot delete` followed by the name of the snapshot you want to delete:

```sh
Vagrant snapshot delete <nome_do_snapshot>
```
