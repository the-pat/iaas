document.addEventListener("DOMContentLoaded", () => {
  const textInput = document.getElementById("text");
  const sizeInput = document.getElementById("size");
  const identicon = document.getElementById("identicon");
  const caption = document.getElementById("caption");

  let textTimeout = null;

  const updateImage = () => {
    const text = textInput.value;
    const encodedText = encodeURI(text);
    const size = sizeInput.value;

    identicon.src = `/${encodedText}/${size}/identicon.png`;
    identicon.alt = `A ${size}x${size} identicon from '${text}'`;
    caption.innerHTML = `A ${size}x${size} identicon from <strong>${text}</strong>`;
  };

  textInput.addEventListener("keyup", () => {
    if (textTimeout) clearTimeout(textTimeout);
    textTimeout = setTimeout(() => {
      updateImage();
    }, 300);
  });

  sizeInput.addEventListener("change", () => {
    updateImage();
  });
});
