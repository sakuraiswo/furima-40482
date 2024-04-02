function calculation_fee (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(itemPrice.value/10);
    Profit.innerHTML = Math.floor(itemPrice.value/10*9);
  });

};
window.addEventListener('turbo:load', calculation_fee);