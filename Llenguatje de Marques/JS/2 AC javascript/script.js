num = 0
function postear(){
    num++;
    let art1 = document.getElementById("a1");
    let post = document.createElement("article");
    let divimg = document.createElement("div");
    let divbox = document.createElement("div");
    let content = document.getElementById("contenttext");
    let name = document.getElementById("name");
    let postid = post.id = "postnew" + num;
    post.className = "post";
    divimg.className = "imagentexto";
    let divimgid = divimg.id = "img" + num;
    divbox.className = "box"
    let divboxid = divbox.id = "box" + num;
    
    // Creació del contenidor principal 
    art1.appendChild(post);

    // Creació dels subcontenidors i subcontenidors
    let lastpost = document.getElementById(postid)

    lastpost.appendChild(divimg)
    lastpost.appendChild(divbox)

    // Definim contingut del post (subcontenidors)
    let avatar = document.getElementById(divimgid).appendChild(document.createElement("img"));
    let post_nickname = document.getElementById(divimgid).appendChild(document.createElement("p"));

    avatar.src = "img/avatar.jpg"
    post_nickname.textContent = name.value

    let postcontent = document.getElementById(divboxid).appendChild(document.createElement("p"))
    postcontent.textContent = content.value

}