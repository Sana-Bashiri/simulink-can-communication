# Database-Driven CAN Communication and Dashboard Modeling in Simulink



Two database-driven MATLAB/Simulink CAN models for signal generation, transmission, reception, and dashboard visualization.

## Models

- `SIMULINK.slx`: bidirectional speed, fuel, and host-clock transmit/receive paths.
- `CANoe_and_simulink.slx`: receive-oriented signal observer with dashboard elements.
- `ATLAS_database.dbc`: local database included alongside the models; no sibling project is required.

## Open and configure

1. Use MATLAB/Simulink and Vehicle Network Toolbox compatible with the saved R2024b models.
2. In MATLAB, navigate to `simulation/` and run `open_project` or `open_project('CANoe_and_simulink')`.
3. Inspect all device/channel settings before running. Saved native files select Vector VN1630 1, channel 1, at 125,000 bit/s. Install the matching Vector driver for physical operation, or explicitly configure appropriate virtual channels.
4. Confirm pacing, transmission triggers, and message periods. The solver step and receive sample time are 0.01 s; each transmit block has a one-second periodic refresh plus a data-change trigger.
5. Start the chosen model only after matching the device to the intended test setup.

The helper opens the model and resolves the bundled DBC without starting traffic. Packaged SLX copies have portable database filenames; their algorithms, connections, cached signal types and saved device settings are preserved.

## Results and interpretation

The [report](report/Simulink_CAN_Communication.pdf) describes both models. The [video](results/videos/simulink_demonstration.mp4) and [figures](results/figures/) show an earlier MathWorks virtual-channel configuration at 500 kbit/s, which differs from the saved native models. [Calculated vectors](results/decoding_vectors.csv) are encoding checks, not a newly executed simulation.

The signed 12-bit speed definition conflicts with the DBC's positive maximum. Speed/fuel transmit periods also differ from the DBC's 100 ms cycle metadata. No raw measurement dataset or new hardware execution is claimed. Recheck these properties and capture a fresh log before reporting timing or error statistics.


## Repository layout

- `report/`: six-page report.
- `simulation/`: native project/model sources and environment requirements.
- `results/`: project-specific evidence and clearly labeled analytical results.
- `MANIFEST.csv`: file sizes and SHA-256 checksums for the upload package.


