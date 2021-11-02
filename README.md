# MaxScript tests

This repo mainly focuses on the workflow setup for 3ds Max and Visual Studio Code. The MaxScripts are just used for testing various capabilities of 3ds Max. Because 3ds Max runs only on Windows following documentation is for Windows only.

## Requirements

Besides [3ds Max](https://www.autodesk.com/products/3ds-max/overview?term=1-YEAR&tab=subscription) please download/install:

1. [Visual Studio Code](https://code.visualstudio.com/)
2. [Dot Net SDK](https://dotnet.microsoft.com/download/dotnet/thank-you/sdk-3.1.414-windows-x64-installer)
3. [Language MaxScript * Optional](https://marketplace.visualstudio.com/items?itemName=atelierbump.language-maxscript)

## Setup

1. Clone the repo and store it on your hard drive
2. Open folder (this cloned repo) from VS Code
3. Open any file and run **Tasks: Run Task** (Ctrl+Shift+P) > Build Release. The *Terminal* will open and the build will start. Wait for it to finish.
4. Copy the **initialize_COM_server.ms** MaxScript file into the 3ds Max startup scripts folder. The default for that is: %localappdata%\autodesk\3dsmax\scripts\startup

## Executing scripts

From the VS Code select **Tasks: Run Task** (Ctrl+Shift+P) > Execute Script in 3ds Max.

## Distributing scripts

For the script distribution this project uses:

* [Node.js](https://nodejs.org/en/)
* [Gulp](https://gulpjs.com/)

After *Node.js* is installed make sure to install all the dependencies for this project by navigating to the project root folder using the *Terminal* from the VS Code and then just type:

```
npm install
```

To package and distribute your scripts just type

```
gulp
```
inside the Terminal (while being in the project root folder) or double-click the **distributeProject.bat** file from the Windows Explorer.

The *gulp* and *encryptScript.ms* files are already configured to automatically encrypt all scripts that are stored inside the *src* folder and deliver them into the *dist* folder when the build process is complete.

**Note:** If there is an error with the command line "3dsmax is not recognized as internal or external command" you would need to add the environment variable. To fix this please follow these steps:

1. Open the *Start Search*, type in "env", and choose "Edit the system environment variables".
2. Click the *Environment Variables…* button.

![Step 1](https://drive.google.com/uc?export=view&id=1bnkreCH5NoCBt0vDodjMIVWnxSMv3I_5)

3. Under the *User Variables* find and select the *Path* variable.

![Step 2](https://drive.google.com/uc?export=view&id=1l5E8783jjWEzz6Cosh91J03_-gG8NRbp)


4. Click the *Edit* button.

![Step 3](https://drive.google.com/uc?export=view&id=13EqRRi8GwspaBnCHuIFMhV-SDmBUKSD6)

5. When new window opens click the *New* button.

![Step 4](https://drive.google.com/uc?export=view&id=1JY1-dldqavMpHTxryuEmggO0EM2l1uMJ)

6. Type the path of the 3ds root folder, typically: "c:\Program Files\Autodesk\3ds Max *version number*\". This path will depend on which 3ds max version is installed.

![Step 5](https://drive.google.com/uc?export=view&id=1hTHJRKjlOlKUCe_oPp1vcy2K8TNO4NAT)

## List of MaxScripts

* Curbs
* Enable/Disable
* Delete Empty Layers
* My Rollout
* Select Valid Groups