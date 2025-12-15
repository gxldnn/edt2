num = 0
function postear(){
    let parent = event.target.parentElement;
    num++;
    let art = document.getElementById(parent.id).firstElementChild;
    let post = document.createElement("article");
    let divimg = document.createElement("div");
    let divbox = document.createElement("div");
    divimg.className = "imagentexto";
    divbox.className = "box"
    let content = document.getElementById(parent.id).querySelector("contenttext")
    let name = document.getElementById("name");
    post.className = "post";
    // Creació del contenidor principal 
    art.appendChild(post);

    // Creació dels subcontenidors
    post.appendChild(divimg);
    post.appendChild(divbox);

    // Definim contingut dels subcontenidors 
    let avatar = divimg.appendChild(document.createElement("img"));
    let post_nickname = divimg.appendChild(document.createElement("p"));

    avatar.src = "img/avatar.jpg"
    post_nickname.textContent = name.value

    let postcontent = divbox.appendChild(document.createElement("p"))
    postcontent.textContent = content.value


    
}