
import equational_theories.AllEquations
import equational_theories.FactsSyntax
import equational_theories.MemoFinOp
import equational_theories.DecideBang
import equational_theories.EquationalResult

/-!
This file defines some trivially small magmas, and prove the exhaustive list of facts for two of them

This mainly serves
* as an example for how to phrase counterexamples for Magmas based on `Fin n`
* how to prove them using brute-force calculation using `decideFin!`.
* as a stress-test for tools to handle largeish lists of facts.
-/

/--
Just for notational convenience, a way to specify magmas by multiplication table.

The use of `memoFinOp` below ensures that the actual computation is done efficiently, no matter
how `op` is defined here.
-/
private def ofMatrix {n : Nat} [Inhabited (Fin n)]
  (table : Array (Array (Fin n))) (x y : Fin n) : Fin n :=
  table[x.val]![y.val]!

/-!
All magmas of size 2, up to isomorphism and look at the dual operation.
-/

/-- `x ◆ y => ⊥` -/
def Magma2a : Magma (Fin 2) where op := memoFinOp (ofMatrix #[ #[0, 0], #[0, 0] ])

/-- `x ◆ y => x ∧ y` -/
def Magma2b : Magma (Fin 2) where op := memoFinOp (ofMatrix #[ #[0, 0], #[0, 1] ])

/-- `x ◆ y => x ∧ ¬ y` -/
def Magma2c : Magma (Fin 2) where op := memoFinOp (ofMatrix #[ #[0, 0], #[1, 0] ])

/-- `x ◆ y => x` -/
def Magma2d : Magma (Fin 2) where op := memoFinOp (ofMatrix #[ #[0, 0], #[1, 1] ])

/-- `x ◆ y => x ^ y` -/
def Magma2e : Magma (Fin 2) where op := memoFinOp (ofMatrix #[ #[0, 1], #[1, 0] ])

/-- `x ◆ y = x || y` -/
def Magma2f : Magma (Fin 2) where op := memoFinOp (ofMatrix #[ #[0, 1], #[1, 1] ])


/-- The facts about the first of the magmas (constant 0) -/
@[equational_result]
theorem Magma2a.Facts : ∃ (G : Type) (_ : Magma G), Facts G
  [1, 321, 341, 345, 349, 354, 355, 373, 383, 393, 397, 401, 404, 406, 3294, 3455, 3626, 3658, 3850, 3855, 3858, 3859, 4032, 4064, 4235, 4267, 4370, 4371, 4377, 4537, 4556, 4566, 4568, 4576, 4580, 4581, 4681, 4682, 4685]
  [2, 3, 8, 23, 47, 99, 151, 203, 255, 411, 614, 817, 1020, 1223, 1426, 1629, 1832, 2035, 2238, 2441, 2644, 2847, 3050]
  := ⟨Fin 2, Magma2a, by decideFin!⟩

@[equational_result]
theorem Magma2b.Facts : ∃ (G : Type) (_ : Magma G), Facts G
  [1, 3, 323, 325, 332, 333, 335, 377, 378, 384, 385, 387, 3308, 3309, 3315, 3318, 3345, 3346, 3352, 3355, 3509, 3511, 3512, 3519, 3521, 3545, 3546, 3548, 3549, 3555, 3556, 3558, 3712, 3714, 3721, 3724, 3725, 3748, 3749, 3751, 3752, 3758, 3759, 3761, 3917, 3918, 3924, 3925, 3927, 3928, 3951, 3952, 3954, 3955, 3961, 3964, 4120, 4121, 4154, 4155, 4157, 4158, 4164, 4165, 4284, 4291, 4293, 4314, 4321, 4343, 4358, 4362, 4364, 4369, 4399, 4406, 4408, 4436, 4443, 4445, 4472, 4479, 4512, 4515, 4525, 4541, 4544, 4599, 4606, 4608, 4629, 4636, 4658, 4673, 4679, 4684]
  [2, 4, 5, 9, 10, 11, 13, 14, 16, 24, 25, 26, 28, 31, 38, 39, 40, 48, 49, 50, 52, 53, 55, 56, 62, 63, 65, 66, 72, 73, 75, 100, 101, 102, 104, 105, 107, 108, 114, 115, 117, 118, 124, 125, 127, 152, 153, 154, 156, 157, 159, 160, 166, 167, 169, 170, 176, 177, 179, 204, 205, 206, 208, 209, 211, 212, 218, 219, 221, 222, 228, 229, 231, 256, 257, 258, 260, 261, 263, 264, 270, 271, 273, 274, 280, 281, 283, 308, 309, 310, 312, 313, 315, 316, 331, 336, 360, 361, 362, 364, 365, 367, 368, 374, 407, 412, 413, 414, 416, 417, 419, 420, 426, 427, 429, 430, 436, 437, 439, 440, 463, 464, 466, 467, 473, 474, 476, 477, 500, 501, 503, 504, 510, 511, 513, 615, 616, 617, 619, 620, 622, 623, 629, 630, 632, 633, 639, 640, 642, 643, 666, 667, 669, 670, 676, 677, 679, 680, 703, 704, 706, 707, 713, 714, 716, 818, 819, 820, 822, 823, 825, 826, 832, 833, 835, 836, 842, 843, 845, 846, 869, 870, 872, 873, 879, 880, 882, 883, 906, 907, 909, 910, 916, 917, 919, 1021, 1022, 1023, 1025, 1026, 1028, 1029, 1035, 1036, 1038, 1039, 1045, 1046, 1048, 1049, 1072, 1073, 1075, 1076, 1082, 1083, 1085, 1086, 1109, 1110, 1112, 1113, 1119, 1120, 1122, 1224, 1225, 1226, 1228, 1229, 1231, 1232, 1238, 1239, 1241, 1242, 1248, 1249, 1251, 1252, 1275, 1276, 1278, 1279, 1285, 1286, 1288, 1289, 1312, 1313, 1315, 1316, 1322, 1323, 1325, 1427, 1428, 1429, 1431, 1432, 1434, 1435, 1441, 1442, 1444, 1445, 1451, 1452, 1454, 1455, 1478, 1479, 1481, 1482, 1488, 1489, 1491, 1492, 1515, 1516, 1518, 1519, 1525, 1526, 1528, 1630, 1631, 1632, 1634, 1635, 1637, 1638, 1644, 1645, 1647, 1648, 1654, 1655, 1657, 1658, 1681, 1682, 1684, 1685, 1691, 1692, 1694, 1695, 1718, 1719, 1721, 1722, 1728, 1729, 1731, 1833, 1834, 1835, 1837, 1838, 1840, 1841, 1847, 1848, 1850, 1851, 1857, 1858, 1860, 1861, 1884, 1885, 1887, 1888, 1894, 1895, 1897, 1898, 1921, 1922, 1924, 1925, 1931, 1932, 1934, 2036, 2037, 2038, 2040, 2041, 2043, 2044, 2050, 2051, 2053, 2054, 2060, 2061, 2063, 2064, 2087, 2088, 2090, 2091, 2097, 2098, 2100, 2101, 2124, 2125, 2127, 2128, 2134, 2135, 2137, 2239, 2240, 2241, 2243, 2244, 2246, 2247, 2253, 2254, 2256, 2257, 2263, 2264, 2266, 2267, 2290, 2291, 2293, 2294, 2300, 2301, 2303, 2304, 2327, 2328, 2330, 2331, 2337, 2338, 2340, 2442, 2443, 2444, 2446, 2447, 2449, 2450, 2456, 2457, 2459, 2460, 2466, 2467, 2469, 2470, 2493, 2494, 2496, 2497, 2503, 2504, 2506, 2507, 2530, 2531, 2533, 2534, 2540, 2541, 2543, 2645, 2646, 2647, 2649, 2650, 2652, 2653, 2659, 2660, 2662, 2663, 2669, 2670, 2672, 2673, 2696, 2697, 2699, 2700, 2706, 2707, 2709, 2710, 2733, 2734, 2736, 2737, 2743, 2744, 2746, 2848, 2849, 2850, 2852, 2853, 2855, 2856, 2862, 2863, 2865, 2866, 2872, 2873, 2875, 2876, 2899, 2900, 2902, 2903, 2909, 2910, 2912, 2913, 2936, 2937, 2939, 2940, 2946, 2947, 2949, 3051, 3052, 3053, 3055, 3056, 3058, 3059, 3065, 3066, 3068, 3069, 3075, 3076, 3078, 3079, 3102, 3103, 3105, 3106, 3112, 3113, 3115, 3116, 3139, 3140, 3142, 3143, 3149, 3150, 3152, 3254, 3255, 3256, 3258, 3259, 3261, 3262, 3268, 3269, 3271, 3272, 3278, 3279, 3281, 3337, 3457, 3458, 3459, 3461, 3462, 3464, 3465, 3471, 3472, 3474, 3475, 3481, 3482, 3484, 3543, 3660, 3661, 3662, 3664, 3665, 3667, 3668, 3674, 3675, 3677, 3678, 3684, 3685, 3687, 3863, 3864, 3865, 3867, 3868, 3870, 3871, 3877, 3878, 3880, 3881, 3887, 3888, 3890, 4055, 4066, 4067, 4068, 4070, 4071, 4073, 4074, 4080, 4081, 4083, 4084, 4090, 4091, 4093, 4258, 4268, 4269, 4270, 4272, 4273, 4275, 4276, 4368, 4373, 4381, 4382, 4383, 4385, 4386, 4388, 4539, 4547, 4571, 4583, 4584, 4585, 4587, 4588, 4590, 4591, 4683, 4688]
  := ⟨Fin 2, Magma2b, by decideFin!⟩

@[equational_result]
theorem Magma2c.Facts : ∃ (G : Type) (_ : Magma G), Facts G
  [1, 10, 11, 106, 109, 111, 369, 371, 378, 429, 433, 434, 442, 443, 833, 836, 842, 845, 854, 1041, 1042, 1043, 1051, 1052, 1053, 1055, 1056, 1059, 1060, 1063, 1247, 1257, 1265, 1271, 1850, 1855, 1861, 1863, 3285, 3286, 3306, 3316, 3321, 3684, 3685, 3687, 3726, 3727, 3878, 3881, 3888, 3895, 3931, 4072, 4085, 4099, 4104, 4106, 4113, 4293, 4318, 4609, 4626, 4639, 4673]
  [2, 3, 9, 13, 14, 16, 23, 38, 39, 43, 47, 102, 114, 115, 117, 118, 124, 125, 127, 151, 203, 255, 307, 331, 362, 364, 374, 375, 377, 384, 385, 407, 412, 416, 417, 419, 420, 463, 464, 466, 467, 473, 474, 476, 477, 500, 501, 503, 504, 510, 511, 513, 614, 822, 825, 826, 869, 870, 872, 873, 879, 880, 882, 883, 906, 907, 909, 910, 916, 917, 919, 1021, 1026, 1029, 1072, 1073, 1075, 1076, 1082, 1083, 1085, 1086, 1109, 1110, 1112, 1113, 1119, 1120, 1122, 1232, 1275, 1276, 1278, 1279, 1285, 1286, 1288, 1289, 1312, 1313, 1315, 1316, 1322, 1323, 1325, 1426, 1629, 1833, 1837, 1838, 1840, 1841, 1848, 1858, 1884, 1885, 1887, 1888, 1894, 1895, 1897, 1898, 1921, 1922, 1924, 1925, 1931, 1932, 1934, 2035, 2238, 2441, 2644, 2847, 3050, 3254, 3258, 3259, 3261, 3262, 3268, 3269, 3271, 3272, 3281, 3308, 3309, 3337, 3342, 3343, 3345, 3346, 3352, 3353, 3355, 3456, 3543, 3664, 3667, 3668, 3674, 3675, 3678, 3712, 3714, 3715, 3722, 3748, 3749, 3751, 3752, 3758, 3759, 3761, 3863, 3868, 3871, 3877, 3880, 3890, 3917, 3918, 3924, 3927, 3951, 3952, 3954, 3955, 3961, 3962, 3964, 4055, 4074, 4080, 4118, 4120, 4121, 4127, 4128, 4130, 4154, 4155, 4157, 4158, 4164, 4165, 4167, 4258, 4268, 4272, 4273, 4275, 4276, 4283, 4284, 4290, 4291, 4320, 4321, 4343, 4368, 4373, 4380, 4539, 4547, 4571, 4585, 4587, 4599, 4605, 4629, 4635, 4658, 4683, 4688]
  := ⟨Fin 2, Magma2c, by decideFin!⟩

@[equational_result]
theorem Magma2d.Facts : ∃ (G : Type) (_ : Magma G), Facts G
  [1, 4, 9, 10, 11, 24, 25, 26, 61, 113, 165, 217, 259, 262, 265, 266, 267, 268, 363, 376, 379, 380, 382, 449, 453, 457, 458, 459, 460, 461, 631, 634, 637, 641, 644, 647, 651, 655, 659, 826, 836, 843, 845, 861, 1044, 1054, 1058, 1062, 1066, 1069, 1070, 1227, 1233, 1235, 1243, 1245, 1253, 1255, 1264, 1267, 1464, 1468, 1472, 1473, 1474, 1475, 1476, 1646, 1649, 1652, 1656, 1659, 1666, 1670, 1674, 1835, 1842, 1844, 1852, 1854, 1862, 1864, 1876, 2086, 2255, 2258, 2261, 2265, 2268, 2271, 2275, 2279, 2283, 2444, 2451, 2453, 2461, 2463, 2471, 2473, 2482, 2695, 2898, 3101, 3747, 3950, 4075, 4078, 4125, 4140, 4144, 4149, 4150, 4151, 4359, 4674]
  [2, 5, 13, 14, 16, 28, 31, 39, 40, 43, 62, 63, 65, 66, 72, 73, 75, 114, 115, 117, 118, 124, 125, 127, 166, 167, 169, 170, 176, 177, 179, 218, 219, 221, 222, 228, 229, 231, 270, 271, 273, 274, 280, 281, 283, 312, 313, 315, 316, 332, 333, 335, 336, 364, 365, 367, 368, 384, 385, 407, 463, 464, 466, 467, 473, 474, 476, 477, 500, 501, 503, 504, 510, 511, 513, 666, 667, 669, 670, 676, 677, 679, 680, 703, 704, 706, 707, 713, 714, 716, 869, 870, 872, 873, 879, 880, 882, 883, 906, 907, 909, 910, 916, 917, 919, 1072, 1073, 1075, 1076, 1082, 1083, 1085, 1086, 1109, 1110, 1112, 1113, 1119, 1120, 1122, 1275, 1276, 1278, 1279, 1285, 1286, 1288, 1289, 1312, 1313, 1315, 1316, 1322, 1323, 1325, 1478, 1479, 1481, 1482, 1488, 1489, 1491, 1492, 1515, 1516, 1518, 1519, 1525, 1526, 1528, 1681, 1682, 1684, 1685, 1691, 1692, 1694, 1695, 1718, 1719, 1721, 1722, 1728, 1729, 1731, 1884, 1885, 1887, 1888, 1894, 1895, 1897, 1898, 1921, 1922, 1924, 1925, 1931, 1932, 1934, 2087, 2088, 2090, 2091, 2097, 2098, 2100, 2101, 2124, 2125, 2127, 2128, 2134, 2135, 2137, 2290, 2291, 2293, 2294, 2300, 2301, 2303, 2304, 2327, 2328, 2330, 2331, 2337, 2338, 2340, 2493, 2494, 2496, 2497, 2503, 2504, 2506, 2507, 2530, 2531, 2533, 2534, 2540, 2541, 2543, 2696, 2697, 2699, 2700, 2706, 2707, 2709, 2710, 2733, 2734, 2736, 2737, 2743, 2744, 2746, 2899, 2900, 2902, 2903, 2909, 2910, 2912, 2913, 2936, 2937, 2939, 2940, 2946, 2947, 2949, 3102, 3103, 3105, 3106, 3112, 3113, 3115, 3116, 3139, 3140, 3142, 3143, 3149, 3150, 3152, 3268, 3269, 3271, 3272, 3278, 3279, 3281, 3342, 3343, 3345, 3346, 3352, 3353, 3355, 3471, 3472, 3474, 3475, 3481, 3482, 3484, 3545, 3546, 3548, 3549, 3555, 3556, 3558, 3674, 3675, 3677, 3678, 3684, 3685, 3687, 3748, 3749, 3751, 3752, 3758, 3759, 3761, 3877, 3878, 3880, 3881, 3887, 3888, 3890, 3951, 3952, 3954, 3955, 3961, 3962, 3964, 4055, 4080, 4081, 4083, 4084, 4090, 4091, 4093, 4154, 4155, 4157, 4158, 4164, 4165, 4167, 4258, 4272, 4273, 4275, 4276, 4290, 4291, 4293, 4320, 4321, 4343, 4368, 4373, 4385, 4386, 4388, 4405, 4406, 4408, 4442, 4443, 4445, 4479, 4480, 4482, 4539, 4547, 4571, 4587, 4588, 4590, 4591, 4605, 4606, 4608, 4635, 4636, 4658, 4683, 4688]
  := ⟨Fin 2, Magma2d, by decideFin!⟩

@[equational_result]
theorem Magma2e.Facts : ∃ (G : Type) (_ : Magma G), Facts G
  [1, 11, 16, 26, 29, 31, 43, 452, 455, 481, 492, 508, 522, 543, 546, 556, 562, 572, 647, 655, 658, 684, 692, 695, 711, 725, 731, 749, 759, 765, 775, 778, 861, 887, 895, 898, 914, 928, 934, 949, 952, 962, 968, 978, 981, 1053, 1061, 1090, 1098, 1101, 1117, 1131, 1137, 1152, 1165, 1171, 1181, 1256, 1264, 1267, 1293, 1301, 1304, 1320, 1334, 1340, 1355, 1358, 1368, 1374, 1384, 1387, 1459, 1467, 1470, 1496, 1504, 1507, 1523, 1537, 1543, 1561, 1571, 1577, 1587, 1590, 1670, 1673, 1699, 1710, 1726, 1740, 1761, 1764, 1774, 1790, 1793, 1876, 1902, 1910, 1913, 1929, 1943, 1964, 1967, 1983, 1993, 1996, 2068, 2076, 2079, 2105, 2113, 2116, 2132, 2146, 2152, 2170, 2180, 2186, 2196, 2199, 2271, 2279, 2282, 2308, 2316, 2319, 2335, 2349, 2355, 2370, 2373, 2383, 2389, 2399, 2402, 2474, 2482, 2511, 2519, 2522, 2538, 2552, 2558, 2573, 2586, 2592, 2602, 2677, 2685, 2688, 2714, 2722, 2725, 2741, 2755, 2776, 2779, 2789, 2805, 2808, 2880, 2888, 2891, 2917, 2925, 2928, 2944, 2958, 2964, 2982, 2992, 2998, 3008, 3011, 3091, 3120, 3128, 3131, 3147, 3161, 3182, 3185, 3201, 3211, 3214, 3286, 3294, 3297, 3350, 3364, 3370, 3385, 3388, 3398, 3404, 3417, 3489, 3497, 3500, 3553, 3567, 3573, 3591, 3601, 3607, 3617, 3620, 3692, 3703, 3737, 3740, 3756, 3770, 3776, 3791, 3794, 3804, 3810, 3823, 3895, 3903, 3906, 3932, 3940, 3959, 3973, 3979, 4007, 4013, 4026, 4098, 4106, 4109, 4143, 4162, 4176, 4182, 4197, 4210, 4216, 4229, 4297, 4305, 4325, 4358, 4362, 4364, 4369, 4413, 4421, 4424, 4450, 4458, 4461, 4477, 4491, 4497, 4512, 4515, 4525, 4541, 4544, 4612, 4620, 4640, 4673, 4679, 4684]
  [2, 3, 9, 10, 13, 24, 25, 28, 38, 39, 47, 99, 151, 203, 255, 307, 331, 359, 407, 412, 413, 416, 420, 426, 430, 437, 439, 463, 467, 474, 476, 501, 503, 510, 615, 616, 619, 623, 629, 633, 640, 642, 666, 670, 677, 679, 704, 706, 713, 818, 819, 822, 826, 832, 836, 843, 845, 869, 873, 880, 882, 907, 909, 916, 1021, 1022, 1025, 1029, 1035, 1039, 1046, 1048, 1072, 1076, 1083, 1085, 1110, 1112, 1119, 1224, 1225, 1228, 1232, 1238, 1242, 1249, 1251, 1275, 1279, 1286, 1288, 1313, 1315, 1322, 1427, 1428, 1431, 1435, 1441, 1445, 1452, 1454, 1478, 1482, 1489, 1491, 1516, 1518, 1525, 1630, 1631, 1634, 1638, 1644, 1648, 1655, 1657, 1681, 1685, 1692, 1694, 1719, 1721, 1728, 1833, 1834, 1837, 1841, 1847, 1851, 1858, 1860, 1884, 1888, 1895, 1897, 1922, 1924, 1931, 2036, 2037, 2040, 2044, 2050, 2054, 2061, 2063, 2087, 2091, 2098, 2100, 2125, 2127, 2134, 2239, 2240, 2243, 2247, 2253, 2257, 2264, 2266, 2290, 2294, 2301, 2303, 2328, 2330, 2337, 2442, 2443, 2446, 2450, 2456, 2460, 2467, 2469, 2493, 2497, 2504, 2506, 2531, 2533, 2540, 2645, 2646, 2649, 2653, 2659, 2663, 2670, 2672, 2696, 2700, 2707, 2709, 2734, 2736, 2743, 2848, 2849, 2852, 2856, 2862, 2866, 2873, 2875, 2899, 2903, 2910, 2912, 2937, 2939, 2946, 3051, 3052, 3055, 3059, 3065, 3069, 3076, 3078, 3102, 3106, 3113, 3115, 3140, 3142, 3149, 3254, 3255, 3258, 3262, 3268, 3272, 3279, 3281, 3309, 3316, 3318, 3337, 3343, 3345, 3352, 3457, 3458, 3461, 3465, 3471, 3475, 3482, 3484, 3512, 3519, 3521, 3543, 3546, 3548, 3555, 3660, 3661, 3664, 3668, 3674, 3678, 3685, 3687, 3715, 3722, 3724, 3749, 3751, 3758, 3863, 3864, 3867, 3871, 3877, 3881, 3888, 3890, 3918, 3925, 3927, 3952, 3954, 3961, 4055, 4066, 4067, 4070, 4074, 4080, 4084, 4091, 4093, 4121, 4128, 4130, 4155, 4157, 4164, 4258, 4268, 4269, 4272, 4276, 4284, 4291, 4293, 4314, 4321, 4343, 4368, 4373, 4381, 4382, 4385, 4399, 4406, 4408, 4436, 4443, 4445, 4470, 4472, 4479, 4539, 4547, 4571, 4583, 4584, 4587, 4591, 4599, 4606, 4608, 4629, 4636, 4658, 4683, 4688]
  := ⟨Fin 2, Magma2e, by decideFin!⟩

@[equational_result]
theorem Magma2f.Facts : ∃ (G : Type) (_ : Magma G), Facts G
  [1, 3, 323, 325, 332, 333, 335, 377, 378, 384, 385, 387, 3308, 3309, 3315, 3318, 3345, 3346, 3352, 3355, 3509, 3511, 3512, 3519, 3521, 3545, 3546, 3548, 3549, 3555, 3556, 3558, 3712, 3714, 3721, 3724, 3725, 3748, 3749, 3751, 3752, 3758, 3759, 3761, 3917, 3918, 3924, 3925, 3927, 3928, 3951, 3952, 3954, 3955, 3961, 3964, 4120, 4121, 4154, 4155, 4157, 4158, 4164, 4165, 4284, 4291, 4293, 4314, 4321, 4343, 4358, 4362, 4364, 4369, 4399, 4406, 4408, 4436, 4443, 4445, 4472, 4479, 4512, 4515, 4525, 4541, 4544, 4599, 4606, 4608, 4629, 4636, 4658, 4673, 4679, 4684]
  [2, 4, 5, 9, 10, 11, 13, 14, 16, 24, 25, 26, 28, 31, 38, 39, 40, 48, 49, 50, 52, 53, 55, 56, 62, 63, 65, 66, 72, 73, 75, 100, 101, 102, 104, 105, 107, 108, 114, 115, 117, 118, 124, 125, 127, 152, 153, 154, 156, 157, 159, 160, 166, 167, 169, 170, 176, 177, 179, 204, 205, 206, 208, 209, 211, 212, 218, 219, 221, 222, 228, 229, 231, 256, 257, 258, 260, 261, 263, 264, 270, 271, 273, 274, 280, 281, 283, 308, 309, 310, 312, 313, 315, 316, 331, 336, 360, 361, 362, 364, 365, 367, 368, 374, 407, 412, 413, 414, 416, 417, 419, 420, 426, 427, 429, 430, 436, 437, 439, 440, 463, 464, 466, 467, 473, 474, 476, 477, 500, 501, 503, 504, 510, 511, 513, 615, 616, 617, 619, 620, 622, 623, 629, 630, 632, 633, 639, 640, 642, 643, 666, 667, 669, 670, 676, 677, 679, 680, 703, 704, 706, 707, 713, 714, 716, 818, 819, 820, 822, 823, 825, 826, 832, 833, 835, 836, 842, 843, 845, 846, 869, 870, 872, 873, 879, 880, 882, 883, 906, 907, 909, 910, 916, 917, 919, 1021, 1022, 1023, 1025, 1026, 1028, 1029, 1035, 1036, 1038, 1039, 1045, 1046, 1048, 1049, 1072, 1073, 1075, 1076, 1082, 1083, 1085, 1086, 1109, 1110, 1112, 1113, 1119, 1120, 1122, 1224, 1225, 1226, 1228, 1229, 1231, 1232, 1238, 1239, 1241, 1242, 1248, 1249, 1251, 1252, 1275, 1276, 1278, 1279, 1285, 1286, 1288, 1289, 1312, 1313, 1315, 1316, 1322, 1323, 1325, 1427, 1428, 1429, 1431, 1432, 1434, 1435, 1441, 1442, 1444, 1445, 1451, 1452, 1454, 1455, 1478, 1479, 1481, 1482, 1488, 1489, 1491, 1492, 1515, 1516, 1518, 1519, 1525, 1526, 1528, 1630, 1631, 1632, 1634, 1635, 1637, 1638, 1644, 1645, 1647, 1648, 1654, 1655, 1657, 1658, 1681, 1682, 1684, 1685, 1691, 1692, 1694, 1695, 1718, 1719, 1721, 1722, 1728, 1729, 1731, 1833, 1834, 1835, 1837, 1838, 1840, 1841, 1847, 1848, 1850, 1851, 1857, 1858, 1860, 1861, 1884, 1885, 1887, 1888, 1894, 1895, 1897, 1898, 1921, 1922, 1924, 1925, 1931, 1932, 1934, 2036, 2037, 2038, 2040, 2041, 2043, 2044, 2050, 2051, 2053, 2054, 2060, 2061, 2063, 2064, 2087, 2088, 2090, 2091, 2097, 2098, 2100, 2101, 2124, 2125, 2127, 2128, 2134, 2135, 2137, 2239, 2240, 2241, 2243, 2244, 2246, 2247, 2253, 2254, 2256, 2257, 2263, 2264, 2266, 2267, 2290, 2291, 2293, 2294, 2300, 2301, 2303, 2304, 2327, 2328, 2330, 2331, 2337, 2338, 2340, 2442, 2443, 2444, 2446, 2447, 2449, 2450, 2456, 2457, 2459, 2460, 2466, 2467, 2469, 2470, 2493, 2494, 2496, 2497, 2503, 2504, 2506, 2507, 2530, 2531, 2533, 2534, 2540, 2541, 2543, 2645, 2646, 2647, 2649, 2650, 2652, 2653, 2659, 2660, 2662, 2663, 2669, 2670, 2672, 2673, 2696, 2697, 2699, 2700, 2706, 2707, 2709, 2710, 2733, 2734, 2736, 2737, 2743, 2744, 2746, 2848, 2849, 2850, 2852, 2853, 2855, 2856, 2862, 2863, 2865, 2866, 2872, 2873, 2875, 2876, 2899, 2900, 2902, 2903, 2909, 2910, 2912, 2913, 2936, 2937, 2939, 2940, 2946, 2947, 2949, 3051, 3052, 3053, 3055, 3056, 3058, 3059, 3065, 3066, 3068, 3069, 3075, 3076, 3078, 3079, 3102, 3103, 3105, 3106, 3112, 3113, 3115, 3116, 3139, 3140, 3142, 3143, 3149, 3150, 3152, 3254, 3255, 3256, 3258, 3259, 3261, 3262, 3268, 3269, 3271, 3272, 3278, 3279, 3281, 3337, 3457, 3458, 3459, 3461, 3462, 3464, 3465, 3471, 3472, 3474, 3475, 3481, 3482, 3484, 3543, 3660, 3661, 3662, 3664, 3665, 3667, 3668, 3674, 3675, 3677, 3678, 3684, 3685, 3687, 3863, 3864, 3865, 3867, 3868, 3870, 3871, 3877, 3878, 3880, 3881, 3887, 3888, 3890, 4055, 4066, 4067, 4068, 4070, 4071, 4073, 4074, 4080, 4081, 4083, 4084, 4090, 4091, 4093, 4258, 4268, 4269, 4270, 4272, 4273, 4275, 4276, 4368, 4373, 4381, 4382, 4383, 4385, 4386, 4388, 4539, 4547, 4571, 4583, 4584, 4585, 4587, 4588, 4590, 4591, 4683, 4688]
  := ⟨Fin 2, Magma2f, by decideFin!⟩


/-- The Magma $(Z/6Z,+)$ -/
@[equational_result]
theorem Magma6Add.Facts : ∃ (G : Type) (_ : Magma G), Facts G
  [1, 43, 4358, 4362, 4364, 4369, 4512, 4515, 4525, 4541, 4544, 4673, 4679, 4684]
  [2, 3, 8, 23, 38, 39, 40, 47, 99, 151, 203, 255, 307, 331, 359, 407, 411, 614, 817, 1020, 1223, 1426, 1629, 1832, 2035, 2238, 2441, 2644, 2847, 3050, 3253, 3337, 3456, 3543, 3659, 3862, 4055, 4065, 4258, 4268, 4269, 4270, 4272, 4273, 4275, 4276, 4284, 4291, 4293, 4314, 4321, 4343, 4368, 4373, 4381, 4382, 4383, 4385, 4386, 4388, 4399, 4406, 4408, 4436, 4443, 4445, 4470, 4472, 4479, 4539, 4547, 4571, 4583, 4584, 4585, 4587, 4588, 4590, 4591, 4599, 4606, 4608, 4629, 4636, 4658, 4683, 4688]
  := ⟨Fin 6, ⟨(· + ·)⟩, by decideFin!⟩
