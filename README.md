# 🚰 Tank Level Control System

### Control Engineering Final Project | MATLAB & Simulink

![MATLAB](https://img.shields.io/badge/MATLAB-Simulation-orange)
![Simulink](https://img.shields.io/badge/Simulink-Control%20Model-blue)
![Control Systems](https://img.shields.io/badge/Control-Classical%20Control-green)
![License](https://img.shields.io/badge/License-Academic-lightgrey)

---

## 📌 Overview

This repository contains the complete modeling, analysis, and controller design for a **tank liquid level control system**, developed as a final project for a Control Engineering course.

The goal of this project is to design a feedback control system capable of regulating tank fluid height while ensuring stability, fast response, and robustness against disturbances.

Unlike purely linear systems, the physical plant in this project exhibits **nonlinear behavior**, because the outlet flow rate depends on water pressure, which increases with liquid height. Therefore, both nonlinear modeling and linearization around an operating point were considered.

---

## 🎯 Project Goals

- Mathematical modeling of tank dynamics
- Nonlinear system analysis
- Linearization around operating point
- Transfer function derivation
- Open-loop and closed-loop analysis
- Controller design and tuning
- Stability verification
- Disturbance rejection evaluation
- Simulation and validation

---

## 🧠 System Description

The tank level system is modeled as a feedback control loop:

```
        +-------------+
Setpoint → Controller → Valve → Tank (Plant) → Sensor → Feedback
        +-------------+
```

### Main Elements

- Tank dynamics (nonlinear plant)
- Inflow control valve (actuator)
- Pressure-dependent outflow
- Feedback measurement
- Control algorithm (P/PI/PD/PID)

---

## ⚠️ Nonlinear Nature of the System

The system is inherently **nonlinear** because the outlet flow depends on hydrostatic pressure:

- As tank height increases, water pressure at the outlet increases.
- Increased pressure causes higher outflow rate.
- Therefore, system dynamics depend on current state (height).

Typical nonlinear relation:

```
Qout ∝ √H
```

This makes the plant nonlinear.

To apply classical control methods:

- The nonlinear model was first derived.
- Then the system was **linearized around a chosen operating point**.
- Linear transfer function was used for controller design and frequency-domain analysis.

---

## 🧮 Mathematical Modeling

Using conservation of mass:

```
dV/dt = Qin − Qout
```

Since:

```
V = A × H
```

We obtain:

```
A dH/dt = Qin − Qout(H)
```

Where:

- `H(t)` → tank height
- `A` → cross-sectional area
- `Qin` → inflow rate
- `Qout(H)` → nonlinear outflow depending on height

---

## 🔄 Transfer Function (Linearized Model)

After linearization and Laplace transform:

```
G(s) = 1 / (A s)
```

The linearized plant behaves as an integrator near the operating point.

---

## 📊 Analysis Performed

### ⏱ Time Domain

- Step response analysis
- Ramp input behavior
- Steady-state error evaluation
- Linear vs nonlinear response comparison

### 📈 Frequency Domain

- Bode plot analysis
- Gain and phase margins
- Nyquist stability analysis

### 🧷 Stability

- Pole-zero analysis
- BIBO stability
- Closed-loop verification

---

## 🎛 Controller Design

Different controllers were implemented and compared:

| Controller | Purpose | Result |
|---|---|---|
| P | Basic stabilization | Fast but steady-state error |
| PD | Faster response | Improved transient behavior |
| PI | Zero steady-state error | Better disturbance rejection |
| PID | Best overall performance | Balanced speed & stability |

Controller tuning focused on:

- Rise time
- Overshoot
- Settling time
- Robustness

---

## 🔬 Simulation

Simulations were performed using MATLAB Simulink:

- Nonlinear system modeling
- Linearized model comparison
- Closed-loop implementation
- Controller comparison
- Disturbance injection
- Practical limitations (saturation, noise)

---

## 🧱 Repository Structure

```
📂 Tank-Level-Control
 ┣ 📁 simulink_models
 ┣ 📁 matlab_scripts
 ┣ 📁 report
 ┣ 📄 README.md
```

---

## 🚀 Workflow

```
Nonlinear Modeling → Linearization → Transfer Function → Analysis → Controller Design → Simulation → Evaluation
```

---

## 📈 Key Results

- The real tank system is nonlinear due to pressure-dependent outflow.
- Linearization enables classical control design.
- Integral action improves steady-state performance.
- PID controller achieves best performance overall.

---

## 🛠 Tools & Technologies

- MATLAB
- Simulink
- Control System Toolbox

---
## ▶️ How to Run

1. Open MATLAB
2. Open Simulink model from /simulink_models
3. Run simulation

% ## 👨‍🎓 Authors

% - Nima Naqavi


## 📄 License

Academic project for educational purposes.
