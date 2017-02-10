EESchema Schematic File Version 2
LIBS:droidrone-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:droidrone-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R 10k2
U 1 1 58082DC5
P 3550 4850
F 0 "10k2" V 3630 4850 50  0000 C CNN
F 1 "10k" V 3550 4850 50  0001 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3480 4850 50  0001 C CNN
F 3 "" H 3550 4850 50  0000 C CNN
	1    3550 4850
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR01
U 1 1 58082E6C
P 3550 4700
F 0 "#PWR01" H 3550 4550 50  0001 C CNN
F 1 "+5V" H 3550 4840 50  0000 C CNN
F 2 "" H 3550 4700 50  0000 C CNN
F 3 "" H 3550 4700 50  0000 C CNN
	1    3550 4700
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH Reset1
U 1 1 58082EDA
P 2800 5000
F 0 "Reset1" H 2950 5110 50  0000 C CNN
F 1 "SW_PUSH" H 2800 4920 50  0001 C CNN
F 2 "Buttons_Switches_ThroughHole:SW_PUSH_SMALL" H 2800 5000 50  0001 C CNN
F 3 "" H 2800 5000 50  0000 C CNN
	1    2800 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 58082F17
P 2500 5000
F 0 "#PWR02" H 2500 4750 50  0001 C CNN
F 1 "GND" H 2500 4850 50  0000 C CNN
F 2 "" H 2500 5000 50  0000 C CNN
F 3 "" H 2500 5000 50  0000 C CNN
	1    2500 5000
	1    0    0    -1  
$EndComp
$Comp
L C 0.1uF5
U 1 1 58083094
P 3550 5150
F 0 "0.1uF5" V 3400 5000 50  0000 L CNN
F 1 "0.1uF" V 3600 4900 50  0001 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 3588 5000 50  0001 C CNN
F 3 "" H 3550 5150 50  0000 C CNN
	1    3550 5150
	-1   0    0    1   
$EndComp
$Comp
L C 0.1uF4
U 1 1 58084526
P 1800 3750
F 0 "0.1uF4" H 1500 3650 50  0000 L CNN
F 1 "0.1uF" H 1825 3650 50  0001 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 1838 3600 50  0001 C CNN
F 3 "" H 1800 3750 50  0000 C CNN
	1    1800 3750
	1    0    0    -1  
$EndComp
$Comp
L Crystal Y1
U 1 1 58084B9C
P 6600 3600
F 0 "Y1" H 6600 3750 50  0000 C CNN
F 1 "Crystal" H 6600 3450 50  0000 C CNN
F 2 "Crystals:Crystal_HC49-U-3pin_Vertical" H 6600 3600 50  0001 C CNN
F 3 "" H 6600 3600 50  0000 C CNN
	1    6600 3600
	-1   0    0    1   
$EndComp
$Comp
L C 22pF1
U 1 1 58084EC3
P 6900 3400
F 0 "22pF1" H 6800 3500 50  0000 L CNN
F 1 "22pF" V 6950 3150 50  0001 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 6938 3250 50  0001 C CNN
F 3 "" H 6900 3400 50  0000 C CNN
	1    6900 3400
	0    -1   -1   0   
$EndComp
$Comp
L C 22pF2
U 1 1 58084EFA
P 6900 3650
F 0 "22pF2" H 6800 3550 50  0000 L CNN
F 1 "22pF" V 6950 3400 50  0001 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 6938 3500 50  0001 C CNN
F 3 "" H 6900 3650 50  0000 C CNN
	1    6900 3650
	0    1    1    0   
$EndComp
Text Label 6250 4700 0    60   ~ 0
RXD
Text Label 6350 4800 0    60   ~ 0
TXD
Text Label 7700 4900 0    60   ~ 0
D2
Text Label 7700 5000 0    60   ~ 0
D3(P)
Text Label 7700 5100 0    60   ~ 0
D4
Text Label 7700 5200 0    60   ~ 0
D5(P)
Text Label 7700 5300 0    60   ~ 0
D6(P)
Text Label 7700 5400 0    60   ~ 0
D7
Text Label 6550 2300 0    60   ~ 0
D8
Text Label 6550 2500 0    60   ~ 0
D10
Text Label 6550 2600 0    60   ~ 0
D11(P)
Text Label 6550 2700 0    60   ~ 0
D12
Text Label 6550 2800 0    60   ~ 0
D13
Text Label 6800 3950 0    60   ~ 0
D14/A0
Text Label 6800 4050 0    60   ~ 0
D15/A1
Text Label 6800 4150 0    60   ~ 0
D16/A2
Text Label 6800 4250 0    60   ~ 0
D17/A3
Text Label 6800 4350 0    60   ~ 0
D18/A4/SDA
Text Label 6800 4450 0    60   ~ 0
D19/A5/SCL
$Comp
L CP1 100uF10V1
U 1 1 58089FA4
P 2600 3750
F 0 "100uF10V1" H 2450 3650 50  0000 L CNN
F 1 "100uF 10V" H 2625 3650 50  0001 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D8.0mm_P2.50mm" H 2600 3750 50  0001 C CNN
F 3 "" H 2600 3750 50  0000 C CNN
	1    2600 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5808A749
P 2200 3900
F 0 "#PWR03" H 2200 3650 50  0001 C CNN
F 1 "GND" H 2200 3750 50  0000 C CNN
F 2 "" H 2200 3900 50  0000 C CNN
F 3 "" H 2200 3900 50  0000 C CNN
	1    2200 3900
	1    0    0    -1  
