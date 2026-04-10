---
layout: page
permalink: /publications/
title: publications
description: peer-reviewed publications in reverse chronological order.
nav: true
nav_order: 1
---

<!-- Toggle buttons -->
<div class="pub-toggle" style="margin-bottom: 1.5rem;">
  <button id="btn-selected" class="btn btn-sm" onclick="showSelected()" style="background-color: var(--global-theme-color); color: white; border: none; padding: 0.4rem 1rem; border-radius: 4px; cursor: pointer; margin-right: 0.5rem;">
    selected publications
  </button>
  <button id="btn-all" class="btn btn-sm" onclick="showAll()" style="background-color: transparent; color: var(--global-theme-color); border: 1px solid var(--global-theme-color); padding: 0.4rem 1rem; border-radius: 4px; cursor: pointer;">
    all publications
  </button>
</div>

<!-- Selected publications (shown by default) -->
<div id="selected-pubs" class="publications">
  {% bibliography --query @*[selected=true]* %}
</div>

<!-- All publications (hidden by default) -->
<div id="all-pubs" class="publications" style="display: none;">
  {% bibliography %}
</div>

<script>
function showSelected() {
  document.getElementById('selected-pubs').style.display = 'block';
  document.getElementById('all-pubs').style.display = 'none';
  var btnSel = document.getElementById('btn-selected');
  var btnAll = document.getElementById('btn-all');
  btnSel.style.backgroundColor = 'var(--global-theme-color)';
  btnSel.style.color = 'white';
  btnSel.style.border = 'none';
  btnAll.style.backgroundColor = 'transparent';
  btnAll.style.color = 'var(--global-theme-color)';
  btnAll.style.border = '1px solid var(--global-theme-color)';
}
function showAll() {
  document.getElementById('selected-pubs').style.display = 'none';
  document.getElementById('all-pubs').style.display = 'block';
  var btnSel = document.getElementById('btn-selected');
  var btnAll = document.getElementById('btn-all');
  btnAll.style.backgroundColor = 'var(--global-theme-color)';
  btnAll.style.color = 'white';
  btnAll.style.border = 'none';
  btnSel.style.backgroundColor = 'transparent';
  btnSel.style.color = 'var(--global-theme-color)';
  btnSel.style.border = '1px solid var(--global-theme-color)';
}
</script>
