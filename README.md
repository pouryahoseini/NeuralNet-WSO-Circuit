# Neural Network CMOS Circuit as a Weighted Order Statistic Filter

This is a hardware implementation of weighted order statistic (WOS) filter in CMOS 0.35 &#956;m process using a specific recurrent neural network. Weighted order statistic filters can select *k*^th^ largest value of a statistical sample with sample points being repeated based on their weight. Maximum, minimum, and median are special cases in their operation. One of their main applications is in signal processing and specifically in noise removal. 

## Description
The detailed description of the project can be found in our paper: [pdf](./project_description/2010-ICEDSA-NN-WOS) or [IEEE Xplore](https://doi.org/10.1109/ICEDSA.2010.5503078). 
An analog circuit resembling a recurrent neural network is implemented in the project:

![Weighted order statistic neural network](./project_description/nn.tif "Weighted order statistic neural network")

Each neuron in the first layer is designed to have a sign activation function, for which the circuit diagram is as follows:

![Circuit of each neuron in the first layer](./project_description/sign.tiff "Circuit of each neuron in the first layer")

Thanks to the Kirchhoff's Current Law (KCL), the neuron in the second layer is made only by connecting the outputs of the first layer neurons and a current source (as the bias). The integrated circuit (IC) layout of the neuron is shown below:

![Layout of the first layer neuron](./project_description/layout.tiff "Layout of the first layer neuron")

As an illustration the results of applying the weighted order statistic filter on a few signals to find their max, min, and median can be seen here:

![WOS filter working as a max filter](./project_description/max-tran.tif "WOS filter working as a max filter")

![WOS filter working as a min filter](./project_description/min-tran.tif "WOS filter working as a min filter")

![WOS filter working as a median filter](./project_description/median-tran.tif "WOS filter working as a median filter")

## The Code
The WOS network is implemented in HSPICE for simulation in CMOS 0.35 &#956;m process. In the time of the original simulations, a TSMC 0.35 &#956;m library file was used. You may use other libraries, probably with some minor alterations. The files include a netlist of the proposed neuron in the project, and a sample netlist to showcase the filter working as a median operator. The latter can be changed to any other weighted order statistic filter, based on the explanations of the aforementioned paper. It performs a range of DC, transient, and corner tests.

# Citation
You may cite the [paper](https://doi.org/10.1109/ICEDSA.2010.5503078) published as a part of this project.

# Contact
I can be reached at hoseini@nevada.unr.edu.
