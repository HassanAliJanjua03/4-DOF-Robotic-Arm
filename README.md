# 4-DOF Robotic Arm

**Robotics · Arduino · MATLAB**

An academic manipulator project combining mechanical design, modeling documentation and a four-servo position demonstration.

![Robotic arm prototype](20240505_144617.jpg)

## Engineering highlights

- Four Arduino Servo objects connected to pins 9–12.
- Preset joint commands of 90°, 45°, 135° and 180°.
- MATLAB code and project report provided as PDFs.

## Servo command example

| Servo | Arduino pin | Preset angle |
| --- | ---: | ---: |
| 1 | 9 | 90° |
| 2 | 10 | 45° |
| 3 | 11 | 135° |
| 4 | 12 | 180° |

These are the values in the original demonstration sketch, not measured joint positions. [Watch the original demonstration](Video.mp4).

## Project files

| File | Purpose |
| --- | --- |
| [4 DOF Robotic Arm.pdf](4%20DOF%20Robotic%20Arm.pdf) | Engineering report (PDF) |
| [MATLAB Code.pdf](MATLAB%20Code.pdf) | MATLAB code reference (PDF) |
| [ServoPreset.ino](ServoPreset/ServoPreset.ino) | Preserved Arduino sketch |
| [Video.mp4](Video.mp4) | Original demonstration video |
| [20240505_144617.jpg](20240505_144617.jpg) | Original project photograph |

## How to explore or reproduce

Review the report and MATLAB code PDF. The original Arduino sketch is preserved in [ServoPreset.ino](ServoPreset/ServoPreset.ino). Review joint limits, wiring and external servo power before uploading to compatible hardware.

## Scope and limitations

The included sketch commands preset positions; it does not itself implement closed-loop PID, trajectory planning or inverse kinematics. MATLAB code is distributed as a PDF rather than a runnable script.

## Portfolio

[Hassan Ali Janjua — Engineering portfolio](https://github.com/HassanAliJanjua03)
