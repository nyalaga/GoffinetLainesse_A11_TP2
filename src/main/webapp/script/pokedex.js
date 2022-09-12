const pokedexCards = document.querySelectorAll(".pokedex-card-inner");

for (const card of pokedexCards) {
    card.addEventListener("mouseover", evt => {
        let c = evt.currentTarget;
        //Remove the close animation classes
        c.classList.remove("animatePokedexCardShrink")
        //Add the open animation classes
        c.classList.add("animatePokedexCardExpand");
    })
    card.addEventListener("mouseout", evt => {
        let c = evt.currentTarget;
        //Remove the close animation classes
        c.classList.remove("animatePokedexCardExpand")
        //Add the open animation classes
        c.classList.add("animatePokedexCardShrink");
    })
}

var heightSlider = document.getElementById("heightChoice");
var output = document.getElementById("heightValue");
output.innerHTML = heightSlider.value;

heightSlider.oninput = function() {
    output.innerHTML = this.value;
}
