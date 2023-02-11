\ Model Food Manufacture I
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ See: https://github.com/Gurobi/modeling-examples
Maximize
  150 Produce[Jan] + 150 Produce[Feb] + 150 Produce[Mar] + 150 Produce[Apr]
   + 150 Produce[May] + 150 Produce[Jun] - 110 Buy[Jan,VEG1]
   - 120 Buy[Jan,VEG2] - 130 Buy[Jan,OIL1] - 110 Buy[Jan,OIL2]
   - 115 Buy[Jan,OIL3] - 130 Buy[Feb,VEG1] - 130 Buy[Feb,VEG2]
   - 110 Buy[Feb,OIL1] - 90 Buy[Feb,OIL2] - 115 Buy[Feb,OIL3]
   - 110 Buy[Mar,VEG1] - 140 Buy[Mar,VEG2] - 130 Buy[Mar,OIL1]
   - 100 Buy[Mar,OIL2] - 95 Buy[Mar,OIL3] - 120 Buy[Apr,VEG1]
   - 110 Buy[Apr,VEG2] - 120 Buy[Apr,OIL1] - 120 Buy[Apr,OIL2]
   - 125 Buy[Apr,OIL3] - 100 Buy[May,VEG1] - 120 Buy[May,VEG2]
   - 150 Buy[May,OIL1] - 110 Buy[May,OIL2] - 105 Buy[May,OIL3]
   - 90 Buy[Jun,VEG1] - 100 Buy[Jun,VEG2] - 140 Buy[Jun,OIL1]
   - 80 Buy[Jun,OIL2] - 135 Buy[Jun,OIL3] - 5 Store[Jan,VEG1]
   - 5 Store[Jan,VEG2] - 5 Store[Jan,OIL1] - 5 Store[Jan,OIL2]
   - 5 Store[Jan,OIL3] - 5 Store[Feb,VEG1] - 5 Store[Feb,VEG2]
   - 5 Store[Feb,OIL1] - 5 Store[Feb,OIL2] - 5 Store[Feb,OIL3]
   - 5 Store[Mar,VEG1] - 5 Store[Mar,VEG2] - 5 Store[Mar,OIL1]
   - 5 Store[Mar,OIL2] - 5 Store[Mar,OIL3] - 5 Store[Apr,VEG1]
   - 5 Store[Apr,VEG2] - 5 Store[Apr,OIL1] - 5 Store[Apr,OIL2]
   - 5 Store[Apr,OIL3] - 5 Store[May,VEG1] - 5 Store[May,VEG2]
   - 5 Store[May,OIL1] - 5 Store[May,OIL2] - 5 Store[May,OIL3]
   - 5 Store[Jun,VEG1] - 5 Store[Jun,VEG2] - 5 Store[Jun,OIL1]
   - 5 Store[Jun,OIL2] - 5 Store[Jun,OIL3]
