function price_calc() {
  // 手順1 操作する要素の取得
  const inputPrice = document.getElementById("item-price")
  // 手順2 イベント発火の条件設定
  inputPrice.addEventListener('input',()=>{
    // 手順3 必要なvalue属性を取得する
    const inputValue = inputPrice.value;
    // 手順4 出力先にhtmlを作成してinnerHTMLで返す
    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    const fee = Math.floor(inputValue * 0.1) // 小数点の整理するメソッド
    addTaxPrice.innerHTML = `${fee}` // <span>ココの値</span>
    profit.innerHTML = `${inputValue - fee}`
  })
}

window.addEventListener('load',price_calc)