$EndComp
$Comp
L +6V #PWR04
U 1 1 5808A775
P 1800 3600
F 0 "#PWR04" H 1800 3450 50  0001 C CNN
F 1 "+6V" H 1800 3740 50  0000 C CNN
F 2 "" H 1800 3600 50  0000 C CNN
F 3 "" H 1800 3600 50  0000 C CNN
	1    1800 3600
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 D7
U 1 1 5808CC2B
P 10850 5600
F 0 "D7" H 10850 5800 50  0000 C CNN
F 1 "CONN_01X03" V 10950 5600 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 5600 50  0001 C CNN
F 3 "" H 10850 5600 50  0000 C CNN
	1    10850 5600
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X03 D4
U 1 1 5808D651
P 10850 5150
F 0 "D4" H 10850 5350 50  0000 C CNN
F 1 "CONN_01X03" V 10950 5150 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 5150 50  0001 C CNN
F 3 "" H 10850 5150 50  0000 C CNN
	1    10850 5150
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X03 D2
U 1 1 5808D7B4
P 10850 4700
F 0 "D2" H 10850 4900 50  0000 C CNN
F 1 "CONN_01X03" V 10950 4700 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 4700 50  0001 C CNN
F 3 "" H 10850 4700 50  0000 C CNN
	1    10850 4700
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X03 D13
U 1 1 5808D80A
P 10850 2400
F 0 "D13" H 10850 2600 50  0000 C CNN
F 1 "CONN_01X03" V 10950 2400 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 2400 50  0001 C CNN
F 3 "" H 10850 2400 50  0000 C CNN
	1    10850 2400
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X03 D8
U 1 1 580903D9
P 10850 600
F 0 "D8" H 10850 800 50  0000 C CNN
F 1 "CONN_01X03" V 10950 600 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 600 50  0001 C CNN
F 3 "" H 10850 600 50  0000 C CNN
	1    10850 600 
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X03 D9
U 1 1 5809047E
P 10850 1050
F 0 "D9" H 10850 1250 50  0000 C CNN
F 1 "CONN_01X03" V 10950 1050 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 1050 50  0001 C CNN
F 3 "" H 10850 1050 50  0000 C CNN
	1    10850 1050
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X03 D12
U 1 1 5809050A
P 10850 1950
F 0 "D12" H 10850 2150 50  0000 C CNN
F 1 "CONN_01X03" V 10950 1950 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 1950 50  0001 C CNN
F 3 "" H 10850 1950 50  0000 C CNN
	1    10850 1950
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X03 D10
U 1 1 5809067A
P 10850 1500
F 0 "D10" H 10850 1700 50  0000 C CNN
F 1 "CONN_01X03" V 10950 1500 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 1500 50  0001 C CNN
F 3 "" H 10850 1500 50  0000 C CNN
	1    10850 1500
	0    -1   -1   0   
$EndComp
$Comp
L R 10k1
U 1 1 5809AA13
P 10300 4550
F 0 "10k1" V 10380 4550 50  0000 C CNN
F 1 "10k" V 10300 4550 50  0001 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 10230 4550 50  0001 C CNN
F 3 "" H 10300 4550 50  0000 C CNN
	1    10300 4550
	-1   0    0    1   
$EndComp
$Comp
L R 10k3
U 1 1 5809AB5E
P 10500 4550
F 0 "10k3" V 10580 4550 50  0000 C CNN
F 1 "10k" V 10500 4550 50  0001 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 10430 4550 50  0001 C CNN
F 3 "" H 10500 4550 50  0000 C CNN
	1    10500 4550
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR05
U 1 1 5809C131
P 10300 4700
F 0 "#PWR05" H 10300 4450 50  0001 C CNN
F 1 "GND" H 10300 4550 50  0000 C CNN
F 2 "" H 10300 4700 50  0000 C CNN
F 3 "" H 10300 4700 50  0000 C CNN
	1    10300 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 580D8735
P 10950 5800
F 0 "#PWR06" H 10950 5550 50  0001 C CNN
F 1 "GND" H 10950 5650 50  0000 C CNN
F 2 "" H 10950 5800 50  0000 C CNN
F 3 "" H 10950 5800 50  0000 C CNN
	1    10950 5800
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR07
U 1 1 580D87E5
P 10950 5350
F 0 "#PWR07" H 10950 5100 50  0001 C CNN
F 1 "GND" H 10950 5200 50  0000 C CNN
F 2 "" H 10950 5350 50  0000 C CNN
F 3 "" H 10950 5350 50  0000 C CNN
	1    10950 5350
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR08
U 1 1 580D8CAA
P 10950 4900
F 0 "#PWR08" H 10950 4650 50  0001 C CNN
F 1 "GND" H 10950 4750 50  0000 C CNN
F 2 "" H 10950 4900 50  0000 C CNN
F 3 "" H 10950 4900 50  0000 C CNN
	1    10950 4900
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR09
U 1 1 580D8D5A
P 10950 2600
F 0 "#PWR09" H 10950 2350 50  0001 C CNN
F 1 "GND" H 10950 2450 50  0000 C CNN
F 2 "" H 10950 2600 50  0000 C CNN
F 3 "" H 10950 2600 50  0000 C CNN
	1    10950 2600
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR010
U 1 1 580D8E0A
P 10950 2150
F 0 "#PWR010" H 10950 1900 50  0001 C CNN
F 1 "GND" H 10950 2000 50  0000 C CNN
F 2 "" H 10950 2150 50  0000 C CNN
F 3 "" H 10950 2150 50  0000 C CNN
	1    10950 2150
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR011
U 1 1 580D92CF
P 10950 1700
F 0 "#PWR011" H 10950 1450 50  0001 C CNN
F 1 "GND" H 10950 1550 50  0000 C CNN
F 2 "" H 10950 1700 50  0000 C CNN
F 3 "" H 10950 1700 50  0000 C CNN
	1    10950 1700
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR012
U 1 1 580D95DC
P 10950 1250
F 0 "#PWR012" H 10950 1000 50  0001 C CNN
F 1 "GND" H 10950 1100 50  0000 C CNN
F 2 "" H 10950 1250 50  0000 C CNN
F 3 "" H 10950 1250 50  0000 C CNN
	1    10950 1250
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR013
U 1 1 580D968C
P 10950 800
F 0 "#PWR013" H 10950 550 50  0001 C CNN
F 1 "GND" H 10950 650 50  0000 C CNN
F 2 "" H 10950 800 50  0000 C CNN
F 3 "" H 10950 800 50  0000 C CNN
	1    10950 800 
	0    -1   1    0   
$EndComp
$Comp
L LM2931Z-3.3/5.0 U4
U 1 1 5809825A
P 2100 5600
F 0 "U4" H 2100 5900 50  0000 C CNN
F 1 "LP2950L-3.3V" H 2100 5800 50  0000 C CNN
F 2 "lib:LP2950" H 2100 5700 50  0001 C CIN
F 3 "" H 2100 5600 50  0000 C CNN
	1    2100 5600
	1    0    0    -1  
$EndComp
$Comp
L C 0.1uF1
U 1 1 5809982B
P 1700 5700
F 0 "0.1uF1" H 1600 5600 50  0000 L CNN
F 1 "0.1uF" H 1725 5600 50  0001 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 1738 5550 50  0001 C CNN
F 3 "" H 1700 5700 50  0000 C CNN
	1    1700 5700
	1    0    0    -1  
$EndComp
$Comp
L CP1 47uF10V1
U 1 1 58099910
P 2500 5700
F 0 "47uF10V1" H 2525 5800 50  0000 L CNN
F 1 "47uF 10V" H 2525 5600 50  0001 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D8.0mm_P2.50mm" H 2500 5700 50  0001 C CNN
F 3 "" H 2500 5700 50  0000 C CNN
	1    2500 5700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5809AAC1
