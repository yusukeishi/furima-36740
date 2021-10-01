window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  
    const addTaxDom = document.getElementById("add-tax-price");
    const ProfitDom = document.getElementById("profit");

    // どこの処理かわかる為、販売手数料(10%)部分, 入力した金額をもとに販売手数料を計算する処理
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    // どこの処理かわかる為, 販売利益部分, 出品価格から販売手数料を引く処理
    ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
    })
});