Subject To
 Initial_Balance[VEG1]: Buy[Jan,VEG1] - Use[Jan,VEG1] - Store[Jan,VEG1]
   = -500
 Initial_Balance[VEG2]: Buy[Jan,VEG2] - Use[Jan,VEG2] - Store[Jan,VEG2]
   = -500
 Initial_Balance[OIL1]: Buy[Jan,OIL1] - Use[Jan,OIL1] - Store[Jan,OIL1]
   = -500
 Initial_Balance[OIL2]: Buy[Jan,OIL2] - Use[Jan,OIL2] - Store[Jan,OIL2]
   = -500
 Initial_Balance[OIL3]: Buy[Jan,OIL3] - Use[Jan,OIL3] - Store[Jan,OIL3]
   = -500
 Balance[VEG1,Jan]: Buy[Jan,VEG1] - Use[Jan,VEG1] - Store[Jan,VEG1]
   + Store[Jun,VEG1] = 0
 Balance[VEG1,Feb]: Buy[Feb,VEG1] - Use[Feb,VEG1] + Store[Jan,VEG1]
   - Store[Feb,VEG1] = 0
 Balance[VEG1,Mar]: Buy[Mar,VEG1] - Use[Mar,VEG1] + Store[Feb,VEG1]
   - Store[Mar,VEG1] = 0
 Balance[VEG1,Apr]: Buy[Apr,VEG1] - Use[Apr,VEG1] + Store[Mar,VEG1]
   - Store[Apr,VEG1] = 0
 Balance[VEG1,May]: Buy[May,VEG1] - Use[May,VEG1] + Store[Apr,VEG1]
   - Store[May,VEG1] = 0
 Balance[VEG1,Jun]: Buy[Jun,VEG1] - Use[Jun,VEG1] + Store[May,VEG1]
   - Store[Jun,VEG1] = 0
 Balance[VEG2,Jan]: Buy[Jan,VEG2] - Use[Jan,VEG2] - Store[Jan,VEG2]
   + Store[Jun,VEG2] = 0
 Balance[VEG2,Feb]: Buy[Feb,VEG2] - Use[Feb,VEG2] + Store[Jan,VEG2]
   - Store[Feb,VEG2] = 0
 Balance[VEG2,Mar]: Buy[Mar,VEG2] - Use[Mar,VEG2] + Store[Feb,VEG2]
   - Store[Mar,VEG2] = 0
 Balance[VEG2,Apr]: Buy[Apr,VEG2] - Use[Apr,VEG2] + Store[Mar,VEG2]
   - Store[Apr,VEG2] = 0
 Balance[VEG2,May]: Buy[May,VEG2] - Use[May,VEG2] + Store[Apr,VEG2]
   - Store[May,VEG2] = 0
 Balance[VEG2,Jun]: Buy[Jun,VEG2] - Use[Jun,VEG2] + Store[May,VEG2]
   - Store[Jun,VEG2] = 0
 Balance[OIL1,Jan]: Buy[Jan,OIL1] - Use[Jan,OIL1] - Store[Jan,OIL1]
   + Store[Jun,OIL1] = 0
 Balance[OIL1,Feb]: Buy[Feb,OIL1] - Use[Feb,OIL1] + Store[Jan,OIL1]
   - Store[Feb,OIL1] = 0
 Balance[OIL1,Mar]: Buy[Mar,OIL1] - Use[Mar,OIL1] + Store[Feb,OIL1]
   - Store[Mar,OIL1] = 0
 Balance[OIL1,Apr]: Buy[Apr,OIL1] - Use[Apr,OIL1] + Store[Mar,OIL1]
   - Store[Apr,OIL1] = 0
 Balance[OIL1,May]: Buy[May,OIL1] - Use[May,OIL1] + Store[Apr,OIL1]
   - Store[May,OIL1] = 0
 Balance[OIL1,Jun]: Buy[Jun,OIL1] - Use[Jun,OIL1] + Store[May,OIL1]
   - Store[Jun,OIL1] = 0
 Balance[OIL2,Jan]: Buy[Jan,OIL2] - Use[Jan,OIL2] - Store[Jan,OIL2]
   + Store[Jun,OIL2] = 0
 Balance[OIL2,Feb]: Buy[Feb,OIL2] - Use[Feb,OIL2] + Store[Jan,OIL2]
   - Store[Feb,OIL2] = 0
 Balance[OIL2,Mar]: Buy[Mar,OIL2] - Use[Mar,OIL2] + Store[Feb,OIL2]
   - Store[Mar,OIL2] = 0
 Balance[OIL2,Apr]: Buy[Apr,OIL2] - Use[Apr,OIL2] + Store[Mar,OIL2]
   - Store[Apr,OIL2] = 0
 Balance[OIL2,May]: Buy[May,OIL2] - Use[May,OIL2] + Store[Apr,OIL2]
   - Store[May,OIL2] = 0
 Balance[OIL2,Jun]: Buy[Jun,OIL2] - Use[Jun,OIL2] + Store[May,OIL2]
   - Store[Jun,OIL2] = 0
 Balance[OIL3,Jan]: Buy[Jan,OIL3] - Use[Jan,OIL3] - Store[Jan,OIL3]
   + Store[Jun,OIL3] = 0
 Balance[OIL3,Feb]: Buy[Feb,OIL3] - Use[Feb,OIL3] + Store[Jan,OIL3]
   - Store[Feb,OIL3] = 0
 Balance[OIL3,Mar]: Buy[Mar,OIL3] - Use[Mar,OIL3] + Store[Feb,OIL3]
   - Store[Mar,OIL3] = 0
 Balance[OIL3,Apr]: Buy[Apr,OIL3] - Use[Apr,OIL3] + Store[Mar,OIL3]
   - Store[Apr,OIL3] = 0
 Balance[OIL3,May]: Buy[May,OIL3] - Use[May,OIL3] + Store[Apr,OIL3]
   - Store[May,OIL3] = 0
 Balance[OIL3,Jun]: Buy[Jun,OIL3] - Use[Jun,OIL3] + Store[May,OIL3]
   - Store[Jun,OIL3] = 0
 End_Balance[VEG1]: Store[Jun,VEG1] = 500
 End_Balance[VEG2]: Store[Jun,VEG2] = 500
 End_Balance[OIL1]: Store[Jun,OIL1] = 500
 End_Balance[OIL2]: Store[Jun,OIL2] = 500
 End_Balance[OIL3]: Store[Jun,OIL3] = 500
 Capacity_Veg[Jan]: Use[Jan,VEG1] + Use[Jan,VEG2] <= 200
 Capacity_Veg[Feb]: Use[Feb,VEG1] + Use[Feb,VEG2] <= 200
 Capacity_Veg[Mar]: Use[Mar,VEG1] + Use[Mar,VEG2] <= 200
 Capacity_Veg[Apr]: Use[Apr,VEG1] + Use[Apr,VEG2] <= 200
 Capacity_Veg[May]: Use[May,VEG1] + Use[May,VEG2] <= 200
 Capacity_Veg[Jun]: Use[Jun,VEG1] + Use[Jun,VEG2] <= 200
 Capacity_Oil[Jan]: Use[Jan,OIL1] + Use[Jan,OIL2] + Use[Jan,OIL3] <= 250
 Capacity_Oil[Feb]: Use[Feb,OIL1] + Use[Feb,OIL2] + Use[Feb,OIL3] <= 250
 Capacity_Oil[Mar]: Use[Mar,OIL1] + Use[Mar,OIL2] + Use[Mar,OIL3] <= 250
 Capacity_Oil[Apr]: Use[Apr,OIL1] + Use[Apr,OIL2] + Use[Apr,OIL3] <= 250
 Capacity_Oil[May]: Use[May,OIL1] + Use[May,OIL2] + Use[May,OIL3] <= 250
 Capacity_Oil[Jun]: Use[Jun,OIL1] + Use[Jun,OIL2] + Use[Jun,OIL3] <= 250
 Hardness_lower[Jan]: - 3 Produce[Jan] + 8.8 Use[Jan,VEG1]
   + 6.1 Use[Jan,VEG2] + 2 Use[Jan,OIL1] + 4.2 Use[Jan,OIL2]
   + 5 Use[Jan,OIL3] >= 0
 Hardness_lower[Feb]: - 3 Produce[Feb] + 8.8 Use[Feb,VEG1]
   + 6.1 Use[Feb,VEG2] + 2 Use[Feb,OIL1] + 4.2 Use[Feb,OIL2]
   + 5 Use[Feb,OIL3] >= 0
 Hardness_lower[Mar]: - 3 Produce[Mar] + 8.8 Use[Mar,VEG1]
   + 6.1 Use[Mar,VEG2] + 2 Use[Mar,OIL1] + 4.2 Use[Mar,OIL2]
   + 5 Use[Mar,OIL3] >= 0
 Hardness_lower[Apr]: - 3 Produce[Apr] + 8.8 Use[Apr,VEG1]
   + 6.1 Use[Apr,VEG2] + 2 Use[Apr,OIL1] + 4.2 Use[Apr,OIL2]
   + 5 Use[Apr,OIL3] >= 0
 Hardness_lower[May]: - 3 Produce[May] + 8.8 Use[May,VEG1]
   + 6.1 Use[May,VEG2] + 2 Use[May,OIL1] + 4.2 Use[May,OIL2]
   + 5 Use[May,OIL3] >= 0
 Hardness_lower[Jun]: - 3 Produce[Jun] + 8.8 Use[Jun,VEG1]
   + 6.1 Use[Jun,VEG2] + 2 Use[Jun,OIL1] + 4.2 Use[Jun,OIL2]
   + 5 Use[Jun,OIL3] >= 0
 Hardness_upper[Jan]: - 6 Produce[Jan] + 8.8 Use[Jan,VEG1]
   + 6.1 Use[Jan,VEG2] + 2 Use[Jan,OIL1] + 4.2 Use[Jan,OIL2]
   + 5 Use[Jan,OIL3] <= 0
 Hardness_upper[Feb]: - 6 Produce[Feb] + 8.8 Use[Feb,VEG1]
   + 6.1 Use[Feb,VEG2] + 2 Use[Feb,OIL1] + 4.2 Use[Feb,OIL2]
   + 5 Use[Feb,OIL3] <= 0
 Hardness_upper[Mar]: - 6 Produce[Mar] + 8.8 Use[Mar,VEG1]
   + 6.1 Use[Mar,VEG2] + 2 Use[Mar,OIL1] + 4.2 Use[Mar,OIL2]
   + 5 Use[Mar,OIL3] <= 0
 Hardness_upper[Apr]: - 6 Produce[Apr] + 8.8 Use[Apr,VEG1]
   + 6.1 Use[Apr,VEG2] + 2 Use[Apr,OIL1] + 4.2 Use[Apr,OIL2]
   + 5 Use[Apr,OIL3] <= 0
 Hardness_upper[May]: - 6 Produce[May] + 8.8 Use[May,VEG1]
   + 6.1 Use[May,VEG2] + 2 Use[May,OIL1] + 4.2 Use[May,OIL2]
   + 5 Use[May,OIL3] <= 0
 Hardness_upper[Jun]: - 6 Produce[Jun] + 8.8 Use[Jun,VEG1]
   + 6.1 Use[Jun,VEG2] + 2 Use[Jun,OIL1] + 4.2 Use[Jun,OIL2]
   + 5 Use[Jun,OIL3] <= 0
 Mass_conservation[Jan]: - Produce[Jan] + Use[Jan,VEG1] + Use[Jan,VEG2]
   + Use[Jan,OIL1] + Use[Jan,OIL2] + Use[Jan,OIL3] = 0
 Mass_conservation[Feb]: - Produce[Feb] + Use[Feb,VEG1] + Use[Feb,VEG2]
   + Use[Feb,OIL1] + Use[Feb,OIL2] + Use[Feb,OIL3] = 0
 Mass_conservation[Mar]: - Produce[Mar] + Use[Mar,VEG1] + Use[Mar,VEG2]
   + Use[Mar,OIL1] + Use[Mar,OIL2] + Use[Mar,OIL3] = 0
 Mass_conservation[Apr]: - Produce[Apr] + Use[Apr,VEG1] + Use[Apr,VEG2]
   + Use[Apr,OIL1] + Use[Apr,OIL2] + Use[Apr,OIL3] = 0
 Mass_conservation[May]: - Produce[May] + Use[May,VEG1] + Use[May,VEG2]
   + Use[May,OIL1] + Use[May,OIL2] + Use[May,OIL3] = 0
 Mass_conservation[Jun]: - Produce[Jun] + Use[Jun,VEG1] + Use[Jun,VEG2]
   + Use[Jun,OIL1] + Use[Jun,OIL2] + Use[Jun,OIL3] = 0
Bounds
End