P 2100 5850
F 0 "#PWR014" H 2100 5600 50  0001 C CNN
F 1 "GND" H 2100 5700 50  0000 C CNN
F 2 "" H 2100 5850 50  0000 C CNN
F 3 "" H 2100 5850 50  0000 C CNN
	1    2100 5850
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR015
U 1 1 5809ABBD
P 2500 5550
F 0 "#PWR015" H 2500 5400 50  0001 C CNN
F 1 "+3.3V" H 2500 5690 50  0000 C CNN
F 2 "" H 2500 5550 50  0000 C CNN
F 3 "" H 2500 5550 50  0000 C CNN
	1    2500 5550
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 6V-IN1
U 1 1 5809CFAC
P 1600 3100
F 0 "6V-IN1" H 1600 3250 50  0000 C CNN
F 1 "CONN_01X02" V 1700 3100 50  0001 C CNN
F 2 "lib:TB-2pin" H 1600 3100 50  0001 C CNN
F 3 "" H 1600 3100 50  0000 C CNN
	1    1600 3100
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR016
U 1 1 580B129C
P 1700 5550
F 0 "#PWR016" H 1700 5400 50  0001 C CNN
F 1 "+5V" H 1700 5690 50  0000 C CNN
F 2 "" H 1700 5550 50  0000 C CNN
F 3 "" H 1700 5550 50  0000 C CNN
	1    1700 5550
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR017
U 1 1 580C6103
P 10850 2600
F 0 "#PWR017" H 10850 2450 50  0001 C CNN
F 1 "+5VA" H 10850 2740 50  0000 C CNN
F 2 "" H 10850 2600 50  0000 C CNN
F 3 "" H 10850 2600 50  0000 C CNN
	1    10850 2600
	-1   0    0    1   
$EndComp
$Comp
L +5VA #PWR018
U 1 1 580C7E0B
P 10850 4900
F 0 "#PWR018" H 10850 4750 50  0001 C CNN
F 1 "+5VA" H 10850 5040 50  0000 C CNN
F 2 "" H 10850 4900 50  0000 C CNN
F 3 "" H 10850 4900 50  0000 C CNN
	1    10850 4900
	-1   0    0    1   
$EndComp
$Comp
L +5VA #PWR019
U 1 1 580C863F
P 10850 5350
F 0 "#PWR019" H 10850 5200 50  0001 C CNN
F 1 "+5VA" H 10850 5490 50  0000 C CNN
F 2 "" H 10850 5350 50  0000 C CNN
F 3 "" H 10850 5350 50  0000 C CNN
	1    10850 5350
	-1   0    0    1   
$EndComp
$Comp
L +5VA #PWR020
U 1 1 580C8C4E
P 10850 5800
F 0 "#PWR020" H 10850 5650 50  0001 C CNN
F 1 "+5VA" H 10850 5940 50  0000 C CNN
F 2 "" H 10850 5800 50  0000 C CNN
F 3 "" H 10850 5800 50  0000 C CNN
	1    10850 5800
	-1   0    0    1   
$EndComp
$Comp
L RN42XV RN42XV1
U 1 1 580D711D
P 4700 6700
F 0 "RN42XV1" H 4700 7050 60  0000 C CNN
F 1 "RN42XV" H 4700 7050 60  0001 C CNN
F 2 "lib:RN42XV" H 4700 6700 60  0001 C CNN
F 3 "" H 4700 6700 60  0000 C CNN
	1    4700 6700
	0    1    1    0   
$EndComp
$Comp
L GND #PWR021
U 1 1 580D7A7E
P 4050 6150
F 0 "#PWR021" H 4050 5900 50  0001 C CNN
F 1 "GND" H 4050 6000 50  0000 C CNN
F 2 "" H 4050 6150 50  0000 C CNN
F 3 "" H 4050 6150 50  0000 C CNN
	1    4050 6150
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR022
U 1 1 580D8010
P 4950 6150
F 0 "#PWR022" H 4950 6000 50  0001 C CNN
F 1 "+3.3V" H 4950 6290 50  0000 C CNN
F 2 "" H 4950 6150 50  0000 C CNN
F 3 "" H 4950 6150 50  0000 C CNN
	1    4950 6150
	0    1    1    0   
$EndComp
$Comp
L R 2.2k1
U 1 1 580DB0AD
P 5300 5950
F 0 "2.2k1" V 5380 5950 50  0000 C CNN
F 1 "2.2k" V 5300 5950 50  0001 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5230 5950 50  0001 C CNN
F 3 "" H 5300 5950 50  0000 C CNN
	1    5300 5950
	0    1    1    0   
$EndComp
$Comp
L R 3.3k1
U 1 1 580DB25E
P 5300 5800
F 0 "3.3k1" V 5380 5800 50  0000 C CNN
F 1 "3.3k" V 5300 5800 50  0001 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5230 5800 50  0001 C CNN
F 3 "" H 5300 5800 50  0000 C CNN
	1    5300 5800
	0    1    1    0   
$EndComp
$Comp
L GND #PWR023
U 1 1 580DB831
P 5450 5800
F 0 "#PWR023" H 5450 5550 50  0001 C CNN
F 1 "GND" H 5450 5650 50  0000 C CNN
F 2 "" H 5450 5800 50  0000 C CNN
F 3 "" H 5450 5800 50  0000 C CNN
	1    5450 5800
	0    -1   -1   0   
$EndComp
$Comp
L R 1k3
U 1 1 580E2893
P 5550 6050
F 0 "1k3" V 5630 6050 50  0000 C CNN
F 1 "1k" V 5550 6050 50  0001 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5480 6050 50  0001 C CNN
F 3 "" H 5550 6050 50  0000 C CNN
	1    5550 6050
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR024
U 1 1 580E5851
P 6150 6400
F 0 "#PWR024" H 6150 6250 50  0001 C CNN
F 1 "+5V" H 6150 6540 50  0000 C CNN
F 2 "" H 6150 6400 50  0000 C CNN
F 3 "" H 6150 6400 50  0000 C CNN
	1    6150 6400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 580E58ED
P 5950 6400
F 0 "#PWR025" H 5950 6150 50  0001 C CNN
F 1 "GND" H 5950 6250 50  0000 C CNN
F 2 "" H 5950 6400 50  0000 C CNN
F 3 "" H 5950 6400 50  0000 C CNN
	1    5950 6400
	1    0    0    1   
