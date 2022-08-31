---
title: "Seismic Monitoring for CO2 Carbon Capture Storage with Statistical Machine Learning Approach"
excerpt: "Keywords: Machine Learning, Probabilistic Programming, Sequential Bayesian Infernece, Seismology, Computer Imaging, Carbon Capture Storage (CCS)<br/>"
collection: research
---
Lab: [SLIM](https://slim.gatech.edu/) at Georgia Tech

Using seismic data to simulate carbon (CO2) storage underground is a complicated mathematical and computational process. Recently, the observation and simulation CO2 storage can be solved with performing inverse method on the seismic images of the storage and be optimized by neural network. However, simulating the underground CO2 model at current time is not enough for maintaining the storage at a long-term. The ability of detecting potential leakeage or any danger will be required to ensure the safety of the storage unit. Thus, this project investigate in the development of probablistic programming inferencting architecture with conditional normalizing flow network - a potential tools that could be applied on detecting storage danger incidents in the future.

My tasks for this project include:
* Building statistical neural network classifiers for CO2 leakage detection with Sequential-Bayesian inferencing 
* Utilizing Gen.jl for probabilistic programming to build a stochastic model of the evolution of the CO2 storage in time 
* Training Conditional Normalizing Flow network using the proxy model and seismic observation of the CO2 storage

<img src='/images/slimm.png'>
Figure 1: Simulation of the Carbon Capture Storage by solving fluid flow equation for 100 time steps (each time step is 20 day).

| <img src='/images/SLIM3.png'> | <img src='/images/SLIM2.png'> |

Figure 2: Using the [SLIM Lab's Conditional Normalizing Network](https://github.com/slimgroup/InvertibleNetworks.jl/tree/diff_chan_cond_hint), I set up a sequential-bayesian inference framework to replicate the predator-prey experiment presented by Kruse et al, 2021. The $x4$ is the inferenced target (X) while the observation is $x1~x3$ (Y), and the network will return $x ~ p(X|Y)$.  


Citation:
* Kruse, Jakob, et al. "HINT: Hierarchical invertible neural transport for density estimation andBayesian inference." Proceedings of the AAAI Conference on Artificial Intelligence. Vol. 35.No. 9. 2021.
