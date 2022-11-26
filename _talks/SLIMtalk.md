---
title: "Monitoring with sequential Bayesian Inference"
collection: talks
type: "Conference proceedings talk"
permalink: /talks/SLIMtalk
venue: "ML4Seismics Partners Meeting"
date: 2022-11-17
location: "Atlanta, GA"
---

This is my talk on "Monitoring with sequential Bayesian Inference" at Machine Learning for Seismic Partners Meeting. 
	
For this study, we apply sequential Bayesian inference to monitor the time evolution of subsurface flow of CO2 from indirect acoustic measurements at the surface. Upon receiving new acoustic measurements, we infer the current state of the CO2 by sampling from a learned posterior. Using the incoming data, we then perform online updates of the current posterior. This is accomplished by using the fluid flow model to advance the estimated state variable forward in time in order to update the learned posterior. With a synthetic experiment, we demonstrate this method can track the flow evolution accurately as measured by PSNR metrics. Since the posterior is a learned network, we can compute estimates faster than traditional least squares methods. This method can also quantify the uncertainty due to stochasticity in fluid flow model and the limited-azimuth imaging configuration.


<object data='/files/Thu-15-10-Yu.pdf' width="700px" height="400px">
    <embed src='/files/Thu-15-10-Yu.pdf'>
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href='/files/Thu-15-10-Yu.pdf'>Download PDF</a>.</p>
    </embed>
</object>