$EndComp
NoConn ~ 4650 6150
NoConn ~ 4550 6150
NoConn ~ 4450 6150
NoConn ~ 4350 6150
NoConn ~ 4250 6150
NoConn ~ 4150 6150
NoConn ~ 4050 7200
NoConn ~ 4250 7200
NoConn ~ 4350 7200
NoConn ~ 4450 7200
NoConn ~ 4750 7200
NoConn ~ 4850 7200
NoConn ~ 4950 7200
NoConn ~ 4650 7200
$Comp
L RN4020 RN4020
U 1 1 580E898B
P 2350 1500
F 0 "RN4020" H 2350 2000 60  0000 C CNN
F 1 "RN4020" H 2350 2000 60  0001 C CNN
F 2 "lib:RN2040" H 2350 1500 60  0001 C CNN
F 3 "" H 2350 1500 60  0000 C CNN
	1    2350 1500
	0    1    1    0   
$EndComp
$Comp
L R 1k1
U 1 1 580EB00D
P 1200 1250
F 0 "1k1" V 1280 1250 50  0000 C CNN
F 1 "1k" V 1200 1250 50  0001 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 1130 1250 50  0001 C CNN
F 3 "" H 1200 1250 50  0000 C CNN
	1    1200 1250
	0    1    1    0   
$EndComp
$Comp
L LED LED1
U 1 1 580EC3D9
P 850 1250
F 0 "LED1" H 850 1350 50  0000 C CNN
F 1 "LED" H 650 1350 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 850 1250 50  0001 C CNN
F 3 "" H 850 1250 50  0000 C CNN
	1    850  1250
	1    0    0    -1  
$EndComp
$Comp
L LED LED2
U 1 1 580EC4D0
P 850 1450
F 0 "LED2" H 850 1550 50  0000 C CNN
F 1 "LED" H 650 1550 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 850 1450 50  0001 C CNN
F 3 "" H 850 1450 50  0000 C CNN
	1    850  1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 580EC7D8
P 650 1250
F 0 "#PWR032" H 650 1000 50  0001 C CNN
F 1 "GND" H 650 1100 50  0000 C CNN
F 2 "" H 650 1250 50  0000 C CNN
F 3 "" H 650 1250 50  0000 C CNN
	1    650  1250
	0    1    1    0   
$EndComp
$Comp
L GND #PWR033
U 1 1 580EC8C5
P 650 1450
F 0 "#PWR033" H 650 1200 50  0001 C CNN
F 1 "GND" H 650 1300 50  0000 C CNN
F 2 "" H 650 1450 50  0000 C CNN
F 3 "" H 650 1450 50  0000 C CNN
	1    650  1450
	0    1    1    0   
$EndComp
NoConn ~ 2650 850 
NoConn ~ 2550 850 
NoConn ~ 2450 850 
NoConn ~ 1500 1550
NoConn ~ 1500 1650
NoConn ~ 2050 2150
NoConn ~ 2150 2150
NoConn ~ 2350 2150
$Comp
L GND #PWR034
U 1 1 581284CF
P 1800 3050
F 0 "#PWR034" H 1800 2800 50  0001 C CNN
F 1 "GND" H 1800 2900 50  0000 C CNN
F 2 "" H 1800 3050 50  0000 C CNN
F 3 "" H 1800 3050 50  0000 C CNN
	1    1800 3050
	-1   0    0    1   
$EndComp
$Comp
L C 0.1uF6
U 1 1 58143720
P 3500 3050
F 0 "0.1uF6" H 3525 3150 50  0000 L CNN
F 1 "0.1uF" H 3525 2950 50  0001 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 3538 2900 50  0001 C CNN
F 3 "" H 3500 3050 50  0000 C CNN
	1    3500 3050
	1    0    0    1   
$EndComp
$Comp
L GND #PWR035
U 1 1 581437FA
P 3500 2900
F 0 "#PWR035" H 3500 2650 50  0001 C CNN
F 1 "GND" H 3500 2750 50  0000 C CNN
F 2 "" H 3500 2900 50  0000 C CNN
F 3 "" H 3500 2900 50  0000 C CNN
	1    3500 2900
	-1   0    0    1   
$EndComp
$Comp
L +5VA #PWR036
U 1 1 5815605D
P 1500 4600
F 0 "#PWR036" H 1500 4450 50  0001 C CNN
F 1 "+5VA" H 1500 4740 50  0000 C CNN
F 2 "" H 1500 4600 50  0000 C CNN
F 3 "" H 1500 4600 50  0000 C CNN
	1    1500 4600
	1    0    0    -1  
$EndComp
$Comp
L JUMPER No-BEC1
U 1 1 581577EE
P 1200 4600
F 0 "No-BEC1" H 1200 4750 50  0000 C CNN
F 1 "JUMPER" H 1200 4520 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1200 4600 50  0001 C CNN
F 3 "" H 1200 4600 50  0000 C CNN
	1    1200 4600
	1    0    0    -1  
$EndComp
$Comp
L +6V #PWR037
U 1 1 5815B8AF
P 1800 3150
F 0 "#PWR037" H 1800 3000 50  0001 C CNN
F 1 "+6V" H 1800 3290 50  0000 C CNN
F 2 "" H 1800 3150 50  0000 C CNN
F 3 "" H 1800 3150 50  0000 C CNN
	1    1800 3150
	-1   0    0    1   
$EndComp
$Comp
L R 1k5
U 1 1 5816C754
P 9700 2950
F 0 "1k5" V 9780 2950 50  0000 C CNN
F 1 "1k" V 9700 2950 50  0001 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9630 2950 50  0001 C CNN
F 3 "" H 9700 2950 50  0000 C CNN
	1    9700 2950
	-1   0    0    1   
$EndComp
$Comp
L LED LED4
U 1 1 5816D6A2
P 9700 3300
F 0 "LED4" H 9700 3400 50  0000 C CNN
F 1 "LED" H 9700 3500 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 9700 3300 50  0001 C CNN
F 3 "" H 9700 3300 50  0000 C CNN
	1    9700 3300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR038
U 1 1 5816E484
P 9700 3500
F 0 "#PWR038" H 9700 3250 50  0001 C CNN
F 1 "GND" H 9700 3350 50  0000 C CNN
F 2 "" H 9700 3500 50  0000 C CNN
F 3 "" H 9700 3500 50  0000 C CNN
	1    9700 3500
	-1   0    0    -1  
$EndComp
$Comp
L R 1k4
U 1 1 5816FEA5
P 2950 3750
F 0 "1k4" V 3030 3750 50  0000 C CNN
F 1 "1k" V 2950 3750 50  0001 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2880 3750 50  0001 C CNN
F 3 "" H 2950 3750 50  0000 C CNN
	1    2950 3750
	-1   0    0    1   
