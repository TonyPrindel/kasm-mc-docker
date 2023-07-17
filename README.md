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
| JAVA_VERSION | 17 | Used to determine which Java version to install. May be changed to 8, or any other version so long as it's in the alpine repos. |
| USER_JAVA_ARGS | -Xms1024M -Xmx1024M | Typical Java args |
| JAR_NAME | server.jar | The name of the jar to run. | 

After everything is set up, navigate to [ip]:[port] to connect with your server