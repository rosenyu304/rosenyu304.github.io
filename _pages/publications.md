---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

<!-- {% if author.googlescholar %} -->
  Find my articles on <u><a href="https://scholar.google.com/citations?user=z0M1YNgAAAAJ&hl=en">my Google Scholar profile</a>.</u>
<!-- {% endif %} -->

{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}

<!-- Thesis
==========

**Deformation of fire ant rafts under uniform flow**
* Ting-Ying Yu. Georgia Tech Research Option Undergraduate Thesis. 2021. 
<br>
<object data='/files/Undergraduate Research Thesis.pdf' width="700px" height="400px">
    <embed src='/files/Undergraduate Research Thesis.pdf'>
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href='/files/Undergraduate Research Thesis.pdf'>Download PDF</a>.</p>
    </embed>
</object> -->