$EndComp
$Comp
L LED LED3
U 1 1 581709E8
P 2950 4100
F 0 "LED3" H 2950 4200 50  0000 C CNN
F 1 "LED" H 2750 4200 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 2950 4100 50  0001 C CNN
F 3 "" H 2950 4100 50  0000 C CNN
	1    2950 4100
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR039
U 1 1 58170F2A
P 2950 4300
F 0 "#PWR039" H 2950 4050 50  0001 C CNN
F 1 "GND" H 2950 4150 50  0000 C CNN
F 2 "" H 2950 4300 50  0000 C CNN
F 3 "" H 2950 4300 50  0000 C CNN
	1    2950 4300
	1    0    0    -1  
$EndComp
$Comp
L +6V #PWR040
U 1 1 58114310
P 10500 4700
F 0 "#PWR040" H 10500 4550 50  0001 C CNN
F 1 "+6V" H 10500 4840 50  0000 C CNN
F 2 "" H 10500 4700 50  0000 C CNN
F 3 "" H 10500 4700 50  0000 C CNN
	1    10500 4700
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR041
U 1 1 5812B03D
P 2600 3600
F 0 "#PWR041" H 2600 3450 50  0001 C CNN
F 1 "+5V" H 2600 3740 50  0000 C CNN
F 2 "" H 2600 3600 50  0000 C CNN
F 3 "" H 2600 3600 50  0000 C CNN
	1    2600 3600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR042
U 1 1 5812C7B3
P 900 4600
F 0 "#PWR042" H 900 4450 50  0001 C CNN
F 1 "+5V" H 900 4740 50  0000 C CNN
F 2 "" H 900 4600 50  0000 C CNN
F 3 "" H 900 4600 50  0000 C CNN
	1    900  4600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR043
U 1 1 5813ACA1
P 2350 6000
F 0 "#PWR043" H 2350 5750 50  0001 C CNN
F 1 "GND" H 2350 5850 50  0000 C CNN
F 2 "" H 2350 6000 50  0000 C CNN
F 3 "" H 2350 6000 50  0000 C CNN
	1    2350 6000
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X06 P2
U 1 1 5879B282
P 6200 6600
F 0 "P2" H 6200 6950 50  0000 C CNN
F 1 "CONN_01X06" V 6300 6600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 6200 6600 50  0001 C CNN
F 3 "" H 6200 6600 50  0000 C CNN
	1    6200 6600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR044
U 1 1 58787B60
P 7450 3450
F 0 "#PWR044" H 7450 3200 50  0001 C CNN
F 1 "GND" H 7450 3300 50  0000 C CNN
F 2 "" H 7450 3450 50  0000 C CNN
F 3 "" H 7450 3450 50  0000 C CNN
	1    7450 3450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR045
U 1 1 58788733
P 7450 3350
F 0 "#PWR045" H 7450 3200 50  0001 C CNN
F 1 "+5V" H 7450 3490 50  0000 C CNN
F 2 "" H 7450 3350 50  0000 C CNN
F 3 "" H 7450 3350 50  0000 C CNN
	1    7450 3350
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR046
U 1 1 5878EA1A
P 7050 3650
F 0 "#PWR046" H 7050 3400 50  0001 C CNN
F 1 "GND" H 7050 3500 50  0000 C CNN
F 2 "" H 7050 3650 50  0000 C CNN
F 3 "" H 7050 3650 50  0000 C CNN
	1    7050 3650
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P6
U 1 1 5879A6E6
P 9250 3450
F 0 "P6" H 9250 3800 50  0000 C CNN
F 1 "CONN_01X06" V 9350 3450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 9250 3450 50  0001 C CNN
F 3 "" H 9250 3450 50  0000 C CNN
	1    9250 3450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR047
U 1 1 5879FC95
P 9050 3600
F 0 "#PWR047" H 9050 3450 50  0001 C CNN
F 1 "+5V" H 9050 3740 50  0000 C CNN
F 2 "" H 9050 3600 50  0000 C CNN
F 3 "" H 9050 3600 50  0000 C CNN
	1    9050 3600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR048
U 1 1 587A0425
P 9050 3700
F 0 "#PWR048" H 9050 3450 50  0001 C CNN
F 1 "GND" H 9050 3550 50  0000 C CNN
F 2 "" H 9050 3700 50  0000 C CNN
F 3 "" H 9050 3700 50  0000 C CNN
	1    9050 3700
	-1   0    0    -1  
$EndComp
$Comp
L +5VA #PWR049
U 1 1 587ACB99
P 10850 2150
F 0 "#PWR049" H 10850 2000 50  0001 C CNN
F 1 "+5VA" H 10850 2290 50  0000 C CNN
F 2 "" H 10850 2150 50  0000 C CNN
F 3 "" H 10850 2150 50  0000 C CNN
	1    10850 2150
	-1   0    0    1   
$EndComp
$Comp
L +5VA #PWR050
U 1 1 587AD236
P 10850 1700
F 0 "#PWR050" H 10850 1550 50  0001 C CNN
F 1 "+5VA" H 10850 1840 50  0000 C CNN
F 2 "" H 10850 1700 50  0000 C CNN
F 3 "" H 10850 1700 50  0000 C CNN
	1    10850 1700
	-1   0    0    1   
$EndComp
$Comp
L +5VA #PWR051
U 1 1 587AD2E9
P 10850 1250
F 0 "#PWR051" H 10850 1100 50  0001 C CNN
F 1 "+5VA" H 10850 1390 50  0000 C CNN
F 2 "" H 10850 1250 50  0000 C CNN
F 3 "" H 10850 1250 50  0000 C CNN
	1    10850 1250
	-1   0    0    1   
$EndComp
$Comp
L +5VA #PWR052
U 1 1 587AD754
P 10850 800
F 0 "#PWR052" H 10850 650 50  0001 C CNN
F 1 "+5VA" H 10850 940 50  0000 C CNN
F 2 "" H 10850 800 50  0000 C CNN
F 3 "" H 10850 800 50  0000 C CNN
	1    10850 800 
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 D14
U 1 1 587B62DB
P 10850 2850
F 0 "D14" H 10850 3050 50  0000 C CNN
F 1 "CONN_01X03" V 10950 2850 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 2850 50  0001 C CNN
F 3 "" H 10850 2850 50  0000 C CNN
	1    10850 2850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR053
U 1 1 587B62E1
P 10950 3050
F 0 "#PWR053" H 10950 2800 50  0001 C CNN
F 1 "GND" H 10950 2900 50  0000 C CNN
F 2 "" H 10950 3050 50  0000 C CNN
F 3 "" H 10950 3050 50  0000 C CNN
	1    10950 3050
	0    -1   1    0   
$EndComp
$Comp
L +5V #PWR054
U 1 1 587B6448
P 10850 3050
F 0 "#PWR054" H 10850 2900 50  0001 C CNN
F 1 "+5V" H 10850 3190 50  0000 C CNN
F 2 "" H 10850 3050 50  0000 C CNN
F 3 "" H 10850 3050 50  0000 C CNN
	1    10850 3050
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 D15
U 1 1 587B6B48
P 10850 3300
F 0 "D15" H 10850 3500 50  0000 C CNN
F 1 "CONN_01X03" V 10950 3300 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 3300 50  0001 C CNN
F 3 "" H 10850 3300 50  0000 C CNN
	1    10850 3300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR055
U 1 1 587B6B4E
P 10950 3500
F 0 "#PWR055" H 10950 3250 50  0001 C CNN
F 1 "GND" H 10950 3350 50  0000 C CNN
F 2 "" H 10950 3500 50  0000 C CNN
F 3 "" H 10950 3500 50  0000 C CNN
	1    10950 3500
	0    -1   1    0   
$EndComp
$Comp
L +5V #PWR056
U 1 1 587B6BF6
P 10850 3500
F 0 "#PWR056" H 10850 3350 50  0001 C CNN
F 1 "+5V" H 10850 3640 50  0000 C CNN
F 2 "" H 10850 3500 50  0000 C CNN
F 3 "" H 10850 3500 50  0000 C CNN
	1    10850 3500
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 D16
U 1 1 587B6BFC
P 10850 3750
F 0 "D16" H 10850 3950 50  0000 C CNN
F 1 "CONN_01X03" V 10950 3750 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 3750 50  0001 C CNN
F 3 "" H 10850 3750 50  0000 C CNN
	1    10850 3750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR057
U 1 1 587B6C02
P 10950 3950
F 0 "#PWR057" H 10950 3700 50  0001 C CNN
F 1 "GND" H 10950 3800 50  0000 C CNN
F 2 "" H 10950 3950 50  0000 C CNN
F 3 "" H 10950 3950 50  0000 C CNN
	1    10950 3950
	0    -1   1    0   
$EndComp
$Comp
L +5V #PWR058
U 1 1 587B6C09
P 10850 3950
F 0 "#PWR058" H 10850 3800 50  0001 C CNN
F 1 "+5V" H 10850 4090 50  0000 C CNN
F 2 "" H 10850 3950 50  0000 C CNN
F 3 "" H 10850 3950 50  0000 C CNN
	1    10850 3950
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR059
U 1 1 587BD12B
P 3750 5450
F 0 "#PWR059" H 3750 5200 50  0001 C CNN
F 1 "GND" H 3750 5300 50  0000 C CNN
F 2 "" H 3750 5450 50  0000 C CNN
F 3 "" H 3750 5450 50  0000 C CNN
	1    3750 5450
	1    0    0    -1  
$EndComp
NoConn ~ 2550 2150
NoConn ~ 2450 2150
NoConn ~ 2250 2150
$Comp
L 7805-RESCUE-droidrone U1
U 1 1 5888277B
P 2200 3650
F 0 "U1" H 2350 3454 50  0000 C CNN
F 1 "TA4805S" H 2200 3850 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-220_Neutral123_Vertical_LargePads" H 2200 3650 50  0001 C CNN
F 3 "http://akizukidenshi.com/catalog/g/gI-00537/" H 2200 3650 50  0001 C CNN
	1    2200 3650
	1    0    0    -1  
$EndComp
$Comp
L R 1k2
U 1 1 580EB146
P 1200 1450
F 0 "1k2" V 1280 1450 50  0000 C CNN
F 1 "1k" V 1200 1450 50  0001 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 1130 1450 50  0001 C CNN
F 3 "" H 1200 1450 50  0000 C CNN
	1    1200 1450
	0    1    1    0   
$EndComp
NoConn ~ 1500 1350
$Comp
L USB_A P1
U 1 1 5889001F
P 950 3300
F 0 "P1" H 1150 3100 50  0000 C CNN
F 1 "USB_A" H 900 3500 50  0000 C CNN
F 2 "Connect:USB_A" V 900 3200 50  0001 C CNN
F 3 "" V 900 3200 50  0000 C CNN
	1    950  3300
	1    0    0    -1  
$EndComp
NoConn ~ 850  3600
NoConn ~ 950  3600
$Comp
L +5V #PWR062
U 1 1 5889070E
P 750 3600
F 0 "#PWR062" H 750 3450 50  0001 C CNN
F 1 "+5V" H 750 3740 50  0000 C CNN
F 2 "" H 750 3600 50  0000 C CNN
F 3 "" H 750 3600 50  0000 C CNN
	1    750  3600
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR063
U 1 1 58890B52
P 1050 3600
F 0 "#PWR063" H 1050 3350 50  0001 C CNN
F 1 "GND" H 1050 3450 50  0000 C CNN
F 2 "" H 1050 3600 50  0000 C CNN
F 3 "" H 1050 3600 50  0000 C CNN
	1    1050 3600
	1    0    0    -1  
$EndComp
NoConn ~ 1250 3200
$Comp
L CONN_01X04 P5
U 1 1 589B1DA7
P 8250 4550
F 0 "P5" H 8250 4800 50  0000 C CNN
F 1 "CONN_01X04" V 8350 4550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.00mm" H 8250 4550 50  0001 C CNN
F 3 "" H 8250 4550 50  0000 C CNN
	1    8250 4550
	1    0    0    -1  
$EndComp
$Comp
L R 10k4
U 1 1 589B66D2
P 10350 3800
F 0 "10k4" V 10430 3800 50  0000 C CNN
F 1 "10k" V 10350 3800 50  0001 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 10280 3800 50  0001 C CNN
F 3 "" H 10350 3800 50  0000 C CNN
	1    10350 3800
	0    1    1    0   
$EndComp
Text Label 6550 2400 0    60   ~ 0
D9
$Comp
L CONN_01X03 D17
U 1 1 589BC62B
P 10850 4200
F 0 "D17" H 10850 4400 50  0000 C CNN
F 1 "CONN_01X03" V 10950 4200 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 10850 4200 50  0001 C CNN
F 3 "" H 10850 4200 50  0000 C CNN
	1    10850 4200
	0    -1   -1   0   
$EndComp
$Comp
L +5VA #PWR064
U 1 1 589C6194
P 10850 4400
F 0 "#PWR064" H 10850 4250 50  0001 C CNN
F 1 "+5VA" H 10850 4540 50  0000 C CNN
F 2 "" H 10850 4400 50  0000 C CNN
F 3 "" H 10850 4400 50  0000 C CNN
	1    10850 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	5650 4700 6250 4700
Wire Wire Line
	5650 4800 6350 4800
Wire Wire Line
	6350 4800 6350 6400
Wire Wire Line
	5650 4900 10750 4900
Wire Wire Line
	8500 5000 5650 5000
Wire Wire Line
	5650 5100 10350 5100
Wire Wire Line
	5650 5200 8600 5200
Wire Wire Line
	5650 5300 8700 5300
Wire Wire Line
	5650 4450 7600 4450
Wire Wire Line
	5650 4350 7700 4350
Wire Wire Line
	5650 4250 10300 4250
Wire Wire Line
	5650 4150 10050 4150
Wire Wire Line
	5650 4050 9950 4050
Wire Wire Line
	5650 3950 9850 3950
Wire Wire Line
	6150 3400 5650 3400
Wire Wire Line
	6250 3500 5650 3500
Wire Wire Line
	6350 3600 5650 3600
Wire Wire Line
	2950 3200 3750 3200
Wire Wire Line
	3750 3200 3750 3100
Wire Wire Line
	3750 5350 3750 5350
Wire Wire Line
	3750 5350 3750 5450
Connection ~ 3750 5450
Wire Wire Line
	6750 3800 5650 3800
Connection ~ 2600 3600
Wire Wire Line
	1800 3900 2600 3900
Connection ~ 2200 3900
Wire Wire Line
	10350 5350 10750 5350
Wire Wire Line
	10250 5800 10750 5800
Wire Wire Line
	10050 2500 10050 1700
Wire Wire Line
	10050 1700 10750 1700
Wire Wire Line
	9950 2400 9950 1250
Wire Wire Line
	10750 800  9850 800 
Wire Wire Line
	9850 800  9850 2300
Wire Wire Line
	9950 1250 10750 1250
Wire Wire Line
	1700 5850 2500 5850
Connection ~ 2100 5850
Connection ~ 3500 3200
Wire Wire Line
	10750 2150 10150 2150
Wire Wire Line
	10150 2150 10150 2700
Wire Wire Line
	4850 6050 4850 6150
Wire Wire Line
	5450 5950 6350 5950
Wire Wire Line
	4750 5800 4750 6150
Wire Wire Line
	4850 6050 5400 6050
Wire Wire Line
	4550 7200 4550 7350
Wire Wire Line
	4550 7350 4150 7350
Wire Wire Line
	4150 7350 4150 7200
Wire Wire Line
	4750 5800 5150 5800
Connection ~ 1800 3600
Connection ~ 2950 3600
Wire Wire Line
	2950 3600 2600 3600
Wire Wire Line
	2950 3200 2950 3600
Wire Wire Line
	5150 5800 5150 5950
Connection ~ 5150 5800
Connection ~ 6350 5950
Wire Wire Line
	6250 4700 6250 6400
Wire Wire Line
	6450 5650 6450 6400
Wire Wire Line
	6050 6400 5950 6400
Connection ~ 5950 6400
Connection ~ 6250 6050
Wire Wire Line
	6250 6050 5700 6050
Wire Wire Line
	6150 2600 6150 3400
Wire Wire Line
	6250 2700 6250 3500
Wire Wire Line
	6750 3600 6750 3800
Wire Wire Line
	6750 3400 6450 3400
Wire Wire Line
	7050 3400 7050 3650
Wire Wire Line
	5650 3100 5650 2300
Wire Wire Line
	5650 2300 9850 2300
Wire Wire Line
	5650 3200 5750 3200
Wire Wire Line
	5750 3200 5750 2400
Wire Wire Line
	5750 2400 9950 2400
Wire Wire Line
	5650 3300 5850 3300
Wire Wire Line
	5850 3300 5850 2500
Wire Wire Line
	5850 2500 10050 2500
Wire Wire Line
	6150 2600 8700 2600
Wire Wire Line
	10150 2700 6250 2700
Wire Wire Line
	6350 2800 10300 2800
Wire Wire Line
	10750 2600 10300 2600
Wire Wire Line
	10300 2600 10300 2800
Wire Wire Line
	8700 2600 8700 3200
Wire Wire Line
	8700 3200 9050 3200
Wire Wire Line
	8500 3300 9050 3300
Wire Wire Line
	8600 3400 9050 3400
Wire Wire Line
	8700 5300 8700 3500
Wire Wire Line
	8700 3500 9050 3500
Wire Wire Line
	8500 3300 8500 5000
Wire Wire Line
	9850 3050 10750 3050
Wire Wire Line
	9950 3500 10750 3500
Wire Wire Line
	10050 3950 10750 3950
Wire Wire Line
	9850 3950 9850 3050
Wire Wire Line
	9950 4050 9950 3500
Wire Wire Line
	10050 4150 10050 3950
Connection ~ 3750 3200
Connection ~ 2500 5550
Connection ~ 1700 5550
Wire Wire Line
	10250 5800 10250 5400
Wire Wire Line
	10250 5400 5650 5400
Wire Wire Line
	8600 5200 8600 3400
Wire Wire Line
	10500 3800 10500 3950
Connection ~ 10500 3950
$Comp
L +5VA #PWR065
U 1 1 589D0058
P 10200 3800
F 0 "#PWR065" H 10200 3650 50  0001 C CNN
F 1 "+5VA" H 10200 3940 50  0000 C CNN
F 2 "" H 10200 3800 50  0000 C CNN
F 3 "" H 10200 3800 50  0000 C CNN
	1    10200 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10350 5100 10350 5350
Wire Wire Line
	10300 4400 10750 4400
Wire Wire Line
	10300 4250 10300 4400
Connection ~ 10500 4400
Connection ~ 10300 4400
$Comp
L GND #PWR066
U 1 1 589D46B2
P 10950 4400
F 0 "#PWR066" H 10950 4150 50  0001 C CNN
F 1 "GND" H 10950 4250 50  0000 C CNN
F 2 "" H 10950 4400 50  0000 C CNN
F 3 "" H 10950 4400 50  0000 C CNN
	1    10950 4400
	0    -1   1    0   
$EndComp
Connection ~ 9700 2800
Wire Wire Line
	7700 4350 7700 4600
Wire Wire Line
	7700 4600 8050 4600
Wire Wire Line
	7600 4450 7600 4700
Wire Wire Line
	7600 4700 8050 4700
$Comp
L +5V #PWR067
U 1 1 589DDA4F
P 8050 4500
F 0 "#PWR067" H 8050 4350 50  0001 C CNN
F 1 "+5V" H 8050 4640 50  0000 C CNN
F 2 "" H 8050 4500 50  0000 C CNN
F 3 "" H 8050 4500 50  0000 C CNN
	1    8050 4500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR068
