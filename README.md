# MaxScript tests

This repo mainly focuses on the workflow setup for 3ds Max and Visual Studio Code. The MaxScripts are just used for testing various capabilities of 3ds Max. Because 3ds Max runs only on Windows following documentation is for Windows only.

## Requirements

Besides [3ds Max](https://www.autodesk.com/products/3ds-max/overview?term=1-YEAR&tab=subscription) please download/install:
1. [Visual Studio Code](https://code.visualstudio.com/)
2. [Dot Net SDK](https://dotnet.microsoft.com/download/dotnet/thank-you/sdk-3.1.414-windows-x64-installer)
3. [Language MaxScript * Optional](https://marketplace.visualstudio.com/items?itemName=atelierbump.language-maxscript)

## Setup:
1. Clone the repo and store it on your hard drive
2. Open folder (this cloned repo) from VS Code
3. Open any file and run **Tasks: Run Task** (Ctrl+Shift+P) > Build Release. The terminal will open and the build will start. Wait for it to finish.
4. Copy the **initialize_COM_server.ms** MaxScript file into the 3ds Max startup scripts folder. The default for that is: %localappdata%\autodesk\3dsmax\scripts\startup

## Executing scripts

From the VS Code select **Tasks: Run Task** (Ctrl+Shift+P) > Execute Script in 3ds Max.

## Distributing scripts

For the script distribution this project uses:

* [Node.js](https://nodejs.org/en/)
* [Gulp](https://gulpjs.com/)

To package and distribute your scripts just run the "gulp" command from the Terminal or double-click the **distributeProject.bat** file from the Windows Explorer.

The *gulp* and *encryptScript.ms* files are already configured to automatically encrypt all scripts that are stored inside the *src* folder and deliver them into the *dist* folder when the build process is complete.

## List of MaxScripts:

* Curbs
* Enable/Disable
* Delete Empty Layers
* My Rollout
* Select Valid Groups