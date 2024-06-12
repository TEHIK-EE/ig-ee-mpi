window.addEventListener('load', ev => {
  import('https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs').then(({default: mermaid}) => {
    document.querySelectorAll('pre.language-mermaid').forEach(el => {
      el.outerHTML = `<figure class="mermaid">${el.firstChild.innerText}</figure>`;
    })
    mermaid.run({nodes: document.getElementsByClassName('mermaid')});
  })
})
