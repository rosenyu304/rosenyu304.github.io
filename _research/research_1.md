---
title: "Asymmetrical Venus Coronae - 3D Thermal-Mechanical Modeling"
excerpt: "Keywords: Computer Simulation, Paraview, GMT, Bash<br/>"
collection: research
---
Lab: Dr. [Taras Gerya](http://jupiter.ethz.ch/~tgerya/)'s team of [Geophysical Fluid Dynamics goup at ETH Zurich's Institute of Geophysics](https://geophysics.ethz.ch/research/groups/gfd.html)

Venus is the closest planetary neighbor of Earth and is often called its twin planet. Even though Earth and Venus have similar size, density, and interior composition (Solomon et al., 1982), they own drastically different atmospheres and interior dynamics (Phillips, 1990). It is commonly thought that upwelling columns of hot mantle material (plumes) result in diverse volcanic styles, which form various volcanic structures at Venus' surface (Nimmo and McKenzie, 1998). The unique surface deformation and volcanism on Venus are believed to be one of the reasons why Earth has become an oasis while Venus remains inhabitable. One of the unique volcanic features on Venus is coronae – a large, circular to elongated structure located on the Venusian surface (Stofan et al., 1991) that is associated with volcanic and tectonic features (Gerya et al., 2015). They feature a variety of sizes, shapes, and morphologies. Multiple theories explain their formation, most of which propose that they are a response to an upwelling mantle plume, followed by gravitational relaxation due to magma withdrawal (Stofan et al., 1991). As coronae appearances are related to the motions of deep material underneath (mantle convection), these structures might be the key to understanding Venus’ tectonics and surface evolution. 

The overall goal of this research is to study asymmetrical corona structures' formation by simulating the mantle's interaction with a heterogeneous Venusian lithosphere and thermal profile. Previously, Stadler et al. (2019) ran 10 models to investigate this phenomenon and concluded that a variation of the crustal thickness results in asymmetrical plume penetration and asymmetrical coronae morphology. They found that the thermal profile and plume positioning are the critical factors affecting the resulting corona structure at the surface. To better examine the effect of these individual parameters, this project will supplement Stadler's study (2019) by running more numerical models using additional parameters that affect plume-lithosphere interaction and datasets representing different physics behind the coronae formation. 


# 1. Asymmetrical Coronae Classification
<img src='/images/venus1.png'>
Fig 1. Global distribution of coronae identified as symmetric or asymmetric subclasses. A Mollweide projection centered at  60° E is utilized in both images. Coronae are plotted on (A) the global topography relative to 6051.877 km (Sandwell, 2015; Gülcher, 2018) and (B) the Venus crustal thickness (Weiczorek, 2015). A complete record of classifications for all 130 coronae is provided in Table 2 in the supplementary section. 
<img src='/images/venus2.png'>
Fig 2. Topography of Venus coronae classified as each class. 
(A) Aramaiti coronae, an example of symmetric coronae located at [-26.3°, 82°] with a diameter of 350km. (B) Juksakka coronae, an example of asymmetric coronae of margin subclass located at [-19.5°, 44.5°] with a diameter of 320km. (C) Ereshkigal coronae, an example of asymmetric coronae of intrinsic subclass located at [21°, 84.5°] with a diameter of 320km. (D) Marzyana coronae, an example of asymmetric coronae of angular subclass located at [-53°, 67.5°] with a diameter of 350km. (E) Obiemi coronae, an example of asymmetric coronae of angular subclass located at [-31.9°, 276.6°] with a diameter of 300km. (F) Ceres coronae, an example of asymmetric coronae of elongated subclass located at [-16°, 151.5°] with a diameter of 675km.

# 2. Simulation Results
<img src='/images/venus_0.png'>
Fig 3. Hand drawings of model dimensions. The models varies in their crutal thickness, transition length, and thermal profile of the lithosphere. Details of each model's structural geometry are provided in the supplementary Table 1. 

<img src='/images/result_lh2040mB_1.png'>
Fig 4. Lowland Trench Formation. Results of model "lh2040mB" with crustal heterogeneity and crustal thickness of 20-40km and 100km transition. The upper and middle rows show the snapshots of composition in 3D and 2D with temperature. The bottom row displays the surface topography of coronae. 

<img src='/images/result_lth2040mB_1.png'>
Fig 5. Plateau Trench Formation. Results of model "lth2040mB" with thermal heterogeneity and crustal thickness of 20-40km and 100km transition. The upper and middle rows show the snapshots of composition in 3D and 2D with temperature. The bottom row displays the surface topography of coronae. 

<img src='/images/Fig_lh_lth_40_B_C.png'>
Fig 6. Composition and topography of the coronae development from the numerical model group of 20-40km crustal heterogeneity and variation in transition length and thermal heterogeneity. (A), (B) shows merely the effect of crustal heterogeneity (lh-), resulting in coronae with a trench on the lowland side.  With the thermal heterogeneity in (C) and (D), a different pattern of the asymmetry of coronae is demonstrated with a trench on the plateau side.



