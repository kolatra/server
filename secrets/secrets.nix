    let tyler = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDmHhoC/xqai4oYPylYFXNZZlbuot8wS4Czr0XNGiTEI0pCh8eRl608ZeObrYvlfp5Ddp4uqQlSNLm/VLpzDU3KNwmfxn3YCs7KQJOxzHkhAYjVDVbqF0EIQ5SPHbNvzPUx6xTVAgSxlscpcR8iHUBH0Td4seYfgifa3eQqLT8K7bSNWh0o7OXnZSkzXsd9NIQxpbD7zN8Sg2vKZM22tWXojvdgDW2zPZMi4IFKENSVWm15yJ32y0I1iaGI78pbg0F4o8qES562ThPZWjk0FJSAB6JEGgO/VHqIaurMTB7odRea4Fgt5vPM9gg3NtYDtgDrX2K7aGJ6Ja74pAzZXJ7BpQa5cuil6BUtJxen6qoVzG/xrnA4y63SG/6ZBpHOD7/Kehxs55sESOiu2QnpwLXq75E6UyXQSa/uK6KZa9nIx0Myb5WDRl7aVxCWz/bYRVNq54RljuiMQd9zIb7I9OYNW/BRFink6pZYbZHjZJwRM8V5hRmvyXRBQ9Hxh1Uiq9E= tyler";
in
{
    "restic/env.age".publicKeys = [ tyler ];
    "restic/repo.age".publicKeys = [ tyler ];
    "restic/password.age".publicKeys = [ tyler ];
}
