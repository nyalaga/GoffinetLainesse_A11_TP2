const pokeballBottoms = document.querySelectorAll(".pkb-bottom");
const pokeballTops = document.querySelectorAll(".pkb-top");
const pokemons = document.querySelectorAll(".pokemon");
console.log(pokeballTops, pokeballBottoms, pokemons)

for (let i = 0; i < pokemons.length; i++) {
    pokeballBottoms[i].addEventListener("click", () => openPokeball(i));
    pokeballTops[i].addEventListener("click", () => openPokeball(i));
    pokemons[i].addEventListener("click", () => openPokeball(i));
}

function openPokeball(i) {
    let pkb = pokeballBottoms[i];
    if (pkb.classList.contains("pkb-disabled")) {
        return
    }
    if (pkb.classList.contains("animatePokeballBottomClose") || !pkb.classList.contains("animatePokeballBottomOpen")) {
        //Remove the close animation classes
        pkb.classList.remove("animatePokeballBottomClose")
        pokemons[i].classList.remove("animatePokeballPokemonClose")
        //Add the open animation classes
        pkb.classList.add("animatePokeballBottomOpen");
        pokemons[i].classList.add("animatePokeballPokemonOpen");
    } else {
        //Remove the open animation classes
        pkb.classList.remove("animatePokeballBottomOpen");
        pokemons[i].classList.remove("animatePokeballPokemonOpen");
        //Add the close animation classes
        pkb.classList.add("animatePokeballBottomClose");
        pokemons[i].classList.add("animatePokeballPokemonClose");
    }
}