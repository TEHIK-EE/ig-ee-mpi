window.addEventListener('load', () => {
    document.querySelectorAll('pre.language-drawio').forEach(el => {
      el.outerHTML = `<figure class="drawio"><img src="data:image/svg+xml;base64, ${el.innerText}"></figure>`
    })
  })
  