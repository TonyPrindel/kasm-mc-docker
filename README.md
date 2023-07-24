# About

This is a Minecraft server Docker image stemming from linuxserver's fantastic kasmvnc base.

I'm not a professional coder, and this is largely for personal use.
That said, if you run into any issues, please feel free to open an issue. I make no promises, but I'll do my best to fix anything.

Technically you could probably run other Java stuff using this. But what's the fun in that?

# Usage

At the very least you'll need to provide Docker your server directory as a volume. Don't forget to accept the eula!
Additionally, we need to bind three ports: 3000tcp for vnc, and 25565tcp/udp for Minecraft.
For a small vanilla server, you'll probably be fine with the default variables. That said, here's a list of variables you may want to change:

| ARGUMENT | DEFAULT | EXPLANATION |
| -------- | ------- | ----------- |
| JAVA_VERSION | 17 | Used to determine which Java version to install. May be changed to 8, or any other version so long as it's in the alpine repos. |
| JAVA_ARGS | -Xms1024M -Xmx1024M | Typical Java args. |
| JAR_NAME | server.jar | The name of the jar to run. |
| AUTO_RESTART | true | Whether the server should automatically restart after a non-zero exit code. |

After everything is set up, navigate to [ip]:[port] to connect with the server UI. 

# Note about file permissions

Since this image relies on mounting a subvolume, it suffers from the horrors that are Linux file permissions.

In particular, you'll need to make sure the image user, abc, has the same PUID and PGID as the user who owns the folder and its contents on the host.

See the below except from linuxserver on this issue and its solution:

> When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to >specify the user `PUID` and group `PGID`.
>
> Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.
>
> In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:
> ```bash
> $ id username
> uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)

The environment variables you'll need to edit to match the host folder owner are provided below:

| ARGUMENT | DEFAULT |
| -------- | ------- |
| PUID | 1000 |
| PGID | 1000 |
