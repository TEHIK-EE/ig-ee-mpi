window.addEventListener('load', ev => {
  document.getElementById('gcse-box').innerHTML = `<iframe id="gcse" width="100%" height="700" style="border: none;"></iframe>`

  setTimeout(() => {
    const iframe = document.getElementById('gcse');
    if (!iframe) {
      return;
    }
    iframe.onload = () => {
      const doc = iframe.contentDocument || iframe.contentWindow.document;

      doc.open();
      // generated with https://programmablesearchengine.google.com/
      doc.write(`<script async src="https://cse.google.com/cse.js?cx=c5817fbfefdcc42ef"></script><div class="gcse-search"></div>`);
      doc.close();
    };
    iframe.src = 'about:blank';
  });

});
