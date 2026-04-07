# Code and Data for "Topographically organized dorsal raphe activity modulates forebrain sensory-motor representations and contributes to defensive behaviors"
 
This repository contains the MATLAB code and information about the processed data used to generate the figures and results in:

Mutlu et al., Topographically organized dorsal raphe activity modulates forebrain sensory-motor representations and contributes to defensive behaviors, *in revision*, 2026.

## 1. Repository structure

The repository is organized by figure. Each figure in the paper has a corresponding MATLAB script that can be utilized to reproduce the panels.

- `startup.m`  
 Initializes paths and environment variables. Run this once per MATLAB session before any figure script.

- `sav_con.m`  
 Saves the variables set to a constant value to con_esp.mat file.

- `Fig*.m`  
 Script with sequence of commands applying methods to the object to process the data and produce the panels in the respective figures.

- `support_code/`  
 Contains shared classes and functions used across multiple figure scripts.

- `drn_demo.m`  
 Plots Figure 2H of the manuscript for demonstration.

---

## 2. System requirements

### 2.1. Hardware requirements

- This code requires only a standard computer.

### 2.2. Software requirements

#### 2.2.1. OS requirements

This code is supported for Microsoft Windows. The code has been tested on the following system:

- Microsoft Windows: Windows Server 2022 Standard (21H2)

#### 2.2.2. Primary software

- MATLAB R2024b (64-bit)

#### 2.2.3. Additional dependencies

- None.

---

## 3. Installation guide

- This code does not require installation to run.

---

## 4. Demo

### 4.1. Instructions to run on data

- Open MATLAB and run the demo script drn_demo.m.

### 4.2. Expected output

- The script drn_demo.m reproduces Figure 2H from the manuscript.

### 4.3. Expected run time

- On a normal desktop computer, the demo completes in approximately 10–20 seconds.

---

## 5. Processed data

### 5.1. Download location

The processed data generated in this study will be deposited in the sigma2 database after publication.

---

## 6. Instructions for use

The software is organized using MATLAB’s object-oriented programming.
A typical analysis on the data follows these steps:

- Prepare the data in the required format.
- Create an object that represents the dataset.
- Run the analysis methods on the data object.
- Generate and save figures / results.