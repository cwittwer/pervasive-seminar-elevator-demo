# Setup Information 
## JKU 2022 Pervasive Computing Seminar 

#### Install Pupil Labs Pupil Core Desktop Software:

 - https://pupil-labs.com/products/core/
 - https://docs.pupil-labs.com/core/
 - Don't forget about the Plugin Manager->NetworkAPI on and ports match

#### Install Python Environment:
##### Install miniconda

	https://docs.conda.io/en/latest/miniconda.html

##### Create the environment: 

		conda env create -f environment.yaml

##### Activate the conda environment:

		conda activate elevator

##### To be safe with OpenCV install:

		pip uninstall opencv-python-headless
		pip install opencv-python

##### EasyOCR is dependent on pytorch, so install first:

		conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch

 - https://pytorch.org/get-started/locally/

##### Then install EasyOCR:

		Run conda cmd: pip install easyocr

 - https://github.com/JaidedAI/EasyOCR#installation

#### Install C++ Compiler:
##### Install MSVC++ Community:

 - https://visualstudio.microsoft.com/vs/features/cplusplus/
 - Desktop development with C++

#### Install Qt with Online Installer:

 - https://www.qt.io/download-qt-installer
 - MinGW
 - Qt 6.2.4

#### Install Qt QuickDesignerComponents:

 - https://github.com/qt-labs/qtquickdesigner-components/blob/dev/REAMDE.md

		mkdir build
		cd build
		cmake -GNinja -DCMAKE_INSTALL_PREFIX=path_to_qt_install_directory path_to_qtquickdesigner-components_cmake
		cmake --build .
		cmake --install .

#### Open Project in Qt Creator:

 - File -> Open Project Project
 - Configure Project (with default settings)

### Debug all the issues, then get it running lol