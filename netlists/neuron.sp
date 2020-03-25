Neuron cell with a steep hyperbolic tangent activation function to mimic a sign activation function

vdd	vdd	0	3.3

*vin	vin	vcm	PWL(1u 0.15)	ac	1	0
vin	vin	vcm	pulse(0.6	-0.6	0.3u	5n	5n	495n	1000n)		******Ideal range: -0.6 to 0.6
*vin	vin	vcm	-0.0									******Frequency: 1 MHz

vcm	vcm	0	2.3

iq	vdd	7	2u

*cout	2	vcm	0p
r11	2	vcm	0

*cc1	2	15	30f
*cc2	12	1	30f

**** Tanh stage
m1	1	12	3	0	nch	l=0.35u	w=1u
m2	2	15	3	0	nch	l=0.35u	w=1u

m3	1	1	vdd	vdd	pch	l=0.35u	w=3u
m4	2	1	vdd	vdd	pch	l=0.35u	w=3u

m5	3	4	0	0	nch	l=0.35u	w=2u
**** Bias circuit
m6	7	7	4	0	nch	l=0.35u	w=1u
m7	4	4	0	0	nch	l=0.35u	w=1u
m8	10	10	vdd	vdd	pch	l=0.35u	w=3u
m9	9	9	10	10	pch	l=0.35u	w=3u
m10	9	7	8	0	nch	l=0.35u	w=1u
m11	8	4	0	0	nch	l=0.35u	w=1u
**** Gain stage
m12	13	17	vdd	vdd	pch	l=0.35u	w=3u
m13	12	9	13	13	pch	l=0.35u	w=3u
m14	12	7	11	0	nch	l=0.35u	w=1u
m15	11	4	0	0	nch	l=0.35u	w=1u
m16	16	18	vdd	vdd	pch	l=0.35u	w=3u
m17	15	9	16	16	pch	l=0.35u	w=3u
m18	15	7	14	0	nch	l=0.35u	w=1u
m19	14	4	0	0	nch	l=0.35u	w=1u
m20	17	vin	19	0	nch	l=0.35u	w=1u
m21	18	2	19	0	nch	l=0.35u	w=1u
m22	19	4	0	0	nch	l=0.35u	w=2u
m23	17	17	vdd	vdd	pch	l=0.35u	w=3u
m24	18	18	vdd	vdd	pch	l=0.35u	w=3u


.op
.option post

.dc	vin	-0.6	0.6	0.01
.tran	10p	5u
.print	tran	i(cout)	i(m2)	i(m1)	i(m4) i(m5) i(m6) i(m13) i(m14) i(m15) i(m7) i(m8) i(m9) i(m10) i(m11) i(m13) i(m15) i(m16) i(m17) i(m18) i(m19)
.print	dc	i(r11)	i(m2)	i(m1)	i(m4) i(m5) i(m6) i(m13) i(m14) i(m15) i(m7) i(m8) i(m9) i(m10) i(m11) i(m13) i(m15) i(m16) i(m17) i(m18) i(m19)
	
.lib 'mm0355v.l' tt

.end