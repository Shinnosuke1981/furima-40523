const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
})

const addTaxDom = document.getElementById("add-tax-price");
addTaxDom.innerHTML = inputValue * 0.1;

const addTaxDom = document.getElementById("profit");
addTaxDom.innerHTML = inputValue * 1.1;