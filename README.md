# love2d-virtual-joypad
Virtual joypad made with Lua + Löve2D framework

This project is love "game" that simulates a joypad and communicates over udp protocol. The idea is just the joypad send and receive messages to other love games.

The folder ```game/``` ~~has~~ will have a game sample of how the communication works with the joypad. The ```joypad/``` folder ~~has~~ will have the joypad itself.

How to use/test it:

- Choose your prefered text editor (notepad++, sublime text, virtual studio code, ...);
- Install the [Löve 2d](https://love2d.org/) framework, version 0.10.1;
- Add the love folder to the PATH;
- Install the [Löve for Android](https://play.google.com/store/apps/details?id=org.love2d.android&hl=en) on the devices you want to test it;
- Clone the repository to your computer;

### Computer
Just open the command line application, go to the ```game/``` and run the command ```love .```

### Android
The code to run on mobile devices is under ```joypad/```. Instructions of how run (extracted from the play store app page):

You can run games in multiple ways:
- Upload your ```.love```  file to a web server and open the link with a browser on your Android device
- Put the ```.love``` file on your device and open it with a file explorer (e.g. X-plore, open file as */*, select LÖVE for Android).-
- Extract it to ```/sdcard/lovegame``` such that main.lua is found at ``` /sdcard/lovegame/main.lua``` and then run the app
- Extract your game anywhere on your device and open its main.lua using a file browser (e.g. X-plore, open main.lua as */*, select LÖVE for Android).
