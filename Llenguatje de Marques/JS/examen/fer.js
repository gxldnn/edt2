let llista_estatica = document.getElementsByTagName("li")
let tasquesfetes = document.getElementsByClassName("fet").length
document.getElementById("nombreFetes").textContent = tasquesfetes

for (let tasca of llista_estatica) {
    let boto_fet = document.createElement("button");
    let boto_borrar = document.createElement("button");

    boto_fet.textContent = "✅"
    boto_borrar.textContent = "🗑️"

    boto_fet.onclick = function () {
        const clase = tasca.classList
        clase.toggle("fet")

        let tasquesfetes = document.getElementsByClassName("fet").length
        document.getElementById("nombreFetes").textContent = tasquesfetes
    }
    boto_borrar.onclick = function () {
        tasca.remove()
        let tasquesfetes = document.getElementsByClassName("fet").length
        document.getElementById("nombreFetes").textContent = tasquesfetes
    }

    tasca.appendChild(boto_fet)
    tasca.appendChild(boto_borrar)
}

function afegir(){
    let llista = document.getElementById("llista")
    let novatasca = document.createElement("li")
    let textintroduit = document.getElementById("tasca")
    let boto_fet = document.createElement("button");
    let boto_borrar = document.createElement("button");

    boto_fet.textContent = "✅"
    boto_borrar.textContent = "🗑️"

    novatasca.textContent = textintroduit.value
    llista.appendChild(novatasca)
    novatasca.appendChild(boto_fet)
    novatasca.appendChild(boto_borrar)

    boto_fet.onclick = function () {
        const clase = novatasca.classList
        clase.toggle("fet")
        let tasquesfetes = document.getElementsByClassName("fet").length
        document.getElementById("nombreFetes").textContent = tasquesfetes
    }
    boto_borrar.onclick = function () {
        novatasca.remove()
        let tasquesfetes = document.getElementsByClassName("fet").length
        document.getElementById("nombreFetes").textContent = tasquesfetes
    }

}

