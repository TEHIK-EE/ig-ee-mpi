window.addEventListener('load', ev => {
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
