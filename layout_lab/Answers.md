**Name:** Huzaifa Qayyum  
**Roll No:** 04072313048  

---

## Part A

**A1:** 37
**A2:** 5
**A3:** 3
**A4:** 66

---

## Part B

### B1
**Stateless:** `LabApp`, `HomePage`, `SettingsCard`, `SummaryRow`, `Probe`, `Welcome`, `InfoPanel`, `ShareRow`, `InfoBox`, and `StampStack`. They do not change once drawn.
**Stateful:** `Clock`, `Tile`, and `SwapBoard`. They hold data that changes over time using `setState()`.

### B2
The `Widget` is thrown away and rebuilt on every `setState()`. The `Element` and `RenderObject` stay in memory.
`Probe` proved this because the `Widget` ID changed every second, but the `Element` ID stayed the exact same. The `RenderObject` does the actual measuring and painting on screen.

### B3
Parents pass size limits down, and children choose their size within those limits.