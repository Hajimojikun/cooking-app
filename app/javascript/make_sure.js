const load = ()=>{
if(document.getElementById("food_type_of_food_id")){
const select = document.getElementById("food_type_of_food_id");
const submit = document.getElementById("submit-btn");
const div = document.getElementById("random-title");
const html_p = '<p> 食べのもの種類を選択してください</p>';



submit.addEventListener('click', (e)=>{
  if(select.value == 1){
  e.preventDefault();
  if(document.querySelector("p")){
  document.querySelector("p").remove();
  };
  div.insertAdjacentHTML("beforeend", html_p);
  document.querySelector("p").style.color = "#FF0000"
  };
});


};
};

window.addEventListener('DOMContentLoaded', load)