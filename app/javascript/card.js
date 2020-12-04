const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById('card');
  console.log(form)
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById('card');
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("card");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
    }

    document.getElementById("card-number").removeAttribute("name");
    document.getElementById("card-cvc").removeAttribute("name");
    document.getElementById("card-exp-month").removeAttribute("name");
    document.getElementById("card-exp-year").removeAttribute("name");

    document.getElementById("card").submit();

    });
  });
};
window.addEventListener("load", pay);