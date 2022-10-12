# MATLAB Production Server and Python fastAPI


The aim is to connect 2 APIs: a MATLAB archive (ctf file compiled with MATLAB Production Server) and fastAPI (Python).  
The MATLAB function (***myMATLABFunction.m***) will call Python API (with the ***callingPythonFunction.m*** file) with MATLAB web services ([link to the documentation](https://www.mathworks.com/help/matlab/http-interface.html)).  


## :books: Getting started ##

This project uses MATLAB Production Server to compile a MATLAB archive (CTF file) with the function [compiler.build.productionServerArchive](https://www.mathworks.com/help/compiler_sdk/mps_dev_test/compiler.build.productionserverarchive.html#d123e7592) (you can also do it interactively with the Production Server Compiler app).  

The compiled and deployed MATLAB function will call another function that uses http request to call Python fastAPI function. We use [Postman](https://www.postman.com/) to run the MATLAB ctf file, and monitor it through the MATLAB Production Server Dashboard.   


## :link: Prerequisites
To run this project, you need:  
- MATLAB
- MATLAB Production Server
- Python installed
- Uvicorn installed
  
  
## :hammer: Installation
After the python install, you need to install uvicorn (command line in the ***deployFastAPI.mlx*** file: *!pip install uvicorn*).  


## :notebook: Usage
```matlab
% Run the deployFastAPI.mlx file
!pip install uvicorn % install uvicorn
!uvicorn main:app --reload % deploy API

% Run the ToRun.mlx file
type main.py % display the customProcessing Python function
type myMATLABFunction.m % display the MATLAB function that call callingPythonFunction.m
myMATLABFunction(2,1) % test the MATLAB function

% Create the CTF file
opts = compiler.build.ProductionServerArchiveOptions("myMATLABFunction.m", "AdditionalFiles", "callPythonFunction.m"); % Add the callPythonFunction additional file to the archive 
mpsResults = compiler.build.productionServerArchive(opts); % Build the archive

% MATLAB Production Server dashboard 
!"C:\MATLAB\MATLABProductionServer\RXXXXx\dashboard\mps-dashboard.bat" start % run the dashboard (with RXXXXx the MATLAB release) 

% Test MATLAB function (calling Python) with Postman 
``` 

## :information_source: Helpful resources
- [Enterprise Deployment with MATLAB Production Server](https://www.mathworks.com/help/compiler_sdk/mps.html?s_tid=CRUX_lftnav) 
- [FastAPI](https://fastapi.tiangolo.com/) 
- [Uvicorn](https://www.uvicorn.org/)
