function post (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const inputPrice = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");    
    addTaxPrice.innerHTML = (Math.floor(inputPrice * 0.1));
    const profit = document.getElementById("profit");
    profit.innerHTML = (Math.floor(inputPrice - addTaxPrice.innerHTML));
	});
 };
 
 window.addEventListener('load', post);