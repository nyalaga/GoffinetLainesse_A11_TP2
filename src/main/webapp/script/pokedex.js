// gérer l'animation des cartes pokemon
const pokedexCards = document.querySelectorAll(".pokedex-card-inner");
const btnCheckout = document.querySelector(".btn-checkout");

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
    const arrayOfChildren = Array.from(card.children);
    arrayOfChildren.forEach((item) => {
        item.addEventListener("click", evt => {
            let classes = card.classList
            let pkm = card.querySelector("[name=pkm-name]")
            console.log(pkm.textContent.trim())
                $.get("ServletTransaction?pkm=" + pkm.textContent.trim() + "&sel=" + classes.contains("selected")).done(function (data) {
                    console.log(data, typeof data)
                    const answer = JSON.parse(data);
                    console.log(answer, typeof answer)
                    let isTrue = answer.isAdded;
                    let isEmpty = answer.isEmpty;
                    console.log(isTrue, typeof isTrue)
                    if (isTrue) {
                        classes.add("selected");
                    } else if (!isTrue) {
                        classes.remove("selected");
                    } else {
                        console.warn("Returned data isn't 0 or 1")
                    }
                    if (isEmpty) {
                        btnCheckout.classList.add("btn-menu-disabled")
                    } else {
                        btnCheckout.classList.remove("btn-menu-disabled")
                    }
                })
            //}
        })
    })
}

// diriger la sélection vers la page
function followLink() {
    let link = document.getElementById("dataMan");
    window.location = link.value;
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
