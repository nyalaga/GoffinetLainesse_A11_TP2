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

// dynamic value for the height
let heightSlider = document.getElementById("heightChoice");
let heightOutput = document.getElementById("heightValue");
heightOutput.innerHTML = heightSlider.value;

heightSlider.oninput = function() {
    heightOutput.innerHTML = this.value;
}

function add_one_m() {
    let addValue = parseInt(heightSlider.value) + 1;
    heightSlider.value = addValue;
    heightOutput.innerHTML = addValue.toString();
}

function subtract_one_m() {
    let subtractValue = parseInt(heightSlider.value) - 1;
    heightSlider.value = subtractValue;
    heightOutput.innerHTML = subtractValue.toString();
}

// dynamic value for the weight
let weightSlider = document.getElementById("weightChoice");
let weightOutput = document.getElementById("weightValue");
weightOutput.innerHTML = weightSlider.value;

weightSlider.oninput = function() {
    weightOutput.innerHTML = this.value;
}

function add_one_kg() {
    let addValue = parseInt(weightSlider.value) + 1;
    weightSlider.value = addValue;
    weightOutput.innerHTML = addValue.toString();
}

function subtract_one_kg() {
    let subtractValue = parseInt(weightSlider.value) - 1;
    weightSlider.value = subtractValue;
    weightOutput.innerHTML = subtractValue.toString();
}
