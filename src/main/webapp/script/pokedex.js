// gérer l'animation des cartes pokemon
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

// obtenir les valeurs dynamiques pour la glissière de la taille
const heightRange = 1;
let heightSlider = document.getElementById("heightChoice");
let minHeightOutput = document.getElementById("minHeightValue");
let maxHeightOutput = document.getElementById("maxHeightValue");
minHeightOutput.value = heightSlider.value;
maxHeightOutput.value = (parseInt(heightSlider.value) + heightRange).toString();

heightSlider.oninput = function() {
    minHeightOutput.value = this.value;
    maxHeightOutput.value = (parseInt(this.value) + heightRange).toString();
}

// gérer le bouton "+" pour ajouter "un" à la valeur de taille
function add_one_m() {
    let addValue = parseInt(heightSlider.value) + 1;
    heightSlider.value = addValue;
    minHeightOutput.value = addValue.toString();
    maxHeightOutput.value = (addValue + heightRange).toString();
}

// gérer le bouton "-" pour soustraire "un" à la valeur de taille
function subtract_one_m() {
    let subtractValue = parseInt(heightSlider.value) - 1;
    heightSlider.value = subtractValue;
    minHeightOutput.value = subtractValue.toString();
    maxHeightOutput.value = (subtractValue + heightRange).toString();
}

// obtenir les valeurs dynamiques pour la glissière du poids
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

// gérer le bouton "+" pour ajouter "un" à la valeur de poids
function add_one_kg() {
    let addValue = parseInt(weightSlider.value) + 1;
    weightSlider.value = addValue;
    minWeightOutput.value = addValue.toString();
    maxWeightOutput.value = (addValue + weightRange).toString();
}

// gérer le bouton "-" pour soustraire "un" à la valeur du poids
function subtract_one_kg() {
    let subtractValue = parseInt(weightSlider.value) - 1;
    weightSlider.value = subtractValue;
    minWeightOutput.value = subtractValue.toString();
    maxWeightOutput.value = (subtractValue + weightRange).toString();
}
