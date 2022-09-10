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