## Python33
---------------------------------------------------
Python3 ( version 3.3.5 ) is used for building **WSJT** and **WPSR**. Newer versions of Python are available, however, problems have been found with various combinations of Python + cx-freeze + NumPy. Staying with the recommended Python release is highly advisable.

There are several modules, in addition to the base Python installation, that are required for proper building. It's highly advisable to install the packages in order to prevent unexpected result. The entire Python tool chain, including the Gnu CC/FC compilers are 32bit. **Do Not** mix in 64bit packages or libraries, as this will result in build / application run failures. Following the steps carefully should yield a positive result. 

* [Package Downloads](#package-downloads)
* [Python3 Install](#python3-install)
* [Setup distutils](#setup-distutils)
* [Pip Install](#pip-install)
* [Setuptools Install](#setuptools-install)
* [Pywin32 Install](#pywin32-install)
* [Pillow Install](#pillow-install)
* [CX-Freeze Install](#cx-freeze-install)
* [Numpy Install](#numpy-install)
* [Windows Visual Studio Express](http://www.visualstudio.com/en-US/products/visual-studio-express-vs) 

### Package Download(s)<a id="package-downloads"></a>
Download the following packages before starting the installation. While there are many sources dotted around the net, the links below have proved to be very stable and produces consistent builds over the last 6mo or so.

* [Python 3.3.5](http://www.python.org/ftp/python/3.3.5/python-3.3.5.msi)
* [Pip 1.5.6](http://www.lfd.uci.edu/~gohlke/pythonlibs/wyxyx8e9/pip-1.5.6.win32-py3.3.exe)
* [Setuptools 5.8](http://www.lfd.uci.edu/~gohlke/pythonlibs/wyxyx8e9/setuptools-5.8.win32-py3.3.exe)
* [PyWin32 219](http://www.lfd.uci.edu/~gohlke/pythonlibs/wyxyx8e9/pywin32-219.win32-py3.3.exe)
* [CX-Freeze](http://www.lfd.uci.edu/%7Egohlke/pythonlibs/wyxyx8e9/cx_Freeze-4.3.3.win32-py3.3.exe)
* [Numpy 1.8.1](https://sourceforge.net/projects/numpy/files/NumPy/1.8.2/)


### Python Installation<a id="python3-install"></a>
The installation of Python is straight forward. You can select all the defaults, with the exception of the install path:

* Double-Click python-3.3.5.msi 
* Change install path to: $(path)\JTSDK\Python33
* Use the default option
* Allow the install to finish

### Setup Distutils<a id="setup-distutils"></a>
In order to compile Numpy, we need to tell dist utils which compiler we will be using. In this case, ( mingw32 ) from the MinGW project.

* Browse to $(path)\JTSDK\Python33\Lib\distutils
* create a text file called distutils.cfg
* Edit the file and add one line at the top:

~~~~~~~~~~~~~~~~
compiler=mingw32
~~~~~~~~~~~~~~~~

* Save and exit the file.


### Pip Installation<a id="pip-install"></a>
* Run pip-1.5.6.win32-py3.3.exe
* If required, browse to $(path)\JTSDK\Python33\ and select python.exe.
* Nothing else is required.

### Setup Tools Install<a id="setuptools-install"></a>
* Run setuptools-5.8.win32-py3.3.exe
* If required, browse to $(path)\JTSDK\Python33\ and select python.exe.
* Nothing else is required.

### PyWin32 Installation<a id="pywin32-install"></a>
* Run pywin32-219.win32-py3.3.exe
* If required browse to $(path)\JTSDK\Python33\ and select python.exe.
* Nothing else is required

### Cx-Freeze Install<a id="cxfreeze-install"></a>
* Run cx_Freeze-4.3.3.win32-py3.3.exe
* If required browse to $(path)\JTSDK\Python33\ and select python.exe.
* Nothing else is required
* ( Optional), run cx-freeze post-install script in C:\JTSDK\Python33. This should generate a simple Windows Batch File, that can be called from most any command line. 

### Numpy Install<a id="numpy-install"></a>
There are basically (3) options for Installing Numpy:
1. Use an Installer ( if your not re-distributing Python33 )
2. Use Pip ( works, but has know to be problematic on install )
3. Build from Source.

### Python Imaging Install<a id="pillow-install"></a>
* Open a Windows Terminal, CD/D  C:\JTSDK\Python33\Scripts
* Use pip to install pillow: pip install pillow==2.3
* Ensure Pillow installed: pip list 

**JTSDK** uses the build from source method to ensure the C & FC compilers, along with Python / Numpy work well together. 

Before attempting to build Numpy from source, you need to Install [Windows Visual Studio Express](http://www.visualstudio.com/en-US/products/visual-studio-express-vs) ( Free Version ). This will give you MSVC dll's ( standard and debug )and a couple configurations scripts that are needed during the Numpy build. From the downloads performed earlier:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.bat}
a. Open a Windows CMD terminal, and add MinGW32, Python and Python\Scripts
to your Windows %PATH% variable:

PATH=C:\JTSDK\mingw32\bin;C:\JTSDK\Python33;C:\JTSDK\Python33\Scripts;%PATH%

b. Extract numpy-1.8.1 into C:\JTSDK\Python33\Scripts
c. CD /D C:\JTSDK\Python33\Scripts\numpy-1.8.1
d. Ensure GCC works by typing: gcc --version .. it should render the version of GCC your using.

python setup.py config --compiler=mingw32 --fcompiler=gnu95 build

then

python setup.py config --compiler=mingw32 --fcompiler=gnu95 install


e. CD /D ..\ and then test F2PY ( assuming there were no compiler errors )

python C:\JTSDK\Python33\f2py.py -c --help-fcompiler

You should see your GCC environmet listed toward the tops, and Gfortran listed as your
Fcompiler. If you don't, then, something has gone wrong and you need to resolve it before
trying to build WSJT or WSPR.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### TO-DO ( Instructions )
* python33.dll & msvcr100.dll Install
* Update links for MinGW32 / 32_48 ON SF
* Add link to README.mingw32.md when it's written