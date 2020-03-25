Weighted order statistics filter set to work as a median filter

.global vdd

vdd	vdd	0	3.3

v1	v1	vcm	pulse(-0.4	0.0	0.3u	5n	5n	495n	1000n)	
v2	v2	vcm	pulse(-0.37	0.2	0.3u	5n	5n	495n	1000n)
v3	v3	vcm	pulse(-0.3	-0.5	0.3u	5n	5n	495n	1000n)		*****range: -0.5 to 0.5
v4	v4	vcm	pulse(-0.25	0.43	0.3u	5n	5n	495n	1000n)		*****frequency: 1MHz
v5	v5	vcm	pulse(-0.15	0.4	0.3u	5n	5n	495n	1000n)
v6	v6	vcm	pulse(0.1	-0.1	0.3u	5n	5n	495n	1000n)
v7	v7	vcm	pulse(0.3	-0.17	0.3u	5n	5n	495n	1000n)
v8	v8	vcm	pulse(0.4	0.15	0.3u	5n	5n	495n	1000n)
v9	v9	vcm	pulse(0.44	-0.15	0.3u	5n	5n	495n	1000n)

ip	vdd	a2	0u	***** for iq=2u =>  max: ip=50u & min: ip=-60u

x1	v1	a2	sigfunc
x2	v2	a2	sigfunc
x3	v3	a2	sigfunc
x4	v4	a2	sigfunc
x5	v5	a2	sigfunc
x6	v6	a2	sigfunc
x7	v7	a2	sigfunc
x8	v8	a2	sigfunc
x9	v9	a2	sigfunc

cout	a2	vcm	3p

vcm	vcm	0	2.3

.subckt	sigfunc	vin	a2

iq	vdd	7	2u

*cc1	a2	15	10f
*cc2	12	1	10f

**** Tanh stage
m1	1	12	3	0	nch	l=0.35u	w=1u
m2	a2	15	3	0	nch	l=0.35u	w=1u

m3	1	1	vdd	vdd	pch	l=0.35u	w=3u
m4	a2	1	vdd	vdd	pch	l=0.35u	w=3u

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
m21	18	a2	19	0	nch	l=0.35u	w=1u
m22	19	4	0	0	nch	l=0.35u	w=2u
m23	17	17	vdd	vdd	pch	l=0.35u	w=3u
m24	18	18	vdd	vdd	pch	l=0.35u	w=3u

.ends


.op
.option post

.dc	v1	-0.5	0.5	0.01
.tran	10p	5u
.print	tran	i(cout)	i(m2)	i(m1)	i(m4) i(m5) i(m6) i(m13) i(m14) i(m15) i(m7) i(m8) i(m9) i(m10) i(m11) i(m13) i(m15) i(m16) i(m17) i(m18) i(m19)
.print	dc	i(cout)	i(m2)	i(m1)	i(m4) i(m5) i(m6) i(m13) i(m14) i(m15) i(m7) i(m8) i(m9) i(m10) i(m11) i(m13) i(m15) i(m16) i(m17) i(m18) i(m19)
	
.lib 'mm0355v.l' tt
*.alter
*.lib 'mm0355v.l' ff
*.alter
*.lib 'mm0355v.l' fs
*.alter
*.lib 'mm0355v.l' sf
*.alter
*.lib 'mm0355v.l' ss
*.alter
*.temp=125
*.alter
*.temp=-40

.end