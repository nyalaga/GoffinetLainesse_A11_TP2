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
const heightRange = 1;
let heightSlider = document.getElementById("heightChoice");
let minHeightOutput = document.getElementById("minHeightValue");
let maxHeightOutput = document.getElementById("maxHeightValue");
minHeightOutput.innerHTML = heightSlider.value;
maxHeightOutput.innerHTML = (parseInt(heightSlider.value) + heightRange).toString();

heightSlider.oninput = function() {
    minHeightOutput.innerHTML = this.value;
    maxHeightOutput.innerHTML = (parseInt(this.value) + heightRange).toString();
}

function add_one_m() {
    let addValue = parseInt(heightSlider.value) + 1;
    heightSlider.value = addValue;
    minHeightOutput.innerHTML = addValue.toString();
    maxHeightOutput.innerHTML = (addValue + heightRange).toString();
}

function subtract_one_m() {
    let subtractValue = parseInt(heightSlider.value) - 1;
    heightSlider.value = subtractValue;
    minHeightOutput.innerHTML = subtractValue.toString();
    maxHeightOutput.innerHTML = (subtractValue + heightRange).toString();
}

// dynamic value for the weight
const weightRange = 10;
let weightSlider = document.getElementById("weightChoice");
let minWeightOutput = document.getElementById("minWeightValue");
let maxWeightOutput = document.getElementById("maxWeightValue");
minWeightOutput.value = weightSlider.value;
maxWeightOutput.value = (parseInt(weightSlider.value) + weightRange).toString();

weightSlider.oninput = function() {
    minWeightOutput.value = this.value;
    maxWeightOutput.value = (parseInt(this.value) + weightRange).toString();
}

function add_one_kg() {
    let addValue = parseInt(weightSlider.value) + 1;
    weightSlider.value = addValue;
    minWeightOutput.value = addValue.toString();
    maxWeightOutput.value = (addValue + weightRange).toString();
}

function subtract_one_kg() {
    let subtractValue = parseInt(weightSlider.value) - 1;
    weightSlider.value = subtractValue;
    minWeightOutput.value = subtractValue.toString();
    maxWeightOutput.value = (subtractValue + weightRange).toString();
}
