# Traffic-Light-FSM-Design-and-Simulation
The design controls red, yellow, and green lights with defined timing sequences for each state. Simulated in Vivado to verify state transitions and output behavior under various enable/reset conditions. Optimized for FPGA implementation with parameterized timing for easy hardware or simulation scaling.

<img width="1553" height="382" alt="Screenshot 2025-08-25 184710" src="https://github.com/user-attachments/assets/6a51db1d-40fb-4a22-8c8a-f2227efeccac" />
Traffic Light Controller Simulation

The waveform below shows the traffic light FSM (Finite State Machine) operation with three signals: Red, Yellow, and Green.

Explanation of Waveform
=> Clock (clk)
Provides the timing reference for state transitions.

The FSM changes states on the positive edge of the clock.

=> Reset (reset)

Initially active (1), keeping the system in a known OFF state.

When released (0), the FSM starts normal operation.

=> Enable (enb)

Enables the FSM.

When high, the traffic light controller cycles through its states.

=> Traffic Light Outputs

Red (red): Active between 100 ns – 600 ns.

Yellow (yellow): Active between 600 ns – 700 ns.

Green (green): Active after 700 ns.

FSM States (state_out[3:0])

Encoded states show transitions:

1 → OFF

2 → RED

4 → YELLOW

8 → GREEN

=> State Progression

At 0–100 ns: FSM is in OFF state.

At 100–600 ns: FSM enters RED state.

At 600–700 ns: FSM switches to YELLOW.

At 700 ns onwards: FSM moves to GREEN.

