---
title: "🗺️ Seismic Monitoring for CO2 Carbon Capture Storage with Statistical Machine Learning Approach"
excerpt: "**Keywords**: Large-scale scientific machine learning, Julia, Probabilistic Programming(Gen.jl), Sequential Bayesian infernece, Seismology, Imaging, Carbon Capture Storage (CCS), conditional normalizing flows, GCS, ML4SEISMIC, monitoring, time-lapse, Uncertainty quantification<br/>"
collection: research
---
Lab: [SLIM](https://slim.gatech.edu/) at Georgia Tech
<br>
Project website: [https://slim.gatech.edu/content/monitoring-sequential-bayesian-inference](https://slim.gatech.edu/content/monitoring-sequential-bayesian-inference)

**Abstract:** For this study, we apply sequential Bayesian inference to monitor the time evolution of subsurface flow of CO2 from indirect acoustic measurements at the surface. Upon receiving new acoustic measurements, we infer the current state of the CO2 by sampling from a learned posterior. Using the incoming data, we then perform online updates of the current posterior. This is accomplished by using the fluid flow model to advance the estimated state variable forward in time in order to update the learned posterior. With a synthetic experiment, we demonstrate this method can track the flow evolution accurately as measured by PSNR metrics. Since the posterior is a learned network, we can compute estimates faster than traditional least squares methods. This method can also quantify the uncertainty due to stochasticity in fluid flow model and the limited-azimuth imaging configuration.

<br>

**ML4Seismic Talk:**
Ting-Ying Yu. “Monitoring CO2 Plume with Sequential Bayesian Inference”. In: <i>The 2022 ML4Seismic Industry Partners Meeting</i>. Nov 2022. 
<br>
Youtube Recording: [[link]](https://youtu.be/RTF7atvKNA0)
<br>
<object data='/files/Thu-15-10-Yu.pdf' width="700px" height="400px">
    <embed src='/files/Thu-15-10-Yu.pdf'>
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href='/files/Thu-15-10-Yu.pdf'>Download PDF</a>.</p>
    </embed>
</object>
                                                                                                                    
<br>                                                                                                               

**InvertibleNetworks.jl training results:**
<br>
Examples of the InvertibleNetworks performance on MNIST dataset: [https://github.com/slimgroup/InvertibleNetworks.jl/tree/cond_mnist](https://github.com/slimgroup/InvertibleNetworks.jl/tree/cond_mnist)
<img src='/images/train_001.png'>
<img src='/images/train_002.png'>
<br>
                                
**Probablistic Programming:**
<br>

<p>(a) <img src='/images/SLIM3.png'> </p>
<p>(b) <img src='/images/SLIM2.png'> </p>

Using the [SLIM Lab's Conditional Normalizing Network](https://github.com/slimgroup/InvertibleNetworks.jl/tree/diff_chan_cond_hint), I set up a sequential-bayesian inference framework to replicate the predator-prey experiment presented by Kruse et al, 2021. The $x4$ is the inferenced target (X) while the observation is $x1 \sim x3$ (Y), and the network will return $x \sim p(X\|Y)$. The training network that is conditioned on the observations has a decrease in error. 


Citation:
* Kruse, Jakob, et al. "HINT: Hierarchical invertible neural transport for density estimation andBayesian inference." Proceedings of the AAAI Conference on Artificial Intelligence. Vol. 35.No. 9. 2021.