U 1 1 589DDAF0
P 7900 4400
F 0 "#PWR068" H 7900 4150 50  0001 C CNN
F 1 "GND" H 7900 4250 50  0000 C CNN
F 2 "" H 7900 4400 50  0000 C CNN
F 3 "" H 7900 4400 50  0000 C CNN
	1    7900 4400
	0    1    -1   0   
$EndComp
Wire Wire Line
	7900 4400 8050 4400
$Comp
L ATMEGA328PB IC1
U 1 1 589AB22D
P 4650 4200
F 0 "IC1" H 3900 5450 50  0000 L BNN
F 1 "ATMEGA328PB" H 5050 2800 50  0000 L BNN
F 2 "lib:LQFP-32_7x7mm_Pitch0.8mm" H 4650 4200 50  0000 C CIN
F 3 "" H 4650 4200 50  0000 C CNN
	1    4650 4200
	1    0    0    -1  
$EndComp
$Comp
L C 0.1uF2
U 1 1 589B73F0
P 3500 3550
F 0 "0.1uF2" H 3525 3650 50  0000 L CNN
F 1 "0.1uF" H 3525 3450 50  0001 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 3538 3400 50  0001 C CNN
F 3 "" H 3500 3550 50  0000 C CNN
	1    3500 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR069
U 1 1 589B782B
P 3500 3400
F 0 "#PWR069" H 3500 3150 50  0001 C CNN
F 1 "GND" H 3500 3250 50  0000 C CNN
F 2 "" H 3500 3400 50  0000 C CNN
F 3 "" H 3500 3400 50  0000 C CNN
	1    3500 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 3700 3500 3700
Wire Wire Line
	3100 5000 3750 5000
Connection ~ 3550 5000
Wire Wire Line
	3550 5300 3550 5650
Wire Wire Line
	3550 5650 6450 5650
Wire Wire Line
	3100 5000 3100 2700
Wire Wire Line
	3100 2700 6000 2700
Connection ~ 3100 5000
$Comp
L CONN_01X02 P4
U 1 1 589C3679
P 3300 3900
F 0 "P4" H 3300 4050 50  0000 C CNN
F 1 "CONN_01X02" V 3400 3900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3300 3900 50  0001 C CNN
F 3 "" H 3300 3900 50  0000 C CNN
	1    3300 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 3500 3650 3500
Wire Wire Line
	3650 3500 3650 3850
Wire Wire Line
	3650 3850 3500 3850
Wire Wire Line
	3750 4650 3650 4650
Wire Wire Line
	3650 4650 3650 3950
Wire Wire Line
	3650 3950 3500 3950
$Comp
L CONN_01X02 P7
U 1 1 589C5B27
P 3400 4350
F 0 "P7" H 3400 4500 50  0000 C CNN
F 1 "CONN_01X02" V 3500 4350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3400 4350 50  0001 C CNN
F 3 "" H 3400 4350 50  0000 C CNN
	1    3400 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 3900 3750 4400
Wire Wire Line
	3750 4400 3600 4400
Wire Wire Line
	3600 4300 3700 4300
Wire Wire Line
	3700 4300 3700 4550
Wire Wire Line
	3700 4550 3750 4550
$Comp
L CONN_01X06 P?
U 1 1 589CCFC9
P 7650 3200
F 0 "P?" H 7650 3550 50  0000 C CNN
F 1 "CONN_01X06" V 7750 3200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 7650 3200 50  0001 C CNN
F 3 "" H 7650 3200 50  0000 C CNN
	1    7650 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2950 6150 2950
Wire Wire Line
	7450 3050 6250 3050
Wire Wire Line
	7450 3150 6350 3150
Wire Wire Line
	6350 2800 6350 3600
Wire Wire Line
	6000 3250 7450 3250
Wire Wire Line
	6000 2700 6000 3250
Connection ~ 6350 3150
Connection ~ 6250 3050
Connection ~ 6150 2950
Wire Wire Line
	6450 3400 6450 3700
Wire Wire Line
	6450 3700 5650 3700
Connection ~ 6450 3600
Connection ~ 6750 3650
Connection ~ 7050 3650
$Comp
L RN42XV RN42XV?
U 1 1 589D54CE
P 3750 1450
F 0 "RN42XV?" H 3750 1800 60  0000 C CNN
F 1 "RN42XV" H 3750 1800 60  0001 C CNN
F 2 "lib:RN42XV" H 3750 1450 60  0001 C CNN
F 3 "" H 3750 1450 60  0000 C CNN
	1    3750 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 600  2750 850 
Wire Wire Line
	1450 600  3100 600 
Wire Wire Line
	3100 600  3100 900 
Wire Wire Line
	2050 850  2050 600 
Wire Wire Line
	2150 850  2150 500 
Wire Wire Line
	1350 500  4000 500 
Wire Wire Line
	4000 500  4000 900 
Wire Wire Line
	2250 850  2250 700 
Wire Wire Line
	2250 700  3800 700 
Wire Wire Line
	3800 700  3800 900 
Wire Wire Line
	2350 850  2350 800 
Wire Wire Line
	2350 800  3900 800 
Wire Wire Line
	3900 800  3900 900 
Connection ~ 2750 600 
Connection ~ 2050 600 
Wire Wire Line
	1500 1150 1450 1150
Wire Wire Line
	1450 600  1450 2200
Wire Wire Line
	1450 1850 1500 1850
Wire Wire Line
	1350 1250 1500 1250
Wire Wire Line
	1500 1450 1350 1450
Wire Wire Line
	1500 1750 1350 1750
Wire Wire Line
	1350 500  1350 2300
Connection ~ 2150 500 
Wire Wire Line
	1350 2300 2650 2300
Wire Wire Line
	2650 2300 2650 2150
Connection ~ 1350 1750
Connection ~ 1450 1150
Wire Wire Line
	1450 2200 2750 2200
Wire Wire Line
	2750 2200 2750 2150
Connection ~ 1450 1850
NoConn ~ 3200 900 
NoConn ~ 3300 900 
NoConn ~ 3400 900 
NoConn ~ 3500 900 
NoConn ~ 3600 900 
NoConn ~ 3700 900 
NoConn ~ 4000 1950
NoConn ~ 3900 1950
NoConn ~ 3700 1950
NoConn ~ 3800 1950
NoConn ~ 3600 1950
NoConn ~ 3500 1950
NoConn ~ 3400 1950
NoConn ~ 3300 1950
NoConn ~ 3200 1950
NoConn ~ 3100 1950
$EndSCHEMATC